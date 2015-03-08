<?php

/**
 * This is the model class for table "facturas".
 *
 * The followings are the available columns in table 'facturas':
 * @property integer $id
 * @property string $num_factura
 * @property integer $anho
 * @property integer $proveedor_id
 * @property integer $procedimiento_id
 * @property string $fecha
 * @property string $fecha_factura
 * @property integer $ente_organo_id
 *
 * The followings are the available model relations:
 * @property FacturasProductos[] $facturasProductoses
 * @property Procedimientos $procedimiento
 * @property Proveedores $proveedor
 * @property EntesOrganos $enteOrgano
 */
class Facturas extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'facturas';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('num_factura, proveedor_id, procedimiento_id', 'required'),
			array('anho, proveedor_id, procedimiento_id, ente_organo_id', 'numerical', 'integerOnly'=>true),
			array('num_factura', 'length', 'max'=>255),
			array('fecha_factura', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, num_factura, anho, proveedor_id, procedimiento_id, fecha, fecha_factura, ente_organo_id', 'safe', 'on'=>'search'),
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
			'facturasProductoses' => array(self::HAS_MANY, 'FacturasProductos', 'factura_id'),
			'procedimiento' => array(self::BELONGS_TO, 'Procedimientos', 'procedimiento_id'),
			'proveedor' => array(self::BELONGS_TO, 'Proveedores', 'proveedor_id'),
			'enteOrgano' => array(self::BELONGS_TO, 'EntesOrganos', 'ente_organo_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'num_factura' => 'Número de Factura',
			'anho' => 'Anho',
			'proveedor_id' => 'Proveedor',
			'procedimiento_id' => 'Procedimiento',
			'fecha' => 'Fecha',
			'fecha_factura' => 'Fecha Factura',
			'ente_organo_id' => 'Ente Organo',
		);
	}

	/**
	 *  Asignando anho y id del ente organo al cual pertenece el usuario.
	 */
	public function beforeSave() {
	    if ($this->isNewRecord)
		{	       
			$this->anho = 2015;
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
		$criteria->compare('num_factura',$this->num_factura,true);
		$criteria->compare('anho',$this->anho);
		$criteria->compare('proveedor_id',$this->proveedor_id);
		$criteria->compare('procedimiento_id',$this->procedimiento_id);
		$criteria->compare('fecha',$this->fecha,true);
		$criteria->compare('fecha_factura',$this->fecha_factura,true);
		$criteria->compare('ente_organo_id',$this->ente_organo_id);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Facturas the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
