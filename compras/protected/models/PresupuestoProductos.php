<?php

/**
 * This is the model class for table "public.presupuesto_productos".
 *
 * The followings are the available columns in table 'public.presupuesto_productos':
 * @property string $presupuesto_id
 * @property string $producto_id
 * @property string $unidad_id
 * @property string $costo_unidad
 * @property string $cantidad
 * @property string $monto_presupuesto
 * @property string $tipo
 * @property string $monto_ejecutado
 * @property string $proyecto_partida_id
 *
 * The followings are the available model relations:
 * @property CodigosNcm[] $codigosNcms
 * @property Productos $producto
 * @property PresupuestoPartidas $proyectoPartida
 * @property Unidades $unidad
 */
class PresupuestoProductos extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'public.presupuesto_productos';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('producto_id, unidad_id, costo_unidad, cantidad, monto_presupuesto, tipo, monto_ejecutado, proyecto_partida_id', 'required'),
			array('costo_unidad, monto_presupuesto, monto_ejecutado', 'length', 'max'=>38),
			array('costo_unidad, monto_presupuesto, monto_ejecutado', 'numerical'),
			array('cantidad', 'numerical', 'integerOnly'=>true, 'min'=>1),
			array('tipo', 'length', 'max'=>60),
			array('producto_id', 'unicoProducto'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('presupuesto_id, producto_id, unidad_id, costo_unidad, cantidad, monto_presupuesto, tipo, monto_ejecutado, proyecto_partida_id', 'safe', 'on'=>'search'),
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
			//'codigosNcms' => array(self::MANY_MANY, 'CodigosNcm', 'presupuesto_importacion(presupuesto_id, codigo_ncm_id)'),
			'producto' => array(self::BELONGS_TO, 'Productos', 'producto_id'),
			'proyectoPartida' => array(self::BELONGS_TO, 'PresupuestoPartidas', array('proyecto_partida_id'=>'presupuesto_partida_id')),
			'unidad' => array(self::BELONGS_TO, 'Unidades', 'unidad_id'),
			//'importado' => array(self::BELONGS_TO, 'PresupuestoImportacion', 'presupuesto_id'),
		);
	}


	public function unicoProducto($attribute, $params)
	{
		if($this->producto_id and $this->proyecto_partida_id)
		{
			if($this->find('producto_id=:producto_id and proyecto_partida_id=:proyecto_partida_id', array(':producto_id'=>$this->producto_id, ':proyecto_partida_id'=>$this->proyecto_partida_id)))
			{
				$this->addError($this->producto_id, 'Este producto ya se encuentra asignado a este proyeco!');//$partida = $attribute['especifica'];
			}
		}
	}

	public function beforeDelete(){
/*	    foreach($this->importado as $c)
	        $c->delete();*/
	    return parent::beforeDelete();
	}

	public function behaviors()
	{
	    return array(
	        'ActiveRecordLogableBehavior'=>
	            'application.behaviors.ActiveRecordLogableBehavior',
	    );
	}
	
	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'presupuesto_id' => 'Presupuesto',
			'producto_id' => 'Producto',
			'unidad_id' => 'Unidad',
			'costo_unidad' => 'Costo Unidad',
			'cantidad' => 'Cantidad',
			'monto_presupuesto' => 'Monto Presupuesto',
			'tipo' => 'Tipo',
			'monto_ejecutado' => 'Monto Ejecutado',
			'proyecto_partida_id' => 'Proyecto Partida',
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

		$criteria->compare('presupuesto_id',$this->presupuesto_id,true);
		$criteria->compare('producto_id',$this->producto_id,true);
		$criteria->compare('unidad_id',$this->unidad_id,true);
		$criteria->compare('costo_unidad',$this->costo_unidad,true);
		$criteria->compare('cantidad',$this->cantidad,true);
		$criteria->compare('monto_presupuesto',$this->monto_presupuesto,true);
		$criteria->compare('tipo',$this->tipo,true);
		$criteria->compare('monto_ejecutado',$this->monto_ejecutado,true);
		$criteria->compare('proyecto_partida_id',$this->proyecto_partida_id,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return PresupuestoProductos the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
