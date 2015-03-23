<?php

/**
 * This is the model class for table "public.presupuesto_partidas".
 *
 * The followings are the available columns in table 'public.presupuesto_partidas':
 * @property string $presupuesto_partida_id
 * @property string $partida_id
 * @property string $monto_presupuestado
 * @property string $fecha_desde
 * @property string $fecha_hasta
 * @property string $tipo
 * @property string $anho
 * @property string $ente_organo_id
 * @property string $fuente_fianciamiento_id
 * @property string $presupuesto_id
 *
 * The followings are the available model relations:
 * @property PresupuestoProductos[] $presupuestoProductoses
 * @property Partidas $partida
 * @property Proyectos[] $proyectoses
 * @property PresupuestoPartidaAcciones[] $presupuestoPartidaAcciones
 */
class PresupuestoPartidas extends ActiveRecord
{
	public $sustraendo_id;
	public $monto_transferir;
	public $todo;
	public $abonar_id;

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return $this->obtenerSchema().'.presupuesto_partidas';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('partida_id, monto_presupuestado, fecha_desde, anho, ente_organo_id', 'required'),
			array('monto_presupuestado', 'length', 'max'=>38),
			array('todo', 'required', 'on'=>'transferir'),
			array('tipo', 'length', 'max'=>1),
			array('fecha_hasta, presupuesto_id, sustraendo_id, monto_transferir, todo, abonar_id', 'safe'),
			array('sustraendo_id', 'validarSustraendo', 'on'=>'transferir'),
			array('abonar_id', 'validarAbono', 'on'=>'anadir'),
			//array('abonar_id', 'required', 'on'=>'anadir'),
			array('monto_transferir','numerical', 'on'=>'transferir'),
			array('presupuesto_partida_id', 'validarSumando', 'on'=>'transferir'),
			array('monto_transferir', 'validarTansferirMonto', 'on'=>'transferir'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('presupuesto_partida_id, partida_id, monto_presupuestado, fecha_desde, fecha_hasta, tipo, anho, ente_organo_id', 'safe', 'on'=>'search'),
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
			'presupuestoProductos' => array(self::HAS_MANY, 'PresupuestoProductos', array('proyecto_partida_id'=>'presupuesto_partida_id')),
			'presupuestoImportacion' => array(self::HAS_MANY, 'PresupuestoImportacion', 'presupuesto_partida_id'),
			'presupuestoProducto' => array(self::HAS_ONE, 'PresupuestoProductos', 'proyecto_partida_id'),
			'partida' => array(self::BELONGS_TO, 'Partidas', array('partida_id'=>'partida_id'), 'scopes'=>array('habilitadas')),
			'proyectoses' => array(self::MANY_MANY, 'Proyectos', 'presupuesto_partida_proyecto(presupuesto_partida_id, proyecto_id)'),
			'presupuestoPartidaAcciones' => array(self::HAS_MANY, 'PresupuestoPartidaAcciones',  'presupuesto_partida_id'),
			'presupuestoPartidaProyecto' => array(self::HAS_MANY, 'PresupuestoPartidaProyecto', 'presupuesto_partida_id'),
			'fuenteFinanciamientos' => array(self::HAS_MANY, 'FuentePresupuesto', 'presupuesto_partida_id'),
		);
	}
 	/**
 	 * Función que suma el total de monto cargado de esta partida
 	 * 
 	 * @return float $total
 	 * */
 	public function montoCargadoPartida(){
			// Validando la suma de los productos de la partida
 		$total = 0;
 		//Nacionales
			if($this->presupuestoProductos)
				foreach ($this->presupuestoProductos as $key => $presupuestoProducto) {
					$total += $presupuestoProducto->monto_presupuesto;	
				}
		//Importados
			if($this->presupuestoImportacion)
				foreach ($this->presupuestoImportacion as $key => $presupuestoImportacion) {
					$total += ($presupuestoImportacion->cantidad*$presupuestoImportacion->monto_presupuesto*$presupuestoImportacion->divisa->tasa->tasa);
				}
 		return $total;
 	}

 	/**
 	 * Función que calcula el monto disponible de una partida presupuestada.
 	 * 
 	 * @return float $disponible
 	 * */
 	public function montoDisponible(){
			
 		return $this->monto_presupuestado - $this->montoCargadoPartida();
 	}
 	/**
 	 * Función que calcula el monto disponible de una partida presupuestada.
 	 * 
 	 * @return float $disponible
 	 * */

 	public function validarAbono($attribute,$params)
 	{
 		if($this->$attribute == '' || $this->$attribute == null )
			$this->addError($attribute, 'Debe seleccionar una partida para abonar.');
 	}

 	public function validarSustraendo($attribute,$params)
	{
		if($this->$attribute == '' || $this->$attribute == null )
			$this->addError($attribute, 'Debe seleccionar una partida a sustraer.');
		else
		if($this->$attribute == $this->presupuesto_partida_id)
			$this->addError($attribute, 'Las partidas seleccionadas son la misma.');
	     
 	}
 	/**
 	 * Función que calcula el monto disponible de una partida presupuestada.
 	 * 
 	 * @return float $disponible
 	 * */
 	public function validarSumando($attribute,$params)
	{
		if($this->$attribute == '' || $this->$attribute == null )
					$this->addError($attribute, 'Debe seleccionar una partida a transferir.');
	}
 	/**
 	 * Función que calcula el monto disponible de una partida presupuestada.
 	 * 
 	 * @return float $disponible
 	 * */
 	public function validarTansferirMonto($attribute,$params)
	{
		if($monto_disponible = $this->findByAttributes(array('presupuesto_partida_id'=>$this->sustraendo_id)))
			$monto_disponible = $this->findByAttributes(array('presupuesto_partida_id'=>$this->sustraendo_id))->montoDisponible();

		if(!$this->todo){
		   if($this->$attribute > $monto_disponible)
	 			$this->addError($attribute, 'El monto a transferir sobrepasa la cantidad disponible de la partida origen.');
		   
		   if($this->$attribute <= 0)
		   		$this->addError($attribute, 'El monto a transferir debe ser mayor a 0.');
	     }
 	}

	// Delete cascade / Borrado en cascada
	public function beforeDelete()
	{

		// Eliminando en cascada todos los productos nacionales correspondientes a esta partida
		foreach ($this->presupuestoProductos as $c) 
			if(!$c->delete()) throw new Exception("No se pudo eliminar el presupuesto_producto con ID: ".$c->presupuesto_id, 1);

		// Eliminando en cascada todos los productos importados correspondientes a esta partida
		foreach ($this->presupuestoImportacion as $c) 
			if(!$c->delete()) throw new Exception("No se pudo eliminar el presupuesto_importacion con ID: ".$c->presupuesto_partida_id, 1);

		// Eliminando las fuentes de financiamientos asociadas a la partida
		foreach ($this->fuenteFinanciamientos as $c) 
			if(!$c->delete()) throw new Exception("No se pudo eliminar la fuente_presupuesto con ID: ".$c->id, 1);
			

		foreach ($this->presupuestoPartidaProyecto as $c) {
			$c->setScenario('cascadaPartida');		// Esto para evitar que me intente eliminar despues de borrarse el mismo
			if(!$c->delete()) throw new Exception("No se pudo eliminar la relación presupuestoPartidaProyecto con ID: ".$c->presupuesto_partida_id, 1);
		}

		foreach ($this->presupuestoPartidaAcciones as $c) {
			$c->setScenario('cascadaPartida');		// Esto para evitar que me intente eliminar despues de borrarse el mismo
			if(!$c->delete()) throw new Exception("No se pudo eliminar la relación presupuestoPartidaAcciones con ID: ".$c->presupuesto_partida_id, 1);
		}
		

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
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'presupuesto_partida_id' => 'Presupuesto Partida',
			'partida_id' => 'Partida',
			'monto_presupuestado' => 'Monto Presupuestado',
			'fecha_desde' => 'Fecha Desde',
			'fecha_hasta' => 'Fecha Hasta',
			'tipo' => 'Tipo',
			'anho' => 'Anho',
			'ente_organo_id' => 'Ente Organo',
			//'fuente_financiamiento_id' => 'Fuente Financiamiento',
			'presupuesto_id' => 'Presupuesto',
			'sustraendo_id'=>'Partida a sustraer',
			'monto_transferir'=>'Monto a transferir',
			'todo'=>'Transferir todo',
			'abonar_id' => 'Partida a añadir',

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

		$criteria->compare('presupuesto_partida_id',$this->presupuesto_partida_id,true);
		$criteria->compare('partida_id',$this->partida_id,true);
		$criteria->compare('monto_presupuestado',$this->monto_presupuestado,true);
		$criteria->compare('fecha_desde',$this->fecha_desde,true);
		$criteria->compare('fecha_hasta',$this->fecha_hasta,true);
		$criteria->compare('tipo',$this->tipo,true);
		$criteria->compare('anho',$this->anho,true);
		$criteria->compare('ente_organo_id',$this->ente_organo_id,true);
		//$criteria->compare('fuente_fianciamiento_id',$this->fuente_fianciamiento_id,true);
		$criteria->compare('presupuesto_id',$this->presupuesto_id,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return PresupuestoPartidas the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
