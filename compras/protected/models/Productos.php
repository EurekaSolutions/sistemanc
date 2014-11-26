<?php

/**
 * This is the model class for table "public.productos".
 *
 * The followings are the available columns in table 'public.productos':
 * @property string $producto_id
 * @property string $cod_segmento
 * @property string $cod_familia
 * @property string $cod_clase
 * @property string $cod_producto
 * @property string $nombre
 *
 * The followings are the available model relations:
 * @property PartidaProductos[] $partidaProductoses
 * @property PresupuestoProductos[] $presupuestoProductoses
 */
class Productos extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'public.productos';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('cod_segmento, cod_familia, cod_clase, cod_producto, nombre', 'required'),
			array('nombre', 'length', 'max'=>255),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('producto_id, cod_segmento, cod_familia, cod_clase, cod_producto, nombre', 'safe', 'on'=>'search'),
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
			'partidaProductoses' => array(self::HAS_MANY, 'PartidaProductos', 'producto_id'),
			'presupuestoProductoses' => array(self::HAS_MANY, 'PresupuestoProductos', 'producto_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'producto_id' => 'Producto',
			'cod_segmento' => 'Cod Segmento',
			'cod_familia' => 'Cod Familia',
			'cod_clase' => 'Cod Clase',
			'cod_producto' => 'Cod Producto',
			'nombre' => 'Nombre',
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

		$criteria->compare('producto_id',$this->producto_id,true);
		$criteria->compare('cod_segmento',$this->cod_segmento,true);
		$criteria->compare('cod_familia',$this->cod_familia,true);
		$criteria->compare('cod_clase',$this->cod_clase,true);
		$criteria->compare('cod_producto',$this->cod_producto,true);
		$criteria->compare('nombre',$this->nombre,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Productos the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
