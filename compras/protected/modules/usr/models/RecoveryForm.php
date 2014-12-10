<?php

/**
 * RecoveryForm class.
 * RecoveryForm is the data structure for keeping
 * password recovery form data. It is used by the 'recovery' action of 'DefaultController'.
 */
class RecoveryForm extends BasePasswordForm
{
	public $usuario;
	public $correo;
	public $llave_activacion;
	public $cedula;

	/**
	 * @var IdentityInterface cached object returned by @see getIdentity()
	 */
	private $_identity;

	/**
	 * Declares the validation rules.
	 * The rules state that username and password are required,
	 * and password needs to be authenticated.
	 */
	public function rules() {
		$rules = array_merge($this->getBehaviorRules(), array(
			array('cedula, usuario, correo', 'filter', 'filter'=>'trim'),
			array('cedula, usuario, correo', 'default', 'setOnEmpty'=>true, 'value' => null),
			array('correo, cedula', 'configurarUsuario','on'=>'reset', 'message'=>'No se pudo obtener los datos del usuario'),
			array('cedula, usuario, correo', 'existingIdentity'),
			array('correo', 'email'),
			array('verifyCode', 'required'),
			array('verifyCode', 'safe'),
			//array('codigo_onapre', 'exist', 'attributeName'=>'codigo_onapre','className'=>'EntesOrganos', 'message'=>Yii::t('UsrModule.usr','Codigo Onapre no existe.')),

			array('llave_activacion', 'filter', 'filter'=>'trim', 'on'=>'reset,verify'),
			array('llave_activacion', 'default', 'setOnEmpty'=>true, 'value' => null, 'on'=>'reset,verify'),
			array('llave_activacion', 'required', 'on'=>'reset,verify'),
			array('llave_activacion', 'validActivationKey', 'on'=>'reset,verify'),
		), $this->rulesAddScenario(parent::rules(), 'reset'));

		return $rules;
	}

	/**
	 * Inline validator that checks if an identity exists matching provided username or password.
	 * @param string $attribute
	 * @param array $params
	 * @return boolean
	 */
	public function configurarUsuario($attribute,$params) {
		if($this->hasErrors()) {
			return;
		}

		// Usuario recuperando/reseteando contraseña
		$usuario = Usuarios::model()->findByAttributes(array('usuario'=>$this->usuario));
		if(!$usuario)
			return false;
		$this->cedula = $usuario->cedula;
		$this->correo = $usuario->correo;

		return true;
	}
	/**
	 * Declares attribute labels.
	 */
	public function attributeLabels() {
		return array_merge($this->getBehaviorLabels(), parent::attributeLabels(), array(
			'usuario'		=> Yii::t('UsrModule.usr','Usuario'),
			'correo'			=> Yii::t('UsrModule.usr','Correo'),
			'llave_activacion'	=> Yii::t('UsrModule.usr','Llave de Activación'),
			'cedula'	=> Yii::t('UsrModule.usr','Cédula'),
		));
	}

	/**
	 * @inheritdoc
	 */
	public function getIdentity() {
		if($this->_identity===null) {
			// generate a fake object just to check if it implements a correct interface
			$userIdentityClass = $this->userIdentityClass;
			$fakeIdentity = new $userIdentityClass(null, null);
			if (!($fakeIdentity instanceof IActivatedIdentity)) {
				throw new CException(Yii::t('UsrModule.usr','The {class} class must implement the {interface} interface.',array('{class}'=>$userIdentityClass, '{interface}'=>'IActivatedIdentity')));
			}
			$attributes = array();
			if ($this->usuario !== null) $attributes['usuario'] = $this->usuario;
			if ($this->correo !== null) $attributes['correo'] = $this->correo;
			//if ($this->cedula !== null) $attributes['cedula'] = $this->cedula;
			if (!empty($attributes))
				$this->_identity=$userIdentityClass::find($attributes);
		}
		return $this->_identity;
	}

	/**
	 * Inline validator that checks if an identity exists matching provided username or password.
	 * @param string $attribute
	 * @param array $params
	 * @return boolean
	 */
	public function existingIdentity($attribute,$params) {
		if($this->hasErrors()) {
			return;
		}
		$identity = $this->getIdentity();
		if ($identity === null) {
			/*if ($this->usuario !== null) {
				$this->addError('usuario',Yii::t('UsrModule.usr','No user found matching this usuario.'));
			} else*/if ($this->cedula !== null) {
				$this->addError('codigo_onapre',Yii::t('UsrModule.usr','Ningún usuario coincide con el codigo onapre indicado.'));
			} elseif ($this->correo !== null) {
				$this->addError('correo',Yii::t('UsrModule.usr','Ningún usuario coincide con esta dirección de correo electrónico.'));
			} else {
				$this->addError('usuario',Yii::t('UsrModule.usr','Por favor, especifique su cédula o correo electrónico.'));
			}
			return false;
		} elseif ($identity->isDisabled()) {
			$this->addError('usuario',Yii::t('UsrModule.usr','La cuenta de usuario ha sido desactivada.'));
			return false;
		}
		return true;
	}

	/**
	 * Validates the activation key.
	 */
	public function validActivationKey($attribute,$params) {
		if($this->hasErrors()) {
			return;
		}
		if (($identity = $this->getIdentity()) === null)
			return false;

		$errorCode = $identity->verifyActivationKey($this->llave_activacion);
		switch($errorCode) {
			default:
			case $identity::ERROR_AKEY_INVALID:
				$this->addError('llave_activacion',Yii::t('UsrModule.usr','Llave de activación invalida.'));
				return false;
			case $identity::ERROR_AKEY_TOO_OLD:
				$this->addError('llave_activacion',Yii::t('UsrModule.usr','Llave de activación vencida.'));
				return false;
			case $identity::ERROR_AKEY_NONE:
				return true;
		}
		return true;
	}

	/**
	 * Resets user password using the new one given in the model.
	 * @return boolean whether password reset was successful
	 */
	public function resetPassword() {
		$identity = $this->getIdentity();
		return $identity->resetPassword($this->newPassword);
	}

	/**
	 * Logs in the user using the given username and new password.
	 * @return boolean whether login is successful
	 */
	public function login() {
		$identity = $this->getIdentity();

		$identity->contrasena = $identity->password = $this->newPassword;
		$identity->authenticate();
		if($identity->getIsAuthenticated()) {
			return Yii::app()->user->login($identity,0);
		}
		return false;
	}
}
