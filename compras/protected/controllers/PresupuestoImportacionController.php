<?php

class PresupuestoImportacionController extends Controller
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
			'postOnly + delete', // we only allow deletion via POST request
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
			'roles'=>array('admin'),
		),	
			array('allow',  // allow all users to perform 'index' and 'view' actions
				'actions'=>array('index','view'),
				'users'=>array('admin'),
			),
			array('allow', // allow authenticated user to perform 'create' and 'update' actions
				'actions'=>array('create','update'),
				'users'=>array('admin'),
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
	public function actionModificarProducto($cid, $pid, $ppid)
	{
		$model=$this->loadModel(array('codigo_ncm_id'=>$cid,'producto_id'=>$pid,'presupuesto_partida_id'=>$ppid));

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['PresupuestoImportacion']))
		{
			$modelNuevo = new PresupuestoProductos();

			$modelNuevo->attributes = $_POST['PresupuestoImportacion'];
			//print_r($_POST['PresupuestoProductos']);
			//Yii::app()->end();
			//$model = $this->loadModel($id);

			//print_r($model);

/*			if($modelNuevo->cantidad > $model->cantidad || $modelNuevo->monto_presupuesto > $model->monto_presupuesto)
			{*/

				$cantDif = $modelNuevo->cantidad - $model->cantidad;
				$costoUniDif = $modelNuevo->monto_presupuesto - $model->monto_presupuesto;
				$montoPresuDif = $cantDif * $costoUniDif * $model->divisa->tasa->tasa;

				if($modelNuevo->cantidad < $model->cantidad && $modelNuevo->monto_presupuesto < $model->monto_presupuesto){
					//echo 'antes: '.$montoPresuDif.'  ';
					$montoPresuDif = -$montoPresuDif;
					//echo 'despues: '.$montoPresuDif;
					//Yii::app()->end();
				}

				if($model->presupuestoPartida->montoCargadoPartida()+$montoPresuDif > $model->presupuestoPartida->monto_presupuestado){
					Yii::app()->user->setFlash('error', "El cambio no puede realizarse, el monto sobrepasa la cantidad de presupuesto disponible para la partida asociada al producto.");
				}else{
					//if($modelNuevo->costo_unidad)
					//$modelNuevo->monto_presupuesto = $modelNuevo->cantidad * $modelNuevo->costo_unidad;
					//$model->scenario = 'update';
					$model->monto_presupuesto = $modelNuevo->monto_presupuesto;
					$model->cantidad = $modelNuevo->cantidad;
					//$model->monto_presupuesto=$model->costo_unidad * $model->cantidad;
					if($model->save()){
						Yii::app()->user->setFlash('success', "El cambio fue realizado con éxito.");
							//$this->redirect(array('view','id'=>$model->presupuesto_id));
					}
				}
			//}

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
		$model=new PresupuestoImportacion;

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if (isset($_POST['PresupuestoImportacion'])) {
			$model->attributes=$_POST['PresupuestoImportacion'];
			if ($model->save()) {
				$this->redirect(array('view','id'=>$model->presupuesto_id));
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

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if (isset($_POST['PresupuestoImportacion'])) {
			$model->attributes=$_POST['PresupuestoImportacion'];
			if ($model->save()) {
				$this->redirect(array('view','id'=>$model->presupuesto_id));
			}
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
		if (Yii::app()->request->isPostRequest) {
			// we only allow deletion via POST request
			$this->loadModel($id)->delete();

			// if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
			if (!isset($_GET['ajax'])) {
				$this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('admin'));
			}
		} else {
			throw new CHttpException(400,'Invalid request. Please do not repeat this request again.');
		}
	}

	/**
	 * Lists all models.
	 */
	public function actionIndex()
	{
		$dataProvider=new CActiveDataProvider('PresupuestoImportacion');
		$this->render('index',array(
			'dataProvider'=>$dataProvider,
		));
	}

	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		$model=new PresupuestoImportacion('search');
		$model->unsetAttributes();  // clear any default values
		if (isset($_GET['PresupuestoImportacion'])) {
			$model->attributes=$_GET['PresupuestoImportacion'];
		}

		$this->render('admin',array(
			'model'=>$model,
		));
	}

	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer $id the ID of the model to be loaded
	 * @return PresupuestoImportacion the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{
		$model=PresupuestoImportacion::model()->findByPk($id);
		if ($model===null) {
			throw new CHttpException(404,'The requested page does not exist.');
		}
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param PresupuestoImportacion $model the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if (isset($_POST['ajax']) && $_POST['ajax']==='presupuesto-importacion-form') {
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}

	/*Esta funcion aqui esta rara*/
	protected function actionPresupuesto()
	{
		$model = new PresupuestoImportacion();
		//$ 


		$this->render('partidas',array(
			'model'=>$model,
		));

	}
}