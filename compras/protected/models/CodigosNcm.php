<?php

/**
 * This is the model class for table "public.codigos_ncm".
 *
 * The followings are the available columns in table 'public.codigos_ncm':
 * @property string $codigo_ncm_id
 * @property string $codigo_ncm_nivel_1
 * @property string $codigo_ncm_nivel_2
 * @property string $codigo_ncm_nivel_3
 * @property string $codigo_ncm_nivel_4
 * @property string $descripcion_ncm
 * @property string $version
 * @property string $fecha_desde
 * @property string $fecha_hasta
 * @property string $unidad
 * @property string $enmienda
 *
 * The followings are the available model relations:
 * @property PresupuestoProductos[] $presupuestoProductoses
 */
class CodigosNcm extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'public.codigos_ncm';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('codigo_ncm_nivel_1, codigo_ncm_nivel_2, codigo_ncm_nivel_3, codigo_ncm_nivel_4', 'length', 'max'=>5),
			array('descripcion_ncm', 'length', 'max'=>255),
			array('unidad', 'length', 'max'=>40),
			array('version, fecha_desde, fecha_hasta, enmienda', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('codigo_ncm_id, codigo_ncm_nivel_1, codigo_ncm_nivel_2, codigo_ncm_nivel_3, codigo_ncm_nivel_4, descripcion_ncm, version, fecha_desde, fecha_hasta, unidad, enmienda', 'safe', 'on'=>'search'),
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
			'presupuestoProductoses' => array(self::MANY_MANY, 'PresupuestoProductos', 'presupuesto_importacion(codigo_ncm_id, presupuesto_id)'),
		);
	}

	public function numeroCodigoNcm(){
		$numCodigo = $this->codigo_ncm_nivel_1;
			
			if(intval($this->codigo_ncm_nivel_4) != 0)
				$numCodigo .= '.'.$this->codigo_ncm_nivel_2.'.'.$this->codigo_ncm_nivel_3.'.'.$this->codigo_ncm_nivel_4;
			else
			if(intval($this->codigo_ncm_nivel_3) != 0)
				$numCodigo .= '.'.$this->codigo_ncm_nivel_2.'.'.$this->codigo_ncm_nivel_3;
			else
			if(intval($this->codigo_ncm_nivel_2) != 0)
				$numCodigo .= '.'.$this->codigo_ncm_nivel_2;

			return $numCodigo;
	}

	/**
	 * @return string html nombre de partida compuesto con el nombre
	 */
	public function etiquetaCodigo(){
		return CHtml::encode($this->numeroCodigoNcm().' - '. $this->descripcion_ncm);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'codigo_ncm_id' => 'Codigo Ncm',
			'codigo_ncm_nivel_1' => 'Codigo Ncm Nivel 1',
			'codigo_ncm_nivel_2' => 'Codigo Ncm Nivel 2',
			'codigo_ncm_nivel_3' => 'Codigo Ncm Nivel 3',
			'codigo_ncm_nivel_4' => 'Codigo Ncm Nivel 4',
			'descripcion_ncm' => 'Descripcion Ncm',
			'version' => 'Version',
			'fecha_desde' => 'Fecha Desde',
			'fecha_hasta' => 'Fecha Hasta',
			'unidad' => 'Unidad',
			'enmienda' => 'Enmienda',
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
		$criteria->compare('codigo_ncm_nivel_1',$this->codigo_ncm_nivel_1,true);
		$criteria->compare('codigo_ncm_nivel_2',$this->codigo_ncm_nivel_2,true);
		$criteria->compare('codigo_ncm_nivel_3',$this->codigo_ncm_nivel_3,true);
		$criteria->compare('codigo_ncm_nivel_4',$this->codigo_ncm_nivel_4,true);
		$criteria->compare('descripcion_ncm',$this->descripcion_ncm,true);
		$criteria->compare('version',$this->version,true);
		$criteria->compare('fecha_desde',$this->fecha_desde,true);
		$criteria->compare('fecha_hasta',$this->fecha_hasta,true);
		$criteria->compare('unidad',$this->unidad,true);
		$criteria->compare('enmienda',$this->enmienda,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return CodigosNcm the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
