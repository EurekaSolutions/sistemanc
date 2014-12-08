<?php

/**
 * This is the model class for table "public.divisas".
 *
 * The followings are the available columns in table 'public.divisas':
 * @property string $divisa_id
 * @property string $abreviatura
 * @property string $simbolo
 * @property string $nombre
 *
 * The followings are the available model relations:
 * @property Tasas[] $tasases
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
			array('abreviatura, simbolo, nombre', 'required'),
			array('abreviatura, simbolo, nombre', 'length', 'max'=>255),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('divisa_id, abreviatura, simbolo, nombre', 'safe', 'on'=>'search'),
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
			'tasa' => array(self::HAS_ONE, 'Tasas', 'divisa_id','condition'=>'t.fecha_desde<\''.date('Y-m-d').'\' AND t.fecha_hasta>\''.date('Y-m-d').'\''),
			'tasas' => array(self::HAS_MANY, 'Tasas', 'divisa_id'),
			
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
