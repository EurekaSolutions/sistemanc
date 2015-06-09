<?php

class ProveedoresController extends Controller
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
			'actions'=>array('index','view', 'anadir', 'create', 'ajaxObtenerProveedores'),
			'users'=>array('*'),
			'roles'=>array('producto'),
			'expression'=>'Yii::app()->controller->M_rendicion()',
		),
		array('allow', // allow authenticated user to perform 'create' and 'update' actions
			'actions'=>array('admin', 'update'),
			'users'=>array('@'),
			'roles'=>array('admin'),
			'expression'=>'Yii::app()->controller->M_rendicion()',
		),
		array('allow', // allow admin user to perform 'admin' and 'delete' actions
			'actions'=>array(/*'delete',*/ 'subir'),
			//'users'=>array('admin'),
			//'roles'=>array('ente'),
			'roles'=>array('admin'),
			'expression'=>'Yii::app()->controller->M_rendicion()',
		),
		array('deny',  // deny all users
			'users'=>array('*'),
		),
		);
	}
	

	public function actionAjaxObtenerProveedores() {
		if (isset($_GET['q'])) {
			$proveedores = Proveedores::model()->findAll(array('order'=>'rif', 'condition'=>'rif LIKE :rif', 'params'=>array(':rif'=>strtoupper('%'.$_GET['q'].'%'))));
			$data = array();
			foreach ($proveedores as $value) {
				$data[] = array(
					'id' => $value->id,
					'text' => $value->etiquetaProveedor(),
				);
			}
				echo CJSON::encode($data);
		}
		Yii::app()->end();
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

	/**
	* Creates a new model.
	* If creation is successful, the browser will be redirected to the 'view' page.
	*/
	public function actionCreate()
	{
		$model=new Proveedores;

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['Proveedores']))
		{
			$model->attributes=$_POST['Proveedores'];
			$usuario = Usuarios::model()->actual();
			$model->rif = strtoupper($model->rif);
			$model->razon_social = strtoupper($model->razon_social);
			$model->ente_organo_id = $usuario->ente_organo_id;

			if($model->save())
			{
				$this->renderPartial('_exito',array(),false,true);
				//echo '<script>$("#jobDialog").dialog("close");</script>';
			}	
		}

		$this->renderPartial('_form',array('model'=>$model,),false,true);
	}

	/**
	* Updates a particular model.
	* If update is successful, the browser will be redirected to the 'view' page.
	* @param integer $id the ID of the model to be updated
	*/
	public function actionUpdate($id)
	{
		$model=$this->loadModel($id);

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['Proveedores']))
		{
			$model->attributes=$_POST['Proveedores'];
			if($model->save())
				$this->redirect(array('view','id'=>$model->id));
		}

		$this->render('update',array(
		'model'=>$model,
		));
	}

	public function actionSubir()
	{
		/*if (($gestor = fopen(Yii::app()->basePath.'/../assets/rif_rnc.csv', "r")) !== FALSE)
				{
				    while (($datos = fgetcsv($gestor, 1000, ";")) !== FALSE)
				    {
				       	strtoupper(utf8_encode(trim($datos[0])));
				       	strtoupper(utf8_encode(trim($datos[1]))); 				       		
				       	$i=3;
				       	while ( isset($datos[$i])) {
								$datos[2].= $datos[$i];
				       		$i++;
				       	}
				       	//strtoupper(utf8_encode(trim($datos[2])));

				       	$proveedores = new Proveedores();
				       	$proveedores->estatus_contratista_id = trim($datos[0]);
				       	$proveedores->rif = strtoupper(trim($datos[1])); 
				       	$proveedores->razon_social = strtoupper(trim($datos[2])); 
				       	//$proveedores->ente_organo_id = 15694;
				       	$proveedores->save();

					}        
				  fclose($gestor);  
				}*/

				$model = new Proveedores();

		$this->render('subir',array(
			'model'=>$model,
		));
	}


	public function actionAnadir() {
		$model = new Proveedores();
      	
      	$this->renderPartial('anadir',array('model'=>$model,),false,true);
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
/*		$dataProvider=new CActiveDataProvider('Proveedores');
			$this->render('index',array(
			'dataProvider'=>$dataProvider,
		));*/
		$this->redirect(array('proveedores/admin'));
	}

	/**
	* Manages all models.
	*/
	public function actionAdmin()
	{
		$model=new Proveedores('search');
		$model->unsetAttributes();  // clear any default values
		/*if(isset($_GET['Proveedores']))
			$model->attributes=$_GET['Proveedores'];*/

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
		$model=Proveedores::model()->findByPk($id);
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
		if(isset($_POST['ajax']) && $_POST['ajax']==='proveedores-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
}
