<?php

/**
 * This is the model class for table "public.proyectos_acciones".
 *
 * The followings are the available columns in table 'public.proyectos_acciones':
 * @property string $proyecto_id
 * @property string $nombre
 * @property string $monto
 * @property string $codigo
 * @property string $ente_organo_id
 * @property string $tipo
 * @property string $fecha
 *
 * The followings are the available model relations:
 * @property EntesOrganos $enteOrgano
 * @property ProyectoPartidas[] $proyectoPartidases
 */
class ProyectosAcciones extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'public.proyectos_acciones';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('nombre, monto, codigo, ente_organo_id, tipo, fecha', 'required'),
			array('nombre', 'length', 'max'=>255),
			array('monto', 'length', 'max'=>38),
			array('codigo', 'length', 'max'=>20),
			array('tipo', 'length', 'max'=>50),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('proyecto_id, nombre, monto, codigo, ente_organo_id, tipo, fecha', 'safe', 'on'=>'search'),
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
			'proyectoPartidases' => array(self::HAS_MANY, 'ProyectoPartidas', 'proyecto_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'proyecto_id' => 'Proyecto',
			'nombre' => 'Nombre',
			'monto' => 'Monto',
			'codigo' => 'Codigo',
			'ente_organo_id' => 'Ente Organo',
			'tipo' => 'Tipo',
			'fecha' => 'Fecha',
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
		$criteria->compare('nombre',$this->nombre,true);
		$criteria->compare('monto',$this->monto,true);
		$criteria->compare('codigo',$this->codigo,true);
		$criteria->compare('ente_organo_id',$this->ente_organo_id,true);
		$criteria->compare('tipo',$this->tipo,true);
		$criteria->compare('fecha',$this->fecha,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return ProyectosAcciones the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
