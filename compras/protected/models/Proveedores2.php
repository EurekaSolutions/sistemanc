<?php

/**
 * This is the model class for table "proveedores".
 *
 * The followings are the available columns in table 'proveedores':
 * @property integer $id
 * @property string $rif
 * @property string $razon_social
 * @property string $fecha
 * @property integer $ente_organo_id
 *
 * The followings are the available model relations:
 * @property EntesOrganos $enteOrgano
 * @property Facturas[] $facturases
 */
class Proveedores extends ActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'public.proveedores';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('rif, razon_social', 'required'),
			array('ente_organo_id, estatus_contratista_id, anho', 'numerical', 'integerOnly'=>true),
			array('rif', 'length', 'max'=>12),
			array('rif', 'unique', 'caseSensitive' => 'false',),
			array('rif', 'match', 'pattern' => '/^(j|J|v|V|e|E|g|G)([0-9]{8,8})([0-9]{1})$/', 'allowEmpty'=>false,'message'=>'El formato del rif no es válido. Debe ser de la siguiente manera: J123456789'),
			array('razon_social', 'length', 'max'=>255),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, rif, razon_social, fecha, ente_organo_id, anho', 'safe', 'on'=>'search'),
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
			'facturas' => array(self::HAS_MANY, 'Facturas', 'proveedor_id'),
			'facturasCerradas' => array(self::HAS_MANY, 'Facturas', 'proveedor_id', 'condition'=>'cierre_carga=true'),
			'facturasNoCerradas' => array(self::HAS_MANY, 'Facturas', 'proveedor_id', 'condition'=>'cierre_carga=false'),
		);
	}

	/**
	 * @return html nombre de partida compuesto con el nombre
	 */
	public function etiquetaProveedor(){
		return CHtml::encode($this->rif.' - '. $this->razon_social);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'rif' => 'Rif',
			'razon_social' => 'Razon Social',
			'fecha' => 'Fecha',
			'ente_organo_id' => 'Ente Organo',
			'estatus_contratista_id' => 'Estatus Contratista'
		);
	}

	/**
	 *  Asignando anho y id del ente organo al cual pertenece el usuario.
	 */
	public function beforeSave() {
	    if ($this->isNewRecord)
		{	       
			$this->anho = Yii::app()->params['trimestresFechas'][Yii::app()->session['trimestreSeleccionado']]['anho'];
	    	$this->ente_organo_id = Usuarios::model()->findByPk(Yii::app()->user->getId())->enteOrgano->ente_organo_id;
	    }
	    return parent::beforeSave();
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
		$criteria->compare('rif',$this->rif,true);
		$criteria->compare('razon_social',$this->razon_social,true);
		$criteria->compare('fecha',$this->fecha,true);
		$criteria->compare('ente_organo_id',$this->ente_organo_id);
		$criteria->compare('estatus_contratista_id',$this->estatus_contratista_id);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Proveedores the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
