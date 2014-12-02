<?php

Yii::import('application.extensions.validators.*');

/**
 * ProfileForm class.
 * ProfileForm is the data structure for keeping
 * password recovery form data. It is used by the 'recovery' action of 'DefaultController'.
 */
class ProfileForm extends BaseUsrForm
{
	public $usuario;
	public $correo;
	//public $firstName;
	//public $lastName;
	public $picture;
	public $removePicture;
	public $contrasena;
	public $codigo_onapre;

	/**
	 * @var IdentityInterface cached object returned by @see getIdentity()
	 */
	private $_identity;
	/**
	 * @var array Picture upload validation rules.
	 */
	private $_pictureUploadRules;

	private $_min = 6;

	/**
	 * Returns rules for picture upload or an empty array if they are not set.
	 * @return array
	 */
	public function getPictureUploadRules()
	{
		return $this->_pictureUploadRules === null ? array() : $this->_pictureUploadRules;
	}

	/**
	 * Sets rules to validate uploaded picture. Rules should NOT contain attribute name as this method adds it.
	 * @param array $rules
	 */
	public function setPictureUploadRules($rules)
	{
		$this->_pictureUploadRules = array();
		if (!is_array($rules))
			return;
		foreach($rules as $rule) {
			$this->_pictureUploadRules[] = array_merge(array('picture'), $rule);
		}
	}

	/**
	 * Declares the validation rules.
	 */
	public function rules()
	{
		return array_merge($this->getBehaviorRules(), array(
			array('usuario, correo, removePicture', 'filter', 'filter'=>'trim'),
			array('usuario, correo, removePicture', 'default', 'setOnEmpty'=>true, 'value' => null),
			
			array('codigo_onapre', 'length', 'max'=>20),
			array('codigo_onapre', 'validarCodigo'),
			array('usuario, correo', 'required'),
			array('codigo_onapre', 'required', 'except'=>'register'),
			array('usuario, correo', 'uniqueIdentity'),
			array('correo', 'email'),
			array('removePicture', 'boolean'),
			//array('contrasena', 'validCurrentPassword', 'except'=>'register'),
			array('contrasena','EPasswordStrength', 'min'=>$this->_min, 'except'=>'register', 'message'=>'La {attribute} es debil. La {attribute} debe contener al menos '.$this->_min.' caracteres, al menos una letra minuscula, una mayuscula, y un número.'),
		), $this->pictureUploadRules);
	}

	public function validarCodigo($codigo_onapre){
		//Como validamos que la institución esta ingresando	 el código que le pertenece?
		if(empty(EntesOrganos::model()->findByAttributes(array('codigo_onapre'=>$this->$codigo_onapre))))
				$this->addError($codigo_onapre, 'El codigo onapre introducido no existe.');

		if(!empty(Usuarios::model()->findByAttributes(array('codigo_onapre'=>$this->codigo_onapre))))
				$this->addError($codigo_onapre, 'Codigo ya utilizado.');
	}

	/**
	 * Declares attribute labels.
	 */
	public function attributeLabels()
	{
		return array_merge($this->getBehaviorLabels(), array(
			'usuario'		=> Yii::t('UsrModule.usr','Usuario'),
			'correo'			=> Yii::t('UsrModule.usr','Correo'),
			'codigo_onapre'		=> Yii::t('UsrModule.usr','Codigo Onapre'),
			//'lastName'		=> Yii::t('UsrModule.usr','Last name'),
			//'picture'		=> Yii::t('UsrModule.usr','Profile picture'),
			//'removePicture'	=> Yii::t('UsrModule.usr','Remove picture'),
			'contrasena'		=> Yii::t('UsrModule.usr','Contraseña'),
		));
	}

	/**
	 * @inheritdoc
	 */
	public function getIdentity()
	{
		if($this->_identity===null) {
			$userIdentityClass = $this->userIdentityClass;
			if ($this->scenario == 'register') {
				$this->_identity = new $userIdentityClass(null, null);
			} else {
				$this->_identity = $userIdentityClass::find(array('usuario_id'=>Yii::app()->user->getId()));
			}
			if ($this->_identity !== null && !($this->_identity instanceof IEditableIdentity)) {
				throw new CException(Yii::t('UsrModule.usr','The {class} class must implement the {interface} interface.',array('{class}'=>get_class($this->_identity),'{interface}'=>'IEditableIdentity')));
			}
		}
		return $this->_identity;
	}

	public function setIdentity($identity)
	{
		$this->_identity = $identity;
	}

	public function uniqueIdentity($attribute,$params)
	{
		if($this->hasErrors()) {
			return;
		}
		$userIdentityClass = $this->userIdentityClass;
		$existingIdentity = $userIdentityClass::find(array($attribute => $this->$attribute));
		if ($existingIdentity !== null && (($identity=$this->getIdentity()) !== null && $existingIdentity->getId() != $identity->getId())) {
			$this->addError($attribute,Yii::t('UsrModule.usr','{attribute} has already been used by another user.', array('{attribute}'=>$this->$attribute)));
			return false;
		}
		return true;
	}

	/**
	 * A valid current password is required only when changing email.
	 */
	public function validCurrentPassword($attribute,$params)
	{
		if($this->hasErrors()) {
			return;
		}
		if (($identity=$this->getIdentity()) === null) {
			throw new CException('Current user has not been found in the database.');
		}
		if ($identity->getEmail() === $this->correo) {
			return true;
		}
		$identity->password = $this->$attribute;
		if(!$identity->authenticate()) {
			$this->addError($attribute, Yii::t('UsrModule.usr', 'Changing email address requires providing the current password.'));
			return false;
		}
		return true;
	}

	/**
	 * Logs in the user using the given usuario.
	 * @return boolean whether login is successful
	 */
	public function login()
	{
		$identity = $this->getIdentity();

		return Yii::app()->user->login($identity,0);
	}

	/**
	 * Updates the identity with this models attributes and saves it.
	 * @param CUserIdentity $identity
	 * @return boolean whether saving is successful
	 */
	public function save()
	{
		if (($identity=$this->getIdentity()) === null)
			return false;

		$identity->setAttributes($this->getAttributes());
		if ($identity->save(Yii::app()->controller->module->requireVerifiedEmail)) {
			if ((!($this->picture instanceof CUploadedFile) || $identity->savePicture($this->picture)) && (!$this->removePicture || $identity->removePicture())) {
				$this->_identity = $identity;
				return true;
			}
		}
		return false;
	}
}
