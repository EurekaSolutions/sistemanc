<?php

/**
 * This is the model class for table "facturas_productos".
 *
 * The followings are the available columns in table 'facturas_productos':
 * @property integer $id
 * @property integer $factura_id
 * @property integer $producto_id
 * @property string $costo_unitario
 * @property integer $cantidad_adquirida
 * @property integer $iva_id
 * @property string $fecha
 *
 * The followings are the available model relations:
 * @property Productos $producto
 * @property Iva $iva
 * @property Facturas $factura
 */
class FacturasProductos extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'facturas_productos';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('factura_id, producto_id, costo_unitario, fecha', 'required'),
			array('factura_id, producto_id, cantidad_adquirida, iva_id', 'numerical', 'integerOnly'=>true),
			array('costo_unitario', 'length', 'max'=>38),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, factura_id, producto_id, costo_unitario, cantidad_adquirida, iva_id, fecha', 'safe', 'on'=>'search'),
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
			'producto' => array(self::BELONGS_TO, 'Productos', 'producto_id'),
			'iva' => array(self::BELONGS_TO, 'Iva', 'iva_id'),
			'factura' => array(self::BELONGS_TO, 'Facturas', 'factura_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'factura_id' => 'Factura',
			'producto_id' => 'Producto',
			'costo_unitario' => 'Costo Unitario',
			'cantidad_adquirida' => 'Cantidad Adquirida',
			'iva_id' => 'Iva',
			'fecha' => 'Fecha',
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

		$criteria->compare('id',$this->id);
		$criteria->compare('factura_id',$this->factura_id);
		$criteria->compare('producto_id',$this->producto_id);
		$criteria->compare('costo_unitario',$this->costo_unitario,true);
		$criteria->compare('cantidad_adquirida',$this->cantidad_adquirida);
		$criteria->compare('iva_id',$this->iva_id);
		$criteria->compare('fecha',$this->fecha,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return FacturasProductos the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
