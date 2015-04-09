<?php

/**
 * This is the model class for table "usuarios_ws".
 *
 * The followings are the available columns in table 'usuarios_ws':
 * @property integer $id
 * @property string $institucion
 * @property string $correo
 * @property string $usuario
 * @property string $clave
 * @property string $session
 * @property string $token
 * @property string $fecha_creacion
 * @property string $fecha_actualizacion
 */
class UsuariosWs extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'usuarios_ws';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('institucion, correo, usuario, clave', 'required'),
			array('institucion, correo, usuario, clave, session, token', 'length', 'max'=>255),
			array('correo', 'email'),
			array('correo', 'unique', 'className' => 'UsuariosWs', 'attributeName' => 'correo', 'message'=>'Este correo ya se encuentra registrado en nuestro repositorio',),
			array('usuario', 'unique', 'className' => 'UsuariosWs', 'attributeName' => 'usuario', 'message'=>'Este usuario ya se encuentra registrado en nuestro repositorio',),
			array('institucion', 'unique', 'className' => 'UsuariosWs', 'attributeName' => 'institucion', 'message'=>'Esta institución ya se encuentra registrada en nuestro repositorio',),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, institucion, correo, usuario, clave, session, token, fecha_creacion, fecha_actualizacion', 'safe', 'on'=>'search'),

			//array('usuario', 'match', 'pattern'=>'/^[a-z]([a-z]|[0-9])+$/', 'message'=>'Obligatorio debe empezar con una letra',),
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
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'institucion' => 'Institución',
			'correo' => 'Correo',
			'usuario' => 'Usuario',
			'clave' => 'Clave',
			'session' => 'Session',
			'token' => 'Token',
			'fecha_creacion' => 'Fecha Creacion',
			'fecha_actualizacion' => 'Fecha Actualizacion',
		);
	}

	public function validatePassword($password){
        return $this->hashPassword($password,$this->session)===$this->clave;
    }
    
    public function hashPassword($password,$salt){  
        return md5($salt.$password);
            //return $password;
    }
    
    public function generateSalt(){
        return uniqid('',true);
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
		$criteria->compare('institucion',$this->institucion,true);
		$criteria->compare('correo',$this->correo,true);
		$criteria->compare('usuario',$this->usuario,true);
		$criteria->compare('clave',$this->clave,true);
		$criteria->compare('session',$this->session,true);
		$criteria->compare('token',$this->token,true);
		$criteria->compare('fecha_creacion',$this->fecha_creacion,true);
		$criteria->compare('fecha_actualizacion',$this->fecha_actualizacion,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return UsuariosWs the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
