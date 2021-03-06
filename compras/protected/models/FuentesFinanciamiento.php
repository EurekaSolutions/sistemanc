<?php

/**
 * This is the model class for table "fuentes_financiamiento".
 *
 * The followings are the available columns in table 'fuentes_financiamiento':
 * @property string $fuente_financiamiento_id
 * @property string $nombre
 * @property boolean $activo
 *
 * The followings are the available model relations:
 * @property PresupuestoPartidas[] $presupuestoPartidases
 */
class FuentesFinanciamiento extends ActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'public.fuentes_financiamiento';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('nombre, activo', 'required'),
			array('nombre', 'unique', 'className' => 'FuentesFinanciamiento', 'attributeName' => 'nombre', 'message'=>'Esta fuente ya se encuentra registrada en nuestro repositorio'),
			array('nombre', 'length', 'max'=>255),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('fuente_financiamiento_id, nombre, activo', 'safe', 'on'=>'search'),
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
			'presupuestoPartidas' => array(self::HAS_MANY, 'FuentePresupuesto', array('fuente_id'=>'fuente_financiamiento_id')),
		);
	}

	public function defaultScope()
	{
	    return array(
	        'condition'=>$this->scenario=='buscar'?'activo=true':'',
	        //'order'=> "cod_segmento ASC, cod_familia ASC, cod_clase ASC, cod_producto ASC",
	    );
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'fuente_financiamiento_id' => 'Fuente Financiamiento',
			'nombre' => 'Nombre',
			'activo' => 'Activo',
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

		$criteria->compare('fuente_financiamiento_id',$this->fuente_financiamiento_id,true);
		$criteria->compare('nombre',$this->nombre,true);
		$criteria->compare('activo',$this->activo);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return FuentesFinanciamiento the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
