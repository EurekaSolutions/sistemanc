<?php

/**
 * This is the model class for table "public.proyectos".
 *
 * The followings are the available columns in table 'public.proyectos':
 * @property string $proyecto_id
 * @property string $nombre
 * @property string $codigo
 * @property string $ente_organo_id
 * @property integer $anho
 *
 * The followings are the available model relations:
 * @property EntesOrganos $enteOrgano
 * @property PresupuestoPartidas[] $presupuestoPartidases
 */
class Proyectos extends ActiveRecord
{
	public $partida;
	public $general;
	public $monto;
	public $fuente;
	public $nombreid;
	public $especifica;
	public $subespecifica;


	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{

		return $this->obtenerSchema().'.proyectos';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('nombre, codigo, ente_organo_id', 'required', 'on' => 'create'),
			array('codigo', 'unique', 'attributeName'=> 'codigo', 'caseSensitive' => 'false', 'className' => 'Proyectos', 'on' => 'create'),
			//array('nombreid, partida, general, monto, fuente, especifica', 'required', 'on' => 'creaproyecto, creaproyectose'),
			array('nombreid, partida, general, especifica', 'required', 'on' => 'creaproyecto, creaproyectose'),
			//array('monto', 'numerical', 'integerOnly'=>false, 'min'=>1),
			array('monto,fuente','safe'),
			array('codigo', 'length', 'max'=>20),
			array('proyecto_id', 'required', 'on' => 'anadir'),
			array('nombre', 'proyectounico', 'on'=>'create'),
			array('especifica', 'partidaAsignada', 'on'=>'creaproyecto'),
			array('subespecifica', 'partidaAsignada', 'on'=>'creaproyectose'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('proyecto_id, nombre, codigo, ente_organo_id, anho', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'enteOrgano' => array(self::BELONGS_TO, 'EntesOrganos', 'ente_organo_id'),
			'presupuestoPartidas' => array(self::MANY_MANY, 'PresupuestoPartidas', PresupuestoPartidaProyecto::model()->tableName().'(proyecto_id, presupuesto_partida_id)','condition'=>'fecha_desde<\''.date('Y-m-d').'\' AND fecha_hasta>=\''.date('Y-m-d').'\''),
			'presupuestoPartidaProyecto' => array(self::HAS_MANY, 'PresupuestoPartidaProyecto', 'proyecto_id'),
		);
	}

	/**
	*Busca la lista de partidas del proyecto
	*@param integer $id
	*@return Partidas[] $partidas
	**/
	public function presuPartidas($id){
			
			$presuPartidas =array();
			foreach ($this->findByPk($id)->presupuestoPartidas as $key => $prePar) { //echo '|'.($partida->partida_id);
				// Esto debido a que pueden existir partidas deshabilitadas, las cuales el modelo retorna null.
				if(!empty($prePar))
					$presuPartidas[$key] = $prePar;
			}

			return $presuPartidas;
	}

	/**
	*Busca la lista de partidas del proyecto
	*@param integer $id
	*@return Partidas[] $partidas
	**/
	public function getPresuPartidas(){
			
			return $this->presuPartidas($this->proyecto_id);
	}

	public function accionId($id){
		return intval(substr( $id, 1));
	}

	// 
	public function beforeSave(){
	   	$this->anho = Yii::app()->params['trimestresFechas'][Yii::app()->session['trimestreSeleccionado']]['anho'];
	    return parent::beforeSave();
	}

	// Delete cascade / Borrado en cascada
	public function beforeDelete(){
	    foreach($this->presupuestoPartidaProyecto as $c)
	        	$c->delete();
	    return parent::beforeDelete();
	}
	public function behaviors()
	{
	    return array(
	        'ActiveRecordLogableBehavior'=>
	            'application.behaviors.ActiveRecordLogableBehavior',
	    );
	}
	
	/**
	*Valida si  el proyecto le pertenece al usuario autenticado actualmente.
	*@return bool $mepertenece
	**/
	public function pertenece(){
			
			if($this->ente_organo_id == Usuarios::model()->actual()->ente_organo_id)
				return true;
			else
				return false;
	}

	/**
	*Busca la lista de partidas del proyecto
	*@return Partidas[] $partidas
	**/
	/*public function presuPartidas(){
			
			$presuPartidas =array();
			foreach ($this->presupuestoPartidas as $key => $prePar) { //echo '|'.($partida->partida_id);
				// Esto debido a que pueden existir partidas deshabilitadas, las cuales el modelo retorna null.
				if(!empty($prePar->partida))
					$presuPartidas[$key] = $prePar;
			}

			return $presuPartidas;
	}*/

	public function partidaAsignada($attribute,$params)
	{
		
		$criteria = new CDbCriteria();

		$usuario = Usuarios::model()->findByPk(Yii::app()->user->getId());

		if($this->nombreid)
		{
			$proyecto = Proyectos::model()->find('codigo=:codigo', array(':codigo' => $this->nombreid));


			$presupuestopartidaproyecto = PresupuestoPartidaProyecto::model()->findAll('proyecto_id=:proyecto_id', array(':proyecto_id'=>$proyecto->proyecto_id));

			foreach ($presupuestopartidaproyecto as $key => $value) {
				
				$value->presupuesto_partida_id;
				if($partida = PresupuestoPartidas::model()->find('presupuesto_partida_id=:presupuesto_partida_id and ente_organo_id=:ente_organo_id and tipo=:tipo', array(':ente_organo_id' => $usuario->ente_organo_id, ':presupuesto_partida_id' => $value->presupuesto_partida_id, ':tipo' => 'P')))
				
				if($partida->partida_id == $this->$attribute)
				{
					$this->addError($attribute, 'Esta partida ya tiene asignado dinero para este proyecto!');
					break;
				}			
			}
		}
		//$criteria->condition = "ente_organo_id=".$usuario->ente_organo_id ;
		//$criteria->addSearchCondition('t.nombre', $this->nombre);
		//$criteria->compare('LOWER(nombre)',strtolower($this->nombre),true); 
	}

	public function proyectounico($attribute,$params)
	{
		
		$criteria = new CDbCriteria();

		$usuario = Usuarios::model()->findByPk(Yii::app()->user->getId());

		$criteria->condition = "ente_organo_id=".$usuario->ente_organo_id ;

		//$criteria->addSearchCondition('t.nombre', $this->nombre);
		$criteria->compare('LOWER(nombre)',strtolower($this->nombre),true); 


		if(Proyectos::model()->find($criteria))
			$this->addError($attribute, 'Ya tines un proyecto con este nombre!');

	}


	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'proyecto_id' => 'Proyecto',
			'nombre' => 'Nombre',
			'codigo' => 'Codigo',
			'ente_organo_id' => 'Ente Organo',
			'nombreid' => 'Proyecto',
			'anho'=>'Año'
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 *
	 * Typical usecase:
	 * - Initialize the model fields with values from filter form.
	 * - Execute this method to get CActiveDataProvider instance which will filter
	 * models according to data in model fields.
	 * - Pass data provider to CGridView, CListView or any similar widget.
	 *
	 * @return CActiveDataProvider the data provider that can return the models
	 * based on the search/filter conditions.
	 */
	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('proyecto_id',$this->proyecto_id,true);
		$criteria->compare('nombre',$this->nombre,true);
		$criteria->compare('codigo',$this->codigo,true);
		$criteria->compare('ente_organo_id',$this->ente_organo_id,true);
		$criteria->compare('anho',$this->anho,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Proyectos the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
