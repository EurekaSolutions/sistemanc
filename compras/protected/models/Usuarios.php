<?php

/**
 * This is the model class for table "compras.usuarios".
 *
 * The followings are the available columns in table 'compras.usuarios':
 * @property string $usuario_id
 * @property string $codigo_onapre
 * @property string $usuario
 * @property string $contrasena
 * @property string $correo
 * @property string $creado_el
 * @property string $actualizado_el
 *
 * The followings are the available model relations:
 * @property EntesOrganos $codigoOnapre
 */
class Usuarios extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */

	public $repetir_contrasena;

	public $contrasena_inicial;

	// Minimo de caracteres necesarios para la contraseña
	public $min = 6;

	public function tableName()
	{
		return 'usuarios';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('actualizado_el, repetir_contrasena', 'required', 'on'=>'registro, actualizar'),
			array('correo, codigo_onapre, creado_el', 'required', 'on'=>'registro'),
			array('usuario, contrasena','required','on'=>'registro, login'),
			array('codigo_onapre', 'length', 'max'=>20),
			array('usuario, contrasena, repetir_contrasena', 'length', 'max'=>50),
			array('correo', 'length', 'max'=>255),
			array('correo','email'),
			array('contrasena','ext.validators.EPasswordStrength', 'min'=>$this->min, 'message'=>'La {attribute} es debil. La {attribute} debe contener al menos '.$this->min.' caracteres, al menos una letra minuscula, una mayuscula, y un número.'),
			array('codigo_onapre', 'validarCodigo'),
			array('llave_activacion, creado_el, actualizado_el, ultima_visita_el, correo_verificado', 'default', 'setOnEmpty' => true, 'value' => null, 'on' => 'search'),
			array('creado_el, actualizado_el, ultima_visita_el', 'date', 'format' => array('yyyy-MM-dd', 'yyyy-MM-dd HH:mm', 'yyyy-MM-dd HH:mm:ss'), 'on' => 'search'),
			array('activation_key', 'length', 'max'=>128, 'on' => 'search'),
			array('esta_activo, esta_deshabilitado, correo_verificado', 'boolean'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('usuario_id, codigo_onapre, usuario, contrasena, correo, creado_el, actualizado_el', 'safe', 'on'=>'search'),
			array('repetir_contrasena', 'compare', 'compareAttribute'=>'contrasena', 'operator'=>'==', 'on'=>'registro', 'message'=>'Las contraseñas deben coincidir.'),
			//array('repetir_contrasena', 'safe'),
		);
	}

	public function validarCodigo($codigo_onapre){
		//Como validamos que la institución esta ingresando	 el código que le pertenece?
		if(empty($this->codigoOnapre->codigo_onapre))
				$this->addError($codigo_onapre, 'El codigo onapre introducido no existe.');

		if(!empty($this->findByAttributes(array('codigo_onapre'=>$this->codigo_onapre))))
				$this->addError($codigo_onapre, 'Codigo ya utilizado.');
	}

	public function beforeValidate(){
		
		//date_default_timezone_set('America/Caracas');
    	$this->actualizado_el = date('d/m/Y h:i:s a', time());

    	if($this->isNewRecord)
 			$this->creado_el = $this->actualizado_el;

 		return parent::beforeValidate();
	}

  	public function beforeSave()
    {
    	

        // in this case, we will use the old hashed contrasena.
        if(empty($this->contrasena) && empty($this->repetir_contrasena) && !empty($this->contrasena_inicial))
            $this->contrasena=$this->repetir_contrasena=$this->contrasena_inicial;
 		

 		$this->codigo_onapre = $this->codigoOnapre->codigo_onapre;

		//because the hashes needs to match
        if(!empty($this->contrasena) && !empty($this->repetir_contrasena))
        {
            $this->contrasena = $this->hashPassword( $this->contrasena);
            $this->repetir_contrasena =  $this->hashPassword($this->repetir_contrasena);
        }

       			
        return parent::beforeSave();
    }

    public function afterFind()
    {
        //reset the contrasena to null because we don't want the hash to be shown.
        $this->contrasena_inicial = $this->contrasena;
        $this->contrasena = null;
 
        parent::afterFind();
    }
    
    public function hashPassword($valor)
    {
        return md5($valor);
    }

    public function verificarContrasena($contrasena){

    	if($this->hashPassword($contrasena) == $this->contrasena_inicial)
    		return true;
    	else
    		return false;

    }
	/**
	 * Authenticates the password.
	 * This is the 'authenticate' validator as declared in rules().
	 */
	public function autenticar($atributo,$parametros)
	{
		if(!$this->hasErrors())
		{
			$this->_identity=new UserIdentity($this->usuario,$this->contrasena);
			if(!$this->_identity->authenticate())
				$this->addError('contrasena','Usuario o contrasena incorrecta.');
		}
	}

	/**
	 * Logs in the user using the given username and password in the model.
	 * @return boolean whether login is successful
	 */
	public function login()
	{
		if($this->_identity===null)
		{
			$this->_identity=new UserIdentity($this->usuario,$this->contrasena);
			$this->_identity->authenticate();
		}
		if($this->_identity->errorCode===UserIdentity::ERROR_NONE)
		{
			$duration=$this->rememberMe ? 3600*24*30 : 0; // 30 days
			Yii::app()->user->login($this->_identity,$duration);
			return true;
		}
		else
			return false;
	}
	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'codigoOnapre' => array(self::BELONGS_TO, 'EntesOrganos', 'codigo_onapre'),
			'userLoginAttempts' => array(self::HAS_MANY, 'UserLoginAttempt', 'user_id', 'order'=>'performed_on DESC'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			//'usuario_id' => 'Usuario',
			'codigo_onapre' => 'Codigo Onapre',
			'usuario' => 'Usuario',
			'contrasena' => 'Contraseña',
			'repetir_contrasena' => 'Confirmar Contraseña',
			'correo' => 'Correo',
			'creado_el' => 'Creado El',
			'actualizado_el' => 'Actualizado El',
			'esta_deshabilitado' => 'Cuenta deshabilitada',
			'esta_activo' => 'Cuenta activa',
			'ultima_visita_el' => 'Ultima visita el',
			'llave_activacion' => 'Llave de activación',
			'correo_verificado' => 'Correo Verificado',
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

		$criteria->compare('usuario_id',$this->usuario_id,true);
		$criteria->compare('codigo_onapre',$this->codigo_onapre,true);
		$criteria->compare('usuario',$this->usuario,true);
		$criteria->compare('contrasena',$this->contrasena,true);
		$criteria->compare('correo',$this->correo,true);
		$criteria->compare('creado_el',$this->creado_el,true);
		$criteria->compare('actualizado_el',$this->actualizado_el,true);
		$criteria->compare('esta_deshabilitado',$this->esta_deshabilitado,true);
		$criteria->compare('esta_activo',$this->esta_activo,true);
		$criteria->compare('ultima_visita_el',$this->ultima_visita_el,true);
		$criteria->compare('correo_verificado',$this->correo_verificado,true);
		$criteria->compare('llave_activacion',$this->llave_activacion,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Usuarios the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
