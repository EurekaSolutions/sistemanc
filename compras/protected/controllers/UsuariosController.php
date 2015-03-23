<?php

class UsuariosController extends Controller
{
/**
* @var string the default layout for the views. Defaults to '//layouts/column2', meaning
* using two-column layout. See 'protected/views/layouts/column2.php'.
*/
public $layout='//layouts/column2';

/**
* @return array action filters
*/
public function filters()
{
	return array(
	'accessControl', // perform access control for CRUD operations
	);
}

/**
* Specifies the access control rules.
* This method is used by the 'accessControl' filter.
* @return array access control rules
*/
public function accessRules()
{
	return array(
			array('allow',  // allow all users to perform 'index' and 'view' actions
		'actions'=>array('secundario', 'gestionarsecundarios','deshabilitar', 'modificarUsuario'),
		'users'=>array('@'),
		'roles'=>array('ente'),
		),
		array('allow',  // allow all users to perform 'index' and 'view' actions
		'actions'=>array('create','index','view'),
		'users'=>array('@'),
		'roles'=>array('ente'),
		),
		array('allow', // allow authenticated user to perform 'create' and 'update' actions
		'actions'=>array('update'),
		'users'=>array('@'),
		'roles'=>array('ente'),
		),
		array('allow', // allow admin user to perform 'admin' and 'delete' actions
		'actions'=>array('admin','delete'),
		'users'=>array('@'),
		'roles'=>array('admin'),
		),
		array('deny',  // deny all users
		'users'=>array('*'),
		),
	);
}

/**
* Displays a particular model.
* @param integer $id the ID of the model to be displayed
*/
public function actionView($id)
{
$this->render('view',array(
'model'=>$this->loadModel($id),
));
}

/*public function actionDeshabilitar($id){

		$model = new Usuarios();

		$usuario = Usuarios::model()->findByPk(Yii::app()->user->getId());
		
		//$usuariosSecundarios = $usuario->enteOrgano->usuarios;

		if(isset($_POST['Usuarios'])){

			$model->attributes = $_POST['Usuarios'];	
		}

		$this->render('gestionarsecundarios',array( 'model' => $usuariosSecundarios
		));
}*/

/**
* Updates a particular model.
* If update is successful, the browser will be redirected to the 'view' page.
* @param integer $id the ID of the model to be updated
*/
public function actionModificarUsuario($id)
{
	if(!Usuarios::model()->actual()->perteneceSecundarios($id))
		throw new CHttpException(403,'No se puede procesar la solicitud.');

	$model=$this->loadModel($id);

	// Uncomment the following line if AJAX validation is needed
	// $this->performAjaxValidation($model);

	if(isset($_POST['Usuarios']))
	{
		$model->attributes=$_POST['Usuarios'];
		$model->scenario = 'actualizarPerfil';
		if($model->validate())
		{
			$model->usuario = $model->correo;
			if($model->save())
				$this->redirect(array('gestionarsecundarios',));
		}
	}

	$this->render('modificarUsuario',array(
		'model'=>$model,
	));
}

public function actionGestionarsecundarios(){

		$usuario = Usuarios::model()->findByPk(Yii::app()->user->getId());
		
		$usuariosSecundarios = $usuario->enteOrgano->usuariosSecundarios;

		$this->render('gestionarsecundarios',array( 'model' => $usuariosSecundarios
		));
}

public function actionSecundario(){

		$usuario = Usuarios::model()->findByPk(Yii::app()->user->getId());
		
		$crea_usuario = new Usuarios('crearente');

		if(isset($_POST['Usuarios']))
	    {
	    	$crea_usuario->attributes = $_POST['Usuarios'];	   
			
			   $crea_usuario->contrasena = md5(rand(0,100));
			   $crea_usuario->usuario = $crea_usuario->correo;
			   $crea_usuario->creado_el = date("Y-m-d");
			   $crea_usuario->llave_activacion = md5(rand(0,100));
			   $crea_usuario->actualizado_el = date("Y-m-d");
			   $crea_usuario->ente_organo_id = $usuario->enteOrgano->ente_organo_id;
			   //$crea_usuario->rol = '';

	    	if($crea_usuario->save())
	    	{
	    		//if($this->enviarCorreoRecuperacion($crea_usuario->correo,$crea_usuario->cedula))
	    			Yii::app()->user->setFlash('success','Usuario creado con éxito.');
	    		
	    		//Reiniciando el formulario
	    		$crea_usuario = new Usuarios('crearente');
	    	}
	    }

		$this->render('secundario',array( 'model' => $crea_usuario
		));
}

/**
* Creates a new model.
* If creation is successful, the browser will be redirected to the 'view' page.
*/
public function actionCreate()
{
	$model=new Usuarios;

	// Uncomment the following line if AJAX validation is needed
	 $this->performAjaxValidation($model);

	if(isset($_POST['Usuarios']))
	{
		$model->attributes=$_POST['Usuarios'];
		if($model->save())
			$this->redirect(array('view','id'=>$model->usuario_id));
		}

		$this->render('create',array(
		'model'=>$model,
		));
}

/**
* Updates a particular model.
* If update is successful, the browser will be redirected to the 'view' page.
* @param integer $id the ID of the model to be updated
*/
public function actionUpdate($id)
{

	if(!Usuarios::model()->actual()->perteneceSecundarios($id))
		throw new CHttpException(403,'No se puede procesar la solicitud.');

	$model=$this->loadModel($id);

	// Uncomment the following line if AJAX validation is needed
	// $this->performAjaxValidation($model);

	if(isset($_POST['Usuarios']))
	{
		$model->attributes=$_POST['Usuarios'];
		if($model->save())
			$this->redirect(array('view','id'=>$model->usuario_id));
	}

	$this->render('update',array(
	'model'=>$model,
	));
}

/**
* Deletes a particular model.
* If deletion is successful, the browser will be redirected to the 'admin' page.
* @param integer $id the ID of the model to be deleted
*/
public function actionDelete($id)
{
	if(Yii::app()->request->isPostRequest)
	{
		// we only allow deletion via POST request
		if(!Usuarios::model()->actual()->perteneceSecundarios($id))
			throw new CHttpException(403,'No se puede procesar la solicitud.');
		
		$this->loadModel($id)->delete();
			

		// if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
		if(!isset($_GET['ajax']))
			$this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('admin'));
	}
	else
		throw new CHttpException(400,'Invalid request. Please do not repeat this request again.');
}

/**
* Lists all models.
*/
public function actionIndex()
{
$dataProvider=new CActiveDataProvider('Usuarios');
$this->render('index',array(
'dataProvider'=>$dataProvider,
));
}

/**
* Manages all models.
*/
public function actionAdmin()
{
$model=new Usuarios('search');
$model->unsetAttributes();  // clear any default values
if(isset($_GET['Usuarios']))
$model->attributes=$_GET['Usuarios'];

$this->render('admin',array(
'model'=>$model,
));
}

/**
* Returns the data model based on the primary key given in the GET variable.
* If the data model is not found, an HTTP exception will be raised.
* @param integer the ID of the model to be loaded
*/
public function loadModel($id)
{
$model=Usuarios::model()->findByPk($id);
if($model===null)
throw new CHttpException(404,'The requested page does not exist.');
return $model;
}

/**
* Performs the AJAX validation.
* @param CModel the model to be validated
*/
protected function performAjaxValidation($model)
{
if(isset($_POST['ajax']) && $_POST['ajax']==='usuarios-form')
{
echo CActiveForm::validate($model);
Yii::app()->end();
}
}
}
