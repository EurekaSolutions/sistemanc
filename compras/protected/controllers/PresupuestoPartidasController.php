<?php

class PresupuestoPartidasController extends Controller
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
			'actions'=>array('modificarPartida', 'montoDisponible', 'montoDisponibleSustraendo'),
			'users'=>array('@'),
			'roles'=>array('presupuesto')
		),
		array('allow',  // allow all users to perform 'index' and 'view' actions
			'actions'=>array('index','view'),
			'users'=>array('*'),
			'roles'=>array('presupuesto')
		),
		array('allow', // allow authenticated user to perform 'create' and 'update' actions
			'actions'=>array('create','update'),
			'users'=>array('@'),
			'roles'=>array('presupuesto')
		),
		array('allow', // allow admin user to perform 'admin' and 'delete' actions
			'actions'=>array('admin','delete'),
			'users'=>array('@'),
			'roles'=>array('presupuesto')
		),
		array('deny',  // deny all users
			'users'=>array('*'),
		),
		);
	}

 	/**
 	 * Función que calcula el monto disponible de una partida presupuestada.
 	 * 
 	 * @return float $disponible
 	 * */
 	public function actionMontoDisponibleSustraendo(){

			if(isset($_POST['PresupuestoPartidas'])){
				$this->montoDisponible($_POST['PresupuestoPartidas']['sustraendo_id']);
			}
 	}

 	/**
 	 * Función que calcula el monto disponible de una partida presupuestada.
 	 * 
 	 * @return float $disponible
 	 * */
 	public function actionMontoDisponible(){

			if(isset($_POST['PresupuestoPartidas'])){
				$this->montoDisponible($_POST['PresupuestoPartidas']['presupuesto_partida_id']);
			}
 	}

 	/**
 	 * Función que calcula el monto disponible de una partida presupuestada.
 	 * 
 	 * @return float $disponible
 	 * */
 	public function montoDisponible($id){

 			$disponible = 0;

			$presuPartida = PresupuestoPartidas::model()->findByAttributes(array('presupuesto_partida_id'=>$id));

			$disponible = $presuPartida->montoDisponible();

			echo number_format($disponible, 2, ',', '.').' Bs.';
 	}

	/**
	* Updates a particular model.
	* If update is successful, the browser will be redirected to the 'view' page.
	* @param integer $id the ID of the model to be updated
	*/
	public function actionModificarPartida()
	{
		$model=new PresupuestoPartidas('transferir');

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['PresupuestoPartidas']))
		{
			$model->attributes=$_POST['PresupuestoPartidas'];
			if($model->sustraendo_id=='')
				$model->sustraendo_id = null;
			if($model->presupuesto_partida_id=='')
				$model->presupuesto_partida_id = null;

			if($model->validate(array('presupuesto_partida_id','monto_transferir','sustraendo_id')))
			{
				$modelSustraendo = $this->loadModel($model->sustraendo_id);

				$monto_transferir = 0;
				if($model->todo){
					$monto_transferir = $model->monto_transferir = $modelSustraendo->montoDisponible();	
				}else
				 	$monto_transferir = $model->monto_transferir;

				$modelSuma = $this->loadModel($model->presupuesto_partida_id);

				$modelSuma->monto_presupuestado += $monto_transferir;
				$modelSustraendo->monto_presupuestado -= $monto_transferir;

				if($modelSuma->save() && $modelSustraendo->save()){
					//$this->redirect(array('view','id'=>$model->presupuesto_partida_id));
					Yii::app()->user->setFlash('success', "Transferencia realizada con exito.");
					//$model = new PresupuestoPartidas;
				}else
					Yii::app()->user->setFlash('error', "Hubo un problema guardando la transferencia. Intentelo nuevamente.");
			}
		}

		$this->render('modificarPartida',array(
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
		$model=new PresupuestoPartidas;

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['PresupuestoPartidas']))
		{
			$model->attributes=$_POST['PresupuestoPartidas'];
			if($model->save())
				$this->redirect(array('view','id'=>$model->presupuesto_partida_id));
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

		if(isset($_POST['PresupuestoPartidas']))
		{
			$model->attributes=$_POST['PresupuestoPartidas'];
			if($model->save())
				$this->redirect(array('view','id'=>$model->presupuesto_partida_id));
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
		$dataProvider=new CActiveDataProvider('PresupuestoPartidas');
			$this->render('index',array(
			'dataProvider'=>$dataProvider,
		));
	}

	/**
	* Manages all models.
	*/
	public function actionAdmin()
	{
		$model=new PresupuestoPartidas('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['PresupuestoPartidas']))
			$model->attributes=$_GET['PresupuestoPartidas'];

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
		$model=PresupuestoPartidas::model()->findByPk($id);
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
		if(isset($_POST['ajax']) && $_POST['ajax']==='presupuesto-partidas-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
}