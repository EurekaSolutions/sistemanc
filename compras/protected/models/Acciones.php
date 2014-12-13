<?php

/**
 * This is the model class for table "public.acciones".
 *
 * The followings are the available columns in table 'public.acciones':
 * @property string $accion_id
 * @property string $nombre
 * @property string $codigo
 *
 * The followings are the available model relations:
 * @property PresupuestoPartidaAcciones[] $presupuestoPartidaAcciones
 */
class Acciones extends CActiveRecord
{

	public $partida;
	public $general;
	public $monto;
	public $fuente;
	public $especifica;
	public $subespecifica;

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'public.acciones';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('nombre', 'required'),
			array('partida, general, monto, fuente, especifica', 'required', 'on' => 'crearaccion'),
			array('especifica, subespecifica', 'condinero', 'partida_id'=> !empty($this->$subespecifica) ? $this->$subespecifica:$this->$especifica 'on'=>'crearaccion'),

			array('monto', 'numerical', 'integerOnly'=>false, 'min'=>1),
			array('codigo', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('accion_id, nombre, codigo', 'safe', 'on'=>'search'),
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
			'presupuestoPartidaAcciones' => array(self::HAS_MANY, 'PresupuestoPartidaAcciones', 'accion_id'),
		);
	}

	public function condinero($attribute,$params)
	{
		
		$criteria = new CDbCriteria();

		$usuario = Usuarios::model()->findByPk(Yii::app()->user->getId());

		if($this->nombre)
		{
			$accion = Acciones::model()->find('codigo=:codigo', array(':codigo' => $this->nombre));


			$presupuestopartidaproyecto = PresupuestoPartidaAcciones::model()->findAll('accion_id=:accion_id and ente_organo_id=:ente_organo_id', array(':accion_id'=>$accion->accion_id, ':ente_organo_id'=>$usuario->ente_organo_id));

			foreach ($presupuestopartidaproyecto as $key => $value) {
				
				$value->presupuesto_partida_id;

				$partida = PresupuestoPartidas::model()->find('presupuesto_partida_id=:presupuesto_partida_id and ente_organo_id=:ente_organo_id and tipo=:tipo', array(':ente_organo_id' => $usuario->ente_organo_id, ':presupuesto_partida_id' => $value->presupuesto_partida_id, ':tipo' => 'A'));	
				
				if($partida->partida_id == $params['partida_id'])
				{
					if(!empty($this->$subespecifica))
						$partida = $attribute['subespecifica'];
					else
						$partida = $attribute['especifica'];
					
					$this->addError($partida, 'Esta partida ya tiene asignado dinero para esta acción centralizada!');
					break;
				}			
			}
		}
		//$criteria->condition = "ente_organo_id=".$usuario->ente_organo_id ;
		//$criteria->addSearchCondition('t.nombre', $this->nombre);
		//$criteria->compare('LOWER(nombre)',strtolower($this->nombre),true); 
	}



	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'accion_id' => 'Accion',
			'nombre' => 'Nombre',
			'codigo' => 'Codigo',
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

		$criteria->compare('accion_id',$this->accion_id,true);
		$criteria->compare('nombre',$this->nombre,true);
		$criteria->compare('codigo',$this->codigo,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Acciones the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
