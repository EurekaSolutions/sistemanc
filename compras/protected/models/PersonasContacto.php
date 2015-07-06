<?php

/**
 * This is the model class for table "public.personas_contacto".
 *
 * The followings are the available columns in table 'public.personas_contacto':
 * @property integer $id
 * @property string $nombre
 * @property string $documento_identidad
 * @property string $tlf_fijo
 * @property string $tlf_movil
 * @property string $fax_telefax
 * @property string $correo_electronico
 * @property integer $proveedor_id
 *
 * The followings are the available model relations:
 * @property Proveedores $proveedor
 */
class PersonasContacto extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'public.personas_contacto';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('nombre, tlf_fijo, correo_electronico, proveedor_id', 'required'),
			array('proveedor_id', 'numerical', 'integerOnly'=>true),
			array('nombre, documento_identidad, tlf_fijo, tlf_movil, fax_telefax, correo_electronico', 'length', 'max'=>255),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, nombre, documento_identidad, tlf_fijo, tlf_movil, fax_telefax, correo_electronico, proveedor_id', 'safe', 'on'=>'search'),
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
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'nombre' => 'Nombre',
			'documento_identidad' => 'Documento Identidad',
			'tlf_fijo' => 'Tlf Fijo',
			'tlf_movil' => 'Tlf Movil',
			'fax_telefax' => 'Fax Telefax',
			'correo_electronico' => 'Correo Electronico',
			'proveedor_id' => 'Proveedor',
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
		$criteria->compare('nombre',$this->nombre,true);
		$criteria->compare('documento_identidad',$this->documento_identidad,true);
		$criteria->compare('tlf_fijo',$this->tlf_fijo,true);
		$criteria->compare('tlf_movil',$this->tlf_movil,true);
		$criteria->compare('fax_telefax',$this->fax_telefax,true);
		$criteria->compare('correo_electronico',$this->correo_electronico,true);
		$criteria->compare('proveedor_id',$this->proveedor_id);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return PersonasContacto the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
