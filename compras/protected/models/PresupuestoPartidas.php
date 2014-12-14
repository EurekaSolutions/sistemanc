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
class PresupuestoPartidas extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'public.presupuesto_partidas';
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
			array('tipo', 'length', 'max'=>1),
			array('fecha_hasta, presupuesto_id', 'safe'),
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
			'partida' => array(self::BELONGS_TO, 'Partidas', array('partida_id'=>'partida_id')),
			'proyectoses' => array(self::MANY_MANY, 'Proyectos', 'presupuesto_partida_proyecto(presupuesto_partida_id, proyecto_id)'),
			'presupuestoPartidaAcciones' => array(self::HAS_MANY, 'PresupuestoPartidaAcciones', 'presupuesto_partida_id'),
			'presupuestoPartidaProyecto' => array(self::HAS_MANY, 'PresupuestoPartidaProyecto', 'presupuesto_partida_id'),
			//'fuenteFinanciamiento' => array(self::BELONGS_TO, 'FuentesFinanciamiento', 'fuente_financiamiento_id'),
		);
	}

	// Delete cascade / Borrado en cascada
	public function beforeDelete(){

		// Eliminando en cascada todos los productos nacionales correspondientes a esta partida
		foreach ($this->presupuestoProductos as $key => $c) 
			$c->delete();

		// Eliminando en cascada todos los productos importados correspondientes a esta partida
		foreach ($this->presupuestoImportacion as $key => $c) 
			$c->delete();

		parent::beforeDelete();
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
