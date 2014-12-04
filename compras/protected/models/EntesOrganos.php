<?php

/**
 * This is the model class for table "public.entes_organos".
 *
 * The followings are the available columns in table 'public.entes_organos':
 * @property string $ente_organo_id
 * @property string $codigo_onapre
 * @property string $nombre
 * @property string $tipo
 * @property string $ente_adscrito
 * @property string $creado_por
 *
 * The followings are the available model relations:
 * @property Proyectos[] $proyectoses
 * @property Usuarios[] $usuarioses
 * @property EntesOrganos $enteAdscrito
 * @property EntesOrganos[] $entesOrganoses
 * @property ProyectosAcciones[] $proyectosAcciones
 */
class EntesOrganos extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'entes_organos';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('codigo_onapre, nombre, tipo', 'required'),
			array('codigo_onapre', 'length', 'max'=>20),
			array('nombre', 'length', 'max'=>255),
			array('tipo', 'length', 'max'=>50),
			array('ente_adscrito', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('ente_organo_id, codigo_onapre, nombre, tipo, ente_adscrito', 'safe', 'on'=>'search'),
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
			'usuarios' => array(self::HAS_MANY, 'Usuarios', 'ente_organo_id'),
			'padre' => array(self::HAS_ONE, 'EntesAdscritos', 'padre_id'),
			'hijo' => array(self::HAS_MANY, 'EntesAdscritos', 'ente_organo_id'),
			'proyectos' => array(self::HAS_MANY, 'Proyectos', 'ente_organo_id'),
			'acciones' => array(self::HAS_MANY, 'PresupuestoPartidaAcciones', 'ente_organo_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'ente_organo_id' => 'Ente Organo',
			'codigo_onapre' => 'Codigo Onapre',
			'nombre' => 'Nombre',
			'tipo' => 'Tipo',
			'rif' => 'Rif',
			'creado_por' => 'Creado Por',
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

		$criteria->compare('ente_organo_id',$this->ente_organo_id,true);
		$criteria->compare('codigo_onapre',$this->codigo_onapre,true);
		$criteria->compare('nombre',$this->nombre,true);
		$criteria->compare('tipo',$this->tipo,true);
		$criteria->compare('rif',$this->rif,true);
		$criteria->compare('creado_por',$this->creado_por,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return EntesOrganos the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
