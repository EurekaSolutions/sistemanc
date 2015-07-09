<?php

/**
 * This is the model class for table "public.proveedores_objetos".
 *
 * The followings are the available columns in table 'public.proveedores_objetos':
 * @property integer $id
 * @property integer $proveedor_id
 * @property integer $ente_organo_id
 * @property integer $rama_producto_id
 * @property string $descripcion
 *
 * The followings are the available model relations:
 * @property Proveedores $proveedor
 * @property EntesOrganos $enteOrgano
 * @property RamaProductos $ramaProducto
 */
class ProveedoresObjetos extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'public.proveedores_objetos';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('proveedor_id, ente_organo_id, rama_producto_id, descripcion', 'required'),
			array('proveedor_id, ente_organo_id, rama_producto_id', 'numerical', 'integerOnly'=>true),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, proveedor_id, ente_organo_id, rama_producto_id, descripcion', 'safe', 'on'=>'search'),
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
			'proveedor' => array(self::BELONGS_TO, 'Proveedores', 'proveedor_id'),
			'enteOrgano' => array(self::BELONGS_TO, 'EntesOrganos', 'ente_organo_id'),
			'ramaProducto' => array(self::BELONGS_TO, 'RamaProductos', 'rama_producto_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'proveedor_id' => 'Proveedor',
			'ente_organo_id' => 'Ente Organo',
			'rama_producto_id' => 'Rama Producto',
			'descripcion' => 'Descripcion',
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
		$criteria->compare('proveedor_id',$this->proveedor_id);
		$criteria->compare('ente_organo_id',$this->ente_organo_id);
		$criteria->compare('rama_producto_id',$this->rama_producto_id);
		$criteria->compare('descripcion',$this->descripcion,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return ProveedoresObjetos the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
