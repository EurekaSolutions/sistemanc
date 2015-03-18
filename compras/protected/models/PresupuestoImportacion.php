<?php

/**
 * This is the model class for table "public.presupuesto_importacion".
 *
 * The followings are the available columns in table 'public.presupuesto_importacion':
 * @property string $codigo_ncm_id
 * @property string $producto_id
 * @property string $cantidad
 * @property string $fecha_llegada
 * @property string $monto_presupuesto
 * @property string $tipo
 * @property string $monto_ejecutado
 * @property string $divisa_id
 * @property string $descripcion
 * @property string $presupuesto_partida_id
 */
class PresupuestoImportacion extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'public.presupuesto_importacion';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('codigo_ncm_id, producto_id, cantidad, fecha_llegada, monto_presupuesto, tipo, divisa_id, descripcion', 'required'),
			array('monto_presupuesto, monto_ejecutado', 'numerical'),
			array('cantidad', 'numerical', 'integerOnly'=>true, 'min'=>1),
			array('codigo_ncm_id', 'codigoNcmUnico', 'except'=>'update'),
			array('tipo', 'length', 'max'=>100),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('codigo_ncm_id, presupuesto_id, producto_id, cantidad, fecha_llegada, monto_presupuesto, tipo, monto_ejecutado, divisa_id, presupuesto_partida_id', 'safe', 'on'=>'search'),
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
			'codigosNcms' => array(self::BELONGS_TO, 'CodigosNcm', array('codigo_ncm_id'=>'codigo_ncm_id')),
			'producto' => array(self::BELONGS_TO, 'Productos', 'producto_id'),
			'presupuestoPartida' => array(self::BELONGS_TO, 'PresupuestoPartidas', array('presupuesto_partida_id'=>'presupuesto_partida_id')),
			'divisa' => array(self::BELONGS_TO, 'Divisas', array('divisa_id'=>'divisa_id')),
		);
	}
	
	public function beforeDelete(){
		// Eliminar todos los codigos arancelarios del producto
		if(!$this->scenario == 'eliminarproducto')
	    	foreach($this->findAllByAttributes(array('presupuesto_partida_id'=>$this->presupuesto_partida_id,'producto_id'=>$this->producto_id)) as $c)
	        	$c->delete();
	    return parent::beforeDelete();
	}

/*	public function behaviors()
	{
	    return array(
	        'ActiveRecordLogableBehavior'=>
	            'application.behaviors.ActiveRecordLogableBehavior',
	    );
	}*/
	
	public function codigoNcmUnico($attribute,$params)
	{
		if($this->presupuesto_partida_id and $this->codigo_ncm_id and $this->producto_id)
		{
				
				if($this->find('presupuesto_partida_id=:presupuesto_partida_id AND codigo_ncm_id=:codigo_ncm_id AND producto_id=:producto_id', 
						array(':presupuesto_partida_id' =>$this->presupuesto_partida_id, ':codigo_ncm_id' =>  $this->codigo_ncm_id, ':producto_id' => $this->producto_id)))
				{
					$this->addError($attribute, 'El código arancelario ya se encuentra asociado al producto seleccionado!');
				}
			
		}
	}
	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'codigo_ncm_id' => 'Código arancelario',
			'producto_id,' => 'Producto',
			'cantidad' => 'Cantidad',
			'fecha_llegada' => 'Fecha de compra',
			'monto_presupuesto' => 'Costo unitario en divisa ',
			'tipo' => 'Tipo',
			'monto_ejecutado' => 'Monto Ejecutado',
			'divisa_id' => 'Divisa',
			'descripcion' => 'Descripción',
			'presupuesto_partida_id' => 'Presupuesto Partida',
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
		$criteria->compare('producto_id',$this->producto_id,true);
		$criteria->compare('cantidad',$this->cantidad,true);
		$criteria->compare('fecha_llegada',$this->fecha_llegada,true);
		$criteria->compare('monto_presupuesto',$this->monto_presupuesto,true);
		$criteria->compare('tipo',$this->tipo,true);
		$criteria->compare('monto_ejecutado',$this->monto_ejecutado,true);
		$criteria->compare('divisa_id',$this->divisa_id,true);
		$criteria->compare('descripcion',$this->descripcion,true);
		$criteria->compare('presupuesto_partida_id',$this->presupuesto_partida_id,true);

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
