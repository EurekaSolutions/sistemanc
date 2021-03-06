<?php

class FacturasController extends Controller
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
			'actions'=>array('index','view'),
			'users'=>array('*'),
			'roles'=>array('producto'),
			'expression'=>'Yii::app()->controller->M_rendicion()',
		),
		array('allow', // allow authenticated user to perform 'create' and 'update' actions
			'actions'=>array('create','update'),
			'users'=>array('@'),
			'roles'=>array('producto'),
			'expression'=>'Yii::app()->controller->M_rendicion()',
		),
		array('allow', // allow admin user to perform 'admin' and 'delete' actions
			'actions'=>array('admin','delete'),
			//'users'=>array('admin'),
			'roles'=>array('producto'),
			'expression'=>'Yii::app()->controller->M_rendicion()',
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
/*		$this->render('view',array(
		'model'=>$this->loadModel($id),
		));*/
 		$this->redirect(array('facturas/admin'));
	}

	/**
	* Creates a new model.
	* If creation is successful, the browser will be redirected to the 'view' page.
	*/
	public function actionCreate()
	{
		$model=new Facturas;

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['Facturas']))
		{
			$model->attributes=$_POST['Facturas'];
			$model->proveedor_id = $_POST['proveedor_id'];
			$model->cierre_carga = false;
			$usuario = Usuarios::model()->findByPk(Yii::app()->user->getId());
			
			$model->ente_organo_id = $usuario->ente_organo_id;
			$model->anho =  Yii::app()->params['trimestresFechas'][Yii::app()->session['trimestreSeleccionado']]['anho']; //date("Y");

			if($model->save())
			{
				$proveedores_eo = new ProveedoresEntesOrganos();
				$proveedores_eo->proveedor_id = $model->proveedor_id;
				$proveedores_eo->ente_organo_id = $model->ente_organo_id;
				$proveedores_eo->save();
				$this->redirect(array('view','id'=>$model->id));
			}
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
		$model=$this->loadModel($id);
		
		if($model->ente_organo_id != Usuarios::model()->actual()->ente_organo_id)
			throw new CHttpException(403, "No se puede procesar la solicitud.");
			
		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['Facturas']))
		{
			$model->attributes=$_POST['Facturas'];
			$model->proveedor_id = $_POST['proveedor_id'];
			if($model->save())
				$this->redirect(array('view','id'=>$model->id));
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

			//$this->loadModel($id)->delete();

			$model = $this->loadModel($id);

			if(!($model->ente_organo_id == Usuarios::model()->actual()->ente_organo_id))
				throw new CHttpException(403, "No se puede procesar la solicitud.");
				
				$model->delete();

				if(!isset($_GET['ajax'])){
					$this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('admin'));
				}
				else
				{
					throw new CHttpException(400,'Invalid request. Please do not repeat this request again.');
				}

		}

		// if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser

	}

		/**
		* Lists all models.
		*/
	public function actionIndex()
	{
/*		$dataProvider=new CActiveDataProvider('Facturas');
			$this->render('index',array(
			'dataProvider'=>$dataProvider,
		));
*/
	    $this->redirect(array('facturas/admin'));
	}

	/**
	* Manages all models.
	*/
	public function actionAdmin()
	{
		$model=new Facturas('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['Facturas']))
			$model->attributes=$_GET['Facturas'];

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
		$model=Facturas::model()->findByPk($id);
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
		if(isset($_POST['ajax']) && $_POST['ajax']==='facturas-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
}
