<?php

/**
 * This is the model class for table "public.divisas".
 *
 * The followings are the available columns in table 'public.divisas':
 * @property string $divisa_id
 * @property string $abreviatura
 * @property string $simbolo
 * @property string $nombre
 * @property string $tasa
 * @property string $fecha_desde
 * @property string $fecha_hasta
 */
class Divisas extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'public.divisas';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('abreviatura, simbolo, nombre, tasa, fecha_desde, fecha_hasta', 'required'),
			array('abreviatura, simbolo, nombre', 'length', 'max'=>255),
			array('tasa', 'length', 'max'=>20),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('divisa_id, abreviatura, simbolo, nombre, tasa, fecha_desde, fecha_hasta', 'safe', 'on'=>'search'),
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
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'divisa_id' => 'Divisa',
			'abreviatura' => 'Abreviatura',
			'simbolo' => 'Simbolo',
			'nombre' => 'Nombre',
			'tasa' => 'Tasa',
			'fecha_desde' => 'Fecha Desde',
			'fecha_hasta' => 'Fecha Hasta',
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
		$criteria->compare('abreviatura',$this->abreviatura,true);
		$criteria->compare('simbolo',$this->simbolo,true);
		$criteria->compare('nombre',$this->nombre,true);
		$criteria->compare('tasa',$this->tasa,true);
		$criteria->compare('fecha_desde',$this->fecha_desde,true);
		$criteria->compare('fecha_hasta',$this->fecha_hasta,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Divisas the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
