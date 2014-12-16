<?php

/**
 * This is the model class for table "public.entes_adscritos".
 *
 * The followings are the available columns in table 'public.entes_adscritos':
 * @property string $padre_id
 * @property string $ente_organo_id
 * @property string $fecha_desde
 * @property string $fecha_hasta
 * @property string $ente_adscrito_id
 *
 * The followings are the available model relations:
 * @property EntesOrganos $enteOrgano
 * @property EntesOrganos $padre
 */
class EntesAdscritos extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'public.entes_adscritos';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('padre_id, ente_organo_id, fecha_desde, fecha_hasta', 'required'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('padre_id, ente_organo_id, fecha_desde, fecha_hasta, ente_adscrito_id', 'safe', 'on'=>'search'),
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
			'padre' => array(self::BELONGS_TO, 'EntesOrganos', array('padre_id'=>'ente_organo_id')),
		);
	}
	
	public function behaviors()
	{
	    return array(
	        'ActiveRecordLogableBehavior'=>
	            'application.behaviors.ActiveRecordLogableBehavior',
	    );
	}
	
	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'padre_id' => 'Padre',
			'ente_organo_id' => 'Ente Organo',
			'fecha_desde' => 'Fecha Desde',
			'fecha_hasta' => 'Fecha Hasta',
			'ente_adscrito_id' => 'Ente Adscrito',
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

		$criteria->compare('padre_id',$this->padre_id,true);
		$criteria->compare('ente_organo_id',$this->ente_organo_id,true);
		$criteria->compare('fecha_desde',$this->fecha_desde,true);
		$criteria->compare('fecha_hasta',$this->fecha_hasta,true);
		$criteria->compare('ente_adscrito_id',$this->ente_adscrito_id,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return EntesAdscritos the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
