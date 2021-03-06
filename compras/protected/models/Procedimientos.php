<?php

/**
 * This is the model class for table "procedimientos".
 *
 * The followings are the available columns in table 'procedimientos':
 * @property integer $id
 * @property string $num_contrato
 * @property integer $anho
 * @property string $fecha
 * @property string $tipo
 * @property integer $ente_organo_id
 *
 * The followings are the available model relations:
 * @property EntesOrganos $enteOrgano
 * @property Facturas[] $facturases
 */
class Procedimientos extends ActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return $this->obtenerSchema(true).'.procedimientos';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('num_contrato, tipo', 'required'),
			array('anho, ente_organo_id', 'numerical', 'integerOnly'=>true),
			array('num_contrato, tipo', 'length', 'max'=>255),
			array('num_contrato', 'validarUnicidad'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, num_contrato, anho, fecha, tipo, ente_organo_id', 'safe', 'on'=>'search'),
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
			'facturas' => array(self::HAS_MANY, 'Facturas', 'procedimiento_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'num_contrato' => 'Número de Contrato',
			'anho' => 'Año',
			'fecha' => 'Fecha',
			'tipo' => 'Tipo',
			'ente_organo_id' => 'Ente Organo',
		);
	}

	 /**
 	 * Etiqueta de la factura.
 	 * 
 	 * @return string $etiqueta
 	 * */
 	public function validarUnicidad($attribute,$params){
 		if(count($this->findByAttributes(array('num_contrato'=>$this->num_contrato,'ente_organo_id'=>$this->ente_organo_id))))
 			$this->addError($attribute,'El numero de Contrato: '.$this->$attribute.' ya fue registrado');
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

	// Delete cascade / Borrado en cascada
	public function beforeDelete(){
	    foreach($this->facturas as $c)
	        	$c->delete();
	    return parent::beforeDelete();
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
		$criteria->compare('num_contrato',$this->num_contrato,true);
		$criteria->compare('anho',$this->anho);
		$criteria->compare('fecha',$this->fecha,true);
		$criteria->compare('tipo',$this->tipo,true);
		$criteria->compare('ente_organo_id',Usuarios::model()->actual()->ente_organo_id);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Procedimientos the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
