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
			array('partida_id, monto_presupuestado, fecha_desde, fecha_hasta', 'required'),
			array('monto_presupuestado', 'length', 'max'=>38),
			array('tipo', 'length', 'max'=>1),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('presupuesto_partida_id, partida_id, monto_presupuestado, fecha_desde, fecha_hasta, tipo', 'safe', 'on'=>'search'),
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
			'presupuestoProductoses' => array(self::HAS_MANY, 'PresupuestoProductos', 'proyecto_partida_id'),
			'partida' => array(self::BELONGS_TO, 'Partidas', 'partida_id'),
			'proyectoses' => array(self::MANY_MANY, 'Proyectos', 'presupuesto_partida_proyecto(presupuesto_partida_id, proyecto_id)'),
			'presupuestoPartidaAcciones' => array(self::HAS_MANY, 'PresupuestoPartidaAcciones', 'presupuesto_partida_id'),
			'presupuestoPartidaProyecto' => array(self::HAS_MANY, 'PresupuestoPartidaProyecto', 'presupuesto_partida_id'),
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
