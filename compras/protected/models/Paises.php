<?php

/**
 * This is the model class for table "public.paises".
 *
 * The followings are the available columns in table 'public.paises':
 * @property integer $id
 * @property string $codigo_iso
 * @property string $nombre
 * @property string $codigo_tlf
 *
 * The followings are the available model relations:
 * @property ProveedoresExtranjeros[] $proveedoresExtranjeroses
 */
class Paises extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'public.paises';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('codigo_iso, nombre, codigo_tlf', 'required'),
			array('codigo_iso, codigo_tlf', 'length', 'max'=>20),
			array('nombre', 'length', 'max'=>255),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, codigo_iso, nombre, codigo_tlf', 'safe', 'on'=>'search'),
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
			'proveedoresExtranjeroses' => array(self::HAS_MANY, 'ProveedoresExtranjeros', 'pais_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'codigo_iso' => 'Codigo Iso',
			'nombre' => 'Pais',
			'codigo_tlf' => 'Codigo Tlf',
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
		$criteria->compare('codigo_iso',$this->codigo_iso,true);
		$criteria->compare('nombre',$this->pais,true);
		$criteria->compare('codigo_tlf',$this->codigo_tlf,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Paises the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
