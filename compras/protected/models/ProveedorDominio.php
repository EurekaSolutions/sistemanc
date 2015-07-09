<?php

/**
 * This is the model class for table "public.proveedor_dominio".
 *
 * The followings are the available columns in table 'public.proveedor_dominio':
 * @property integer $id
 * @property integer $proveedor_id
 * @property integer $ente_organo_id
 * @property string $objeto
 *
 * The followings are the available model relations:
 * @property Proveedores $proveedor
 * @property EntesOrganos $enteOrgano
 */
class ProveedorDominio extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'public.proveedor_dominio';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('proveedor_id, ente_organo_id', 'required'),
			array('proveedor_id, ente_organo_id', 'numerical', 'integerOnly'=>true),
			array('objeto', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, proveedor_id, ente_organo_id, objeto', 'safe', 'on'=>'search'),
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
			'proveedor_id' => 'Proveedor',
			'ente_organo_id' => 'Ente Organo',
			'objeto' => 'Objeto',
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
		$criteria->compare('objeto',$this->objeto,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return ProveedorDominio the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
