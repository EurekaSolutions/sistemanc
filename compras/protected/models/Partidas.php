<?php

/**
 * This is the model class for table "public.partidas".
 *
 * The followings are the available columns in table 'public.partidas':
 * @property string $partida_id
 * @property string $p1
 * @property string $p2
 * @property string $p3
 * @property string $p4
 * @property string $nombre
 *
 * The followings are the available model relations:
 * @property PresupuestoPartidas[] $presupuestoPartidases
 * @property PartidaProductos[] $partidaProductoses
 */
class Partidas extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'public.partidas';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('p1, p2, p3, p4, nombre', 'required'),
			array('p1, p2, p3, p4', 'length', 'max'=>4),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('partida_id, p1, p2, p3, p4, nombre', 'safe', 'on'=>'search'),
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
			'presupuestoPartidases' => array(self::HAS_MANY, 'PresupuestoPartidas', 'partida_id'),
			'partidaProductos' => array(self::HAS_MANY, 'PartidaProductos', 'partida_id'),
			'productos' => array(self::MANY_MANY, 'Productos', 'partida_productos(partida_id, producto_id)'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'partida_id' => 'Partida',
			'p1' => 'P1',
			'p2' => 'P2',
			'p3' => 'P3',
			'p4' => 'P4',
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

		$criteria->compare('partida_id',$this->partida_id,true);
		$criteria->compare('p1',$this->p1,true);
		$criteria->compare('p2',$this->p2,true);
		$criteria->compare('p3',$this->p3,true);
		$criteria->compare('p4',$this->p4,true);
		$criteria->compare('nombre',$this->nombre,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Partidas the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
