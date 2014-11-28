<?php

/**
 * This is the model class for table "public.partida_productos".
 *
 * The followings are the available columns in table 'public.partida_productos':
 * @property string $partida_id
 * @property string $producto_id
 * @property string $tipo_operacion
 * @property string $fecha_desde
 * @property string $fecha_hasta
 * @property string $partida_producto_id
 *
 * The followings are the available model relations:
 * @property Partidas $partida
 * @property Productos $producto
 */
class PartidaProductos extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'public.partida_productos';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('partida_id, producto_id, tipo_operacion, fecha_desde, fecha_hasta', 'required'),
			array('tipo_operacion', 'length', 'max'=>1),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('partida_id, producto_id, tipo_operacion, fecha_desde, fecha_hasta, partida_producto_id', 'safe', 'on'=>'search'),
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
			'partida' => array(self::BELONGS_TO, 'Partidas', 'partida_id'),
			'producto' => array(self::BELONGS_TO, 'Productos', 'producto_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'partida_id' => 'Partida',
			'producto_id' => 'Producto',
			'tipo_operacion' => 'Tipo Operacion',
			'fecha_desde' => 'Fecha Desde',
			'fecha_hasta' => 'Fecha Hasta',
			'partida_producto_id' => 'Partida Producto',
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

		$criteria->compare('partida_id',$this->partida_id,true);
		$criteria->compare('producto_id',$this->producto_id,true);
		$criteria->compare('tipo_operacion',$this->tipo_operacion,true);
		$criteria->compare('fecha_desde',$this->fecha_desde,true);
		$criteria->compare('fecha_hasta',$this->fecha_hasta,true);
		$criteria->compare('partida_producto_id',$this->partida_producto_id,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return PartidaProductos the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
