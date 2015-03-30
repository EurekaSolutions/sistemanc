<?php

/**
 * This is the model class for table "public.partidas".
 *
 * The followings are the available columns in table 'public.partidas':
 * @property string $partida_id
 * @property string $p1
 * @property string $p2
 * @property string $p3
 * @property string $p4
 * @property string $nombre
 * @property boolean $habilitada
 *
 * The followings are the available model relations:
 * @property PresupuestoPartidas[] $presupuestoPartidases
 * @property PartidaProductos[] $partidaProductoses
 */
class Partidas extends ActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'public.partidas';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('p1, p2, p3, p4, nombre', 'required'),
			array('p1, p2, p3, p4', 'length', 'max'=>4),
			array('habilitada', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('partida_id, p1, p2, p3, p4, nombre, habilitada', 'safe', 'on'=>'search'),
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
			'presupuestoPartidases' => array(self::HAS_MANY, 'PresupuestoPartidas', 'partida_id'),
			'partidaProductos' => array(self::HAS_MANY, 'PartidaProductos', 'partida_id'),
			//'partidasproductos' => array(self::MANY_MANY, 'Productos', 'partida_productos(partida_id, producto_id)'),
			'productos' => array(self::MANY_MANY, 'Productos', 'partida_productos(partida_id, producto_id)'),
		);
	}

	public function defaultScope()
	{
/*		//print_r($this);
		CVarDumper::dump($this->getScenario());
		echo ($this->scenario!='search')?'habilitada=true':'';
		//Yii::app()->end();*/
	    return array(
	        'condition'=> ($this->getScenario()!='search')?'habilitada=true':'habilitada=true OR habilitada=false',//"username <> ''",
	        'order'=> "p1 ASC, p2 ASC, p3 ASC, p4 ASC",
	    );
	}

	public function scopes()
	{
	    return array(
		  	'todas'=>array(
		          'condition'=>'habilitada=true OR habilitada=false',
		    ),
		    'habilitadas'=>array(
		          'condition'=>'habilitada=true',
		    ),
		  	'noHabilitadas'=>array(
		          'condition'=>'habilitada=false',
		    ),
/*		    'recently'=>array(
		          'order'=>'create_time DESC',
		          'limit'=>5,
		    ),*/
    );
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'partida_id' => 'Partida',
			'p1' => 'P1',
			'p2' => 'P2',
			'p3' => 'P3',
			'p4' => 'P4',
			'nombre' => 'Nombre',
			'habilitada' => 'Habilitada',
		);
	}

	/**
	 * @return @string numero de partida
	 */
	public function numeroPartida(){
			$numPartida = $this->p1;
			if($this->p2 != 0){
				$numPartida .= '.'.sprintf("%02s", $this->p2);
			}
			if($this->p3 != 0){
				$numPartida .= '.'.sprintf("%02s", $this->p3);
			}
			if($this->p4 != 0){
				$numPartida .= '.'.sprintf("%02s", $this->p4);
			}

		return $numPartida;
	}

	/**
	 * @return html nombre de partida compuesto con el nombre
	 */
	public function etiquetaPartida(){
		return CHtml::encode($this->numeroPartida().' - '. $this->nombre);
	}

	 /**
	 * @return html nombre de partida compuesto con el nombre
	 */
	public function listaProductos()
	{
		$name = "Seleccionar producto";

		//echo CHtml::tag('option', array('value'=>""),CHtml::encode($name),true);

		$productosPartidas = array();
	   
	    $productosPartidas = CHtml::listData($this->productos, 'producto_id', 
								function($producto){ return $producto->etiquetaProducto(); });
	    
	    foreach($productosPartidas as $value => $name)
	    {
	        echo CHtml::tag('option',
	                   array('value'=>$value),CHtml::encode($name),true);
	    }
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

		$criteria->compare('partida_id',$this->partida_id,true);
		$criteria->compare('p1',$this->p1,true);
		$criteria->compare('p2',$this->p2,true);
		$criteria->compare('p3',$this->p3,true);
		$criteria->compare('p4',$this->p4,true);
		$criteria->compare('nombre',$this->nombre,true);
		$criteria->compare('habilitada',$this->habilitada);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Partidas the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
