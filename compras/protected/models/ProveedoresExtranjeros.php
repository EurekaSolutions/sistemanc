<?php

/**
 * This is the model class for table "public.proveedores_extranjeros".
 *
 * The followings are the available columns in table 'public.proveedores_extranjeros':
 * @property integer $id
 * @property integer $proveedor_id
 * @property string $num_identificacion
 * @property integer $pais_id
 * @property integer $codigo_postal
 * @property string $calle
 * @property string $distrito
 * @property string $poblacion
 * @property string $tlf_fijo
 * @property string $pagina_web
 *
 * The followings are the available model relations:
 * @property Paises $pais
 * @property Proveedores $proveedor
 */
class ProveedoresExtranjeros extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'public.proveedores_extranjeros';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('pais_id, calle, poblacion, tlf_fijo, pagina_web', 'required'),
			//array('pagina_web', 'match', 'pattern' => '/^(http:\/\/|https:\/\/)?(www.)?([a-zA-Z0-9]+).[a-zA-Z0-9]*.[a-z]{3}.?([a-z]+)?$/', 'allowEmpty'=>false,'message'=>'Debe introducir un formato de página web valido'),

			array('pagina_web', 'url', 'defaultScheme' => 'http'),
			array('proveedor_id, pais_id', 'numerical', 'integerOnly'=>true),
			array('num_identificacion, calle, distrito, poblacion, tlf_fijo, pagina_web', 'length', 'max'=>255),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, proveedor_id, num_identificacion, pais_id, codigo_postal, calle, distrito, poblacion, tlf_fijo, pagina_web', 'safe', 'on'=>'search'),
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
			'pais' => array(self::BELONGS_TO, 'Paises', 'pais_id'),
			'proveedor' => array(self::BELONGS_TO, 'Proveedores', 'proveedor_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'proveedor_id' => 'Proveedor',
			'num_identificacion' => 'Número de Identificacón',
			'pais_id' => 'País',
			'codigo_postal' => 'Código Postal',
			'calle' => 'Calle',
			'distrito' => 'Distrito',
			'poblacion' => 'Población',
			'tlf_fijo' => 'Tlf. Fijo',
			'pagina_web' => 'Página Web',
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

		$criteria->compare('id',$this->id);
		$criteria->compare('proveedor_id',$this->proveedor_id);
		$criteria->compare('num_identificacion',$this->num_identificacion,true);
		$criteria->compare('pais_id',$this->pais_id);
		$criteria->compare('codigo_postal',$this->codigo_postal);
		$criteria->compare('calle',$this->calle,true);
		$criteria->compare('distrito',$this->distrito,true);
		$criteria->compare('poblacion',$this->poblacion,true);
		$criteria->compare('tlf_fijo',$this->tlf_fijo,true);
		$criteria->compare('pagina_web',$this->pagina_web,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return ProveedoresExtranjeros the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
