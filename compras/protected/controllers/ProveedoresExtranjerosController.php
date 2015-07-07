<?php

class ProveedoresExtranjerosController extends Controller
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
		$model=new ProveedoresExtranjeros;
        
        $modelProveedor=new Proveedores('extranjero');
        
        $modelContacto=new PersonasContacto;
        
        $modelCuenta=new ProveedoresCuentas;
        
        $modelObjeto=new ProveedoresObjetos;
            

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['ProveedoresExtranjeros']))
		{
			$model->attributes=$_POST['ProveedoresExtranjeros'];
            $modelProveedor->attributes=$_POST['Proveedores'];
            $modelContacto->attributes=$_POST['PersonasContacto'];
            $modelCuenta->attributes=$_POST['ProveedoresCuentas'];
            $modelObjeto->attributes=$_POST['ProveedoresObjetos'];
            
            $transaction = $model->dbConnection->beginTransaction(); // Transaction begin //Yii::app()->db->beginTransaction
			try{
                $flag = true;
                if(($flag = $modelProveedor->save())){
                
                    $model->proveedor_id = $modelProveedor->id;
                    $modelContacto->proveedor_id = $modelProveedor->id;
                    $modelCuenta->proveedor_id = $modelProveedor->id;
                    $modelObjeto->proveedor_id = $modelProveedor->id;
                    //if(!$model->save()){
                        $flag = $flag and $model->save();
                    //}
                    //if(!$modelContacto->save()){
                        $flag = $flag and $modelContacto->save();
                    //}
                    //if(!$modelCuenta->save()){
                        $flag = $flag and $modelCuenta->save();
                    //}
                    //if(!$modelObjeto->save()){
                        $flag = $flag and $modelObjeto->save();
                    //}
                }
                   
                if($flag){
				    $transaction->commit();    // committing 
                    Yii::app()->user->setFlash('success', "Proveedor extranjero registrado con exito.");
                }else
                   throw new Exception("Error Processing Request", 1);
	
			}
	        catch (Exception $e){
	            $transaction->rollBack();
	            Yii::app()->user->setFlash('error', "No se pudo registrar el proveedor extranjero.");
	            //return false;
	        } 
            
			if($model->save())
				$this->redirect(array('view','id'=>$model->id));
		}

		$this->render('create',array(
		'model'=>$model, 'modelProveedor'=>$modelProveedor, 'modelContacto'=>$modelContacto, 'modelCuenta'=>$modelCuenta, 'modelObjeto'=>$modelObjeto,
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

		if(isset($_POST['ProveedoresExtranjeros']))
		{
			$model->attributes=$_POST['ProveedoresExtranjeros'];
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
		$dataProvider=new CActiveDataProvider('ProveedoresExtranjeros');
			$this->render('index',array(
			'dataProvider'=>$dataProvider,
		));
	}

	/**
	* Manages all models.
	*/
	public function actionAdmin()
	{
		$model=new ProveedoresExtranjeros('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['ProveedoresExtranjeros']))
			$model->attributes=$_GET['ProveedoresExtranjeros'];

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
		$model=ProveedoresExtranjeros::model()->findByPk($id);
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
		if(isset($_POST['ajax']) && $_POST['ajax']==='proveedores-extranjeros-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
}
