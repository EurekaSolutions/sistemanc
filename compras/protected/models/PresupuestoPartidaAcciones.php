<?php

/**
 * This is the model class for table "public.presupuesto_partida_acciones".
 *
 * The followings are the available columns in table 'public.presupuesto_partida_acciones':
 * @property string $accion_id
 * @property string $presupuesto_partida_id
 * @property string $codigo_accion
 * @property string $ente_organo_id
 * @property string $codigo_accion_padre
 *
 * The followings are the available model relations:
 * @property Acciones $accion
 * @property EntesOrganos $enteOrgano
 * @property PresupuestoPartidas $presupuestoPartida
 */
class PresupuestoPartidaAcciones extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'public.presupuesto_partida_acciones';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('accion_id, presupuesto_partida_id, codigo_accion, ente_organo_id', 'required'),
			array('codigo_accion', 'length', 'max'=>100),
			array('codigo_accion_padre', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('accion_id, presupuesto_partida_id, codigo_accion, ente_organo_id,codigo_accion_padre', 'safe', 'on'=>'search'),
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
			'accion' => array(self::BELONGS_TO, 'Acciones', 'accion_id'),
			'enteOrgano' => array(self::BELONGS_TO, 'EntesOrganos', 'ente_organo_id'),
			'presupuestoPartida' => array(self::HAS_MANY, 'PresupuestoPartidas', 'presupuesto_partida_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'accion_id' => 'Accion',
			'presupuesto_partida_id' => 'Presupuesto Partida',
			'codigo_accion' => 'Codigo Accion',
			'ente_organo_id' => 'Ente Organo',
			'codigo_accion_padre' => 'Codigo Accion Padre',
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

		$criteria->compare('accion_id',$this->accion_id,true);
		$criteria->compare('presupuesto_partida_id',$this->presupuesto_partida_id,true);
		$criteria->compare('codigo_accion',$this->codigo_accion,true);
		$criteria->compare('ente_organo_id',$this->ente_organo_id,true);
		$criteria->compare('codigo_accion_padre',$this->codigo_accion_padre,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return PresupuestoPartidaAcciones the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
