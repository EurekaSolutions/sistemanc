<?php

/**
 * This is the model class for table "public.proveedores_cuentas".
 *
 * The followings are the available columns in table 'public.proveedores_cuentas':
 * @property integer $id
 * @property string $codigo_swift
 * @property string $num_cuenta_bancaria
 * @property integer $proveedor_id
 * @property integer $ente_organo_id
 *
 * The followings are the available model relations:
 * @property Proveedores $proveedor
 * @property EntesOrganos $enteOrgano
 */
class ProveedoresCuentas extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'public.proveedores_cuentas';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('codigo_swift, num_cuenta_bancaria, proveedor_id, ente_organo_id', 'required'),
			array('proveedor_id, ente_organo_id', 'numerical', 'integerOnly'=>true),
			array('codigo_swift, num_cuenta_bancaria', 'length', 'max'=>255),
			//array('codigo_swift','unique'),
			array('num_cuenta_bancaria','unique'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, codigo_swift, num_cuenta_bancaria, proveedor_id, ente_organo_id', 'safe', 'on'=>'search'),
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
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'codigo_swift' => 'Codigo Swift',
			'num_cuenta_bancaria' => 'Num Cuenta Bancaria',
			'proveedor_id' => 'Proveedor',
			'ente_organo_id' => 'Ente Organo',
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
		$criteria->compare('codigo_swift',$this->codigo_swift,true);
		$criteria->compare('num_cuenta_bancaria',$this->num_cuenta_bancaria,true);
		$criteria->compare('proveedor_id',$this->proveedor_id);
		$criteria->compare('ente_organo_id',$this->ente_organo_id);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return ProveedoresCuentas the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
