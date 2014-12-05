<?php

/**
 * This is the model class for table "public.presupuesto_partida_proyecto".
 *
 * The followings are the available columns in table 'public.presupuesto_partida_proyecto':
 * @property string $proyecto_id
 * @property string $presupuesto_partida_id
 */
class PresupuestoPartidaProyecto extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'public.presupuesto_partida_proyecto';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('proyecto_id, presupuesto_partida_id', 'required'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('proyecto_id, presupuesto_partida_id', 'safe', 'on'=>'search'),
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
			'proyecto' => array(self::BELONGS_TO, 'Proyectos', 'proyecto_id'),
			'presupuestoPartida' => array(self::HAS_MANY, 'PresupuestoPartidas', 'presupuesto_partida_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'proyecto_id' => 'Proyecto',
			'presupuesto_partida_id' => 'Presupuesto Partida',
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

		$criteria->compare('proyecto_id',$this->proyecto_id,true);
		$criteria->compare('presupuesto_partida_id',$this->presupuesto_partida_id,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return PresupuestoPartidaProyecto the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
