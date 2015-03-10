<?php

class PartidaProductosController extends Controller
{
	/**
	* @var string the default layout for the views. Defaults to '//layouts/column2', meaning
	* using two-column layout. See 'protected/views/layouts/column2.php'.
	*/
	public $layout='//layouts/planificacion';  //public $layout='//layouts/column2';

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
				'users'=>array('@'),
				'roles'=>array('admin')
			),
			array('allow', // allow authenticated user to perform 'create' and 'update' actions
				'actions'=>array('create','update'),
				'users'=>array('@'),
				'roles'=>array('admin')
			),
			array('allow', // allow admin user to perform 'admin' and 'delete' actions
				'actions'=>array('admin','delete', 'eliminar', 'buscarGridProductosPartida'),
				'users'=>array('@'),
				'roles'=>array('admin')
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

	/**
	* Creates a new model.
	* If creation is successful, the browser will be redirected to the 'view' page.
	*/
	public function actionCreate()
	{
		$model=new PartidaProductos;

		//$lista_partidas = $usuario = Usuarios::model()->findByPk(Yii::app()->user->getId());

		$criteria = new CDbCriteria();
		$criteria->condition = 'p3 <> 0';
		//$criteria->params = array(':p1'=>$general->p1, ':p2' => $general->p2);

		$especificas = Partidas::model()->findAll($criteria);

		$especificas_lista = CHtml::listData($especificas, function($especificas) {
																	return CHtml::encode($especificas->partida_id);
																}, function($especificas) {
																	return CHtml::encode($especificas->p1.' - '.$especificas->p2.'-'.$especificas->p3.'-'.$especificas->p4.' '.$especificas->nombre);
																});


		$productos = Productos::model()->findAll();

		$lista_productos = CHtml::listData($productos, function($productos) {
																	return CHtml::encode($productos->producto_id);
																}, function($productos) {
																	return CHtml::encode($productos->cod_segmento.'-'.$productos->cod_familia.'-'.$productos->cod_clase.'-'.$productos->cod_producto.' '.$productos->nombre);
																});
		//print_r($especificas_lista);
		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		$operacion = array('C' => 'Compra', 'V' => 'Venta');

		//$operacion = CHtml::listData($pro);

		if(isset($_POST['PartidaProductos']))
		{

			$model->attributes=$_POST['PartidaProductos'];
			$variable = $model->producto_id;

			if($model->validate())
			{
				if(count($variable)!=1)
				{
							
					foreach ($variable as $key)
					{
						$modeltodos = new PartidaProductos;

						

						$modeltodos->partida_id = $model->partida_id;
						$modeltodos->producto_id = $key;
						$modeltodos->tipo_operacion = $model->tipo_operacion;
						$modeltodos->fecha_desde  = $model->fecha_desde;
						$modeltodos->fecha_hasta  = $model->fecha_hasta;
						$modeltodos->save();
					}
							Yii::app()->user->setFlash('success', "Productos agregados con éxito a la partida seleccionada ");
					
					}else
					{	
							$model->producto_id=$variable[0];
							$model->save();
							Yii::app()->user->setFlash('success', "Producto agregado con éxito a la partida seleccionada");
			
					}
					$this->refresh();
			}
			/*if($model->save())
				$this->redirect(array('view','id'=>$model->partida_producto_id));*/
		}

		$this->render('create',array(
			'model'=>$model, 'especificas_lista' => $especificas_lista, 'productos' => $lista_productos, 'operacion' => $operacion
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

		if(isset($_POST['PartidaProductos']))
		{
			$model->attributes=$_POST['PartidaProductos'];
			if($model->save())
				$this->redirect(array('view','id'=>$model->partida_producto_id));
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

	public function actionBuscarGridProductosPartida(){
		
		$model = new PartidaProductos();
		
		$name = "Seleccionar producto";

/*			echo CHtml::tag('option',
			                  array('value'=>""),CHtml::encode($name),true);*/

		if(isset($_POST['PartidaProductos'])){
			$model->attributes = $_POST['PartidaProductos'];

				$listaProductos = array();
				//if($codigoSel=CodigosNcm::model()->findByPk($_POST['CodigosNcm']['codigo_ncm_id']))
				$listaProductos = CHtml::listData(PartidaProductos::model()->findAllByAttributes(array('partida_id'=>$model->partida_id)),
							'partida_producto_id', function($partidaProducto){ return $partidaProducto->producto->etiquetaProducto();});
				print_r($model);
				
			    foreach($listaProductos as $value => $name)
			    {
			        echo CHtml::tag('option',
			                   array('value'=>$value),CHtml::encode($name),true);
			    }
				

/*			$this->widget('booster.widgets.TbGridView',array(
			'id'=>'partida-productos-grid',
			'dataProvider'=>$model->search(),
			'filter'=>$model,
			'columns'=>array(
					//'partida_id',
					
					array('name'=>'producto_id', 'value'=>'$data->producto->etiquetaProducto();'),
					'tipo_operacion',
					'fecha_desde',
					'fecha_hasta',
					'partida_producto_id',
			array(
			'class'=>'booster.widgets.TbButtonColumn','template'=>'{delete}'
			),
			),
			)); */

		}
	}

	/**
	* Deletes a particular model.
	* If deletion is successful, the browser will be redirected to the 'admin' page.
	* @param integer $id the ID of the model to be deleted
	*/
	public function actionEliminar()
	{
		$model = new PartidaProductos();

		$listaProductos =array();

		if(isset($_POST['PartidaProductos'])){
			$model->attributes = $_POST['PartidaProductos'];

			$transaction = $model->dbConnection->beginTransaction(); // Transaction begin //Yii::app()->db->beginTransaction
			try{
				foreach ($_POST['PartidaProductos']['partida_producto_id'] as $key => $id) {
					if(!$this->loadModel($id)->delete())
						throw new Exception("Error Processing Request", 1);
						
				}

				$transaction->commit();    // committing 
				Yii::app()->user->setFlash('success', "Todos los productos fueron elminados de la partida.");
	
			}
	        catch (Exception $e){
	            $transaction->rollBack();
	            Yii::app()->user->setFlash('error', "Los productos no fueron elminados de la partida.");
	            //return false;
	        } 
	        $listaProductos = CHtml::listData(PartidaProductos::model()->findAllByAttributes(array('partida_id'=>$model->partida_id)),
							'partida_producto_id', function($partidaProducto){ return $partidaProducto->producto->etiquetaProducto();});
		}

		$this->render('eliminar',array('model'=>$model,'listaProductos'=>$listaProductos));
	}

		/**
		* Lists all models.
		*/
	public function actionIndex()
	{
		$dataProvider=new CActiveDataProvider('PartidaProductos');
			$this->render('index',array(
			'dataProvider'=>$dataProvider,
		));
	}

	/**
	* Manages all models.
	*/
	public function actionAdmin()
	{
		$model=new PartidaProductos('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['PartidaProductos']))
			$model->attributes=$_GET['PartidaProductos'];

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
		$model=PartidaProductos::model()->findByPk($id);
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
		if(isset($_POST['ajax']) && $_POST['ajax']==='partida-productos-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
}
