<?php

/**
 * This is the model class for table "presupuesto_importacion".
 *
 * The followings are the available columns in table 'presupuesto_importacion':
 * @property string $codigo_ncm_id
 * @property string $presupuesto_id
 * @property string $cantidad
 * @property string $fecha_llegada
 * @property string $monto_presupuesto
 * @property string $tipo
 * @property string $monto_ejecutado
 * @property string $divisa_id
 *
 * The followings are the available model relations:
 * @property CodigosNcm $codigoNcm
 * @property Divisas $divisa
 * @property PresupuestoProductos $presupuesto
 */
class PresupuestoImportacion extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'presupuesto_importacion';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('codigo_ncm_id, presupuesto_id, cantidad, fecha_llegada, monto_presupuesto, tipo, monto_ejecutado, divisa_id', 'required'),
			array('monto_presupuesto, monto_ejecutado', 'length', 'max'=>38),
			array('tipo', 'length', 'max'=>100),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('codigo_ncm_id, presupuesto_id, cantidad, fecha_llegada, monto_presupuesto, tipo, monto_ejecutado, divisa_id', 'safe', 'on'=>'search'),
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
			'codigoNcm' => array(self::BELONGS_TO, 'CodigosNcm', 'codigo_ncm_id'),
			'divisa' => array(self::BELONGS_TO, 'Divisas', 'divisa_id'),
			'presupuesto' => array(self::BELONGS_TO, 'PresupuestoProductos', 'presupuesto_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'codigo_ncm_id' => 'Codigo Ncm',
			'presupuesto_id' => 'Presupuesto',
			'cantidad' => 'Cantidad',
			'fecha_llegada' => 'Fecha Llegada',
			'monto_presupuesto' => 'Monto Presupuesto',
			'tipo' => 'Tipo',
			'monto_ejecutado' => 'Monto Ejecutado',
			'divisa_id' => 'Divisa',
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

		$criteria->compare('codigo_ncm_id',$this->codigo_ncm_id,true);
		$criteria->compare('presupuesto_id',$this->presupuesto_id,true);
		$criteria->compare('cantidad',$this->cantidad,true);
		$criteria->compare('fecha_llegada',$this->fecha_llegada,true);
		$criteria->compare('monto_presupuesto',$this->monto_presupuesto,true);
		$criteria->compare('tipo',$this->tipo,true);
		$criteria->compare('monto_ejecutado',$this->monto_ejecutado,true);
		$criteria->compare('divisa_id',$this->divisa_id,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return PresupuestoImportacion the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}