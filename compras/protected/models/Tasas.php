<?php

/**
 * This is the model class for table "public.tasas".
 *
 * The followings are the available columns in table 'public.tasas':
 * @property string $divisa_id
 * @property string $fecha_desde
 * @property string $fechas_hasta
 * @property string $tasa
 * @property string $tasa_id
 *
 * The followings are the available model relations:
 * @property Divisas $divisa
 */
class Tasas extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'public.tasas';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('divisa_id, fecha_desde, fechas_hasta, tasa', 'required'),
			array('tasa', 'length', 'max'=>20),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('divisa_id, fecha_desde, fechas_hasta, tasa, tasa_id', 'safe', 'on'=>'search'),
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
			'divisa' => array(self::BELONGS_TO, 'Divisas', 'divisa_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'divisa_id' => 'Divisa',
			'fecha_desde' => 'Fecha Desde',
			'fechas_hasta' => 'Fechas Hasta',
			'tasa' => 'Tasa',
			'tasa_id' => 'Tasa',
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

		$criteria->compare('divisa_id',$this->divisa_id,true);
		$criteria->compare('fecha_desde',$this->fecha_desde,true);
		$criteria->compare('fechas_hasta',$this->fechas_hasta,true);
		$criteria->compare('tasa',$this->tasa,true);
		$criteria->compare('tasa_id',$this->tasa_id,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Tasas the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
