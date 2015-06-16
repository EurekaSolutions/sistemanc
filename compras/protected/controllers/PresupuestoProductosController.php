<?php

class PresupuestoProductosController extends Controller
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
			'actions'=>array('modificarProducto'),
			'users'=>array('@'),
			'roles'=>array('presupuesto'),
		),	
		array('allow',  // allow all users to perform 'index' and 'view' actions
			'actions'=>array('index','view'),
			'users'=>array('*'),
		),
		array('allow', // allow authenticated user to perform 'create' and 'update' actions
			'actions'=>array('create','update'),
			'users'=>array('@'),
		),
		array('allow', // allow admin user to perform 'admin' and 'delete' actions
			'actions'=>array('admin','delete'),
			'users'=>array('admin'),
		),
		array('deny',  // deny all users
			'users'=>array('*'),
		),
		);
	}


	/**
	* Updates a particular model.
	* If update is successful, the browser will be redirected to the 'view' page.
	* @param integer $id the ID of the model to be updated
	*/
	public function actionModificarProducto($id)
	{
		
		$id= intval($id);
		$model=$this->loadModel($id);
        $usuario = Usuarios::model()->findByPk(Yii::app()->user->getId());

		if(isset($_POST['PresupuestoProductos']))
		{
            

            if($model->proyectoPartida->ente_organo_id == $usuario->ente_organo_id)
			{
                        
                $modelNuevo = new PresupuestoProductos();

                $modelNuevo->attributes = $_POST['PresupuestoProductos'];

				$monAct = $modelNuevo->costo_unidad * $modelNuevo->cantidad;
				$monCar = $model->proyectoPartida->montoCargadoPartida();
				$montoPresuDif = $monAct-$monCar;

				if($monAct > $model->proyectoPartida->monto_presupuestado){

					Yii::app()->user->setFlash('error', "El cambio no puede realizarse, el monto sobrepasa la cantidad de presupuesto disponible para la partida asociada al producto.");
				}else{

					$model->costo_unidad = $modelNuevo->costo_unidad;
					$model->cantidad = $modelNuevo->cantidad;
					$model->monto_presupuesto=$model->costo_unidad * $model->cantidad;
					if($model->save()){
						Yii::app()->user->setFlash('success', "El cambio fue realizado con éxito.");
					}
				}
			}


		}

		$this->render('update',array(
		'model'=>$model,
		));
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
		$model=new PresupuestoProductos;

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['PresupuestoProductos']))
		{
			$model->attributes=$_POST['PresupuestoProductos'];
			if($model->save())
				$this->redirect(array('view','id'=>$model->presupuesto_id));
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

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['PresupuestoProductos']))
		{
			$model->attributes=$_POST['PresupuestoProductos'];
			if($model->save())
				$this->redirect(array('view','id'=>$model->presupuesto_id));
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
		$dataProvider=new CActiveDataProvider('PresupuestoProductos');
			$this->render('index',array(
			'dataProvider'=>$dataProvider,
		));
	}

	/**
	* Manages all models.
	*/
	public function actionAdmin()
	{
		$model=new PresupuestoProductos('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['PresupuestoProductos']))
			$model->attributes=$_GET['PresupuestoProductos'];

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
		$model=PresupuestoProductos::model()->findByPk($id);
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
		if(isset($_POST['ajax']) && $_POST['ajax']==='presupuesto-productos-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
}
