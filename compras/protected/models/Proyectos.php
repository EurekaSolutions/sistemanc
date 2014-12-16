<?php

/**
 * This is the model class for table "public.proyectos".
 *
 * The followings are the available columns in table 'public.proyectos':
 * @property string $proyecto_id
 * @property string $nombre
 * @property string $codigo
 * @property string $ente_organo_id
 *
 * The followings are the available model relations:
 * @property EntesOrganos $enteOrgano
 * @property PresupuestoPartidas[] $presupuestoPartidases
 */
class Proyectos extends CActiveRecord
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
		return 'public.proyectos';
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
			array('nombreid, partida, general, monto, fuente, especifica', 'required', 'on' => 'creaproyecto, creaproyectose'),
			array('monto', 'numerical', 'integerOnly'=>false, 'min'=>1),
			array('codigo', 'length', 'max'=>20),
			array('nombre', 'proyectounico', 'on'=>'create'),
			array('especifica', 'partidaAsignada', 'on'=>'creaproyecto'),
			array('subespecifica', 'partidaAsignada', 'on'=>'creaproyectose'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('proyecto_id, nombre, codigo, ente_organo_id', 'safe', 'on'=>'search'),
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
			'presupuestoPartidas' => array(self::MANY_MANY, 'PresupuestoPartidas', 'presupuesto_partida_proyecto(proyecto_id, presupuesto_partida_id)','condition'=>'fecha_desde<\''.date('Y-m-d').'\' AND fecha_hasta>=\''.date('Y-m-d').'\''),
			'presupuestoPartidaProyecto' => array(self::HAS_MANY, 'PresupuestoPartidaProyecto', 'proyecto_id'),
		);
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
