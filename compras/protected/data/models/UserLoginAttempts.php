<?php

/**
 * This is the model class for table "public.user_login_attempts".
 *
 * The followings are the available columns in table 'public.user_login_attempts':
 * @property integer $id
 * @property string $username
 * @property integer $user_id
 * @property string $performed_on
 * @property boolean $is_successful
 * @property string $session_id
 * @property integer $ipv4
 * @property string $user_agent
 *
 * The followings are the available model relations:
 * @property Usuarios $user
 */
class UserLoginAttempts extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'public.user_login_attempts';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('username, performed_on', 'required'),
			array('user_id, ipv4', 'numerical', 'integerOnly'=>true),
			array('username, session_id, user_agent', 'length', 'max'=>255),
			array('is_successful', 'safe'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, username, user_id, performed_on, is_successful, session_id, ipv4, user_agent', 'safe', 'on'=>'search'),
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
			'user' => array(self::BELONGS_TO, 'Usuarios', 'user_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'username' => 'Username',
			'user_id' => 'User',
			'performed_on' => 'Performed On',
			'is_successful' => 'Is Successful',
			'session_id' => 'Session',
			'ipv4' => 'Ipv4',
			'user_agent' => 'User Agent',
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
		$criteria->compare('username',$this->username,true);
		$criteria->compare('user_id',$this->user_id);
		$criteria->compare('performed_on',$this->performed_on,true);
		$criteria->compare('is_successful',$this->is_successful);
		$criteria->compare('session_id',$this->session_id,true);
		$criteria->compare('ipv4',$this->ipv4);
		$criteria->compare('user_agent',$this->user_agent,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return UserLoginAttempts the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
