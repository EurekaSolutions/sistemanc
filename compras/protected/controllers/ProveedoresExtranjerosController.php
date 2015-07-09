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
			'actions'=>array('create','view', 'ver'),
			'users'=>array('@'),
			'roles'=>array('producto'),
		),
		array('allow', // allow admin user to perform 'admin' and 'delete' actions
			'actions'=>array('admin','delete','update', 'index'),
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
		$model = $this->loadModel($id);
		$modelContacto= PersonasContacto::model()->findByAttributes(array('proveedor_id'=>$model->proveedor_id));
		$modelCuentas = ProveedoresCuentas::model()->findAllByAttributes(array('proveedor_id'=>$model->proveedor_id));
		$modelTecnica = ProveedoresObjetos::model()->findAllByAttributes(array('proveedor_id'=>$model->proveedor_id));
		$this->render('view',array(
			'model'=>$model, 'modelContacto' => $modelContacto, 'modelCuentas' => $modelCuentas, 'modelTecnica' => $modelTecnica,
 		));
	}

	public function actionVer()
	{
		

		$model=new ProveedoresExtranjeros;

		if(isset($_POST['ProveedoresExtranjeros']))
		{
			
			$model->proveedor_id=$_POST['ProveedoresExtranjeros']['id'];
			$model = ProveedoresExtranjeros::model()->findByAttributes(array('proveedor_id'=>$model->proveedor_id));
			$this->redirect(array('view','id'=>$model->id));
		}
		$this->render('ver', array('model' => $model));
	}

	/**
	* Creates a new model.
	* If creation is successful, the browser will be redirected to the 'view' page.
	*/
	public function actionCreate()
	{
		$model= new ProveedoresExtranjeros;
        
        $modelProveedor= new Proveedores('extranjero');
        
        $modelContacto= new PersonasContacto;
        

		if(isset($_POST['ProveedoresExtranjeros']))
		{
			$model->attributes=$_POST['ProveedoresExtranjeros'];
            $modelProveedor->attributes=$_POST['Proveedores'];
            $modelContacto->attributes=$_POST['PersonasContacto'];

            
            $transaction = $model->dbConnection->beginTransaction(); // Transaction begin //Yii::app()->db->beginTransaction
			try{
                $modelProveedor->nacional = false;
                if(!$modelProveedor->tiene_rif)
                    $modelProveedor->rif = 'N/A';
                //$modelProveedor->tiene_rif = $_POST['Proveedores']['tiene_rif'];
                $flag = $modelProveedor->save();
                
                if($flag){
                
                    $model->proveedor_id = $modelProveedor->id;
                    $modelContacto->proveedor_id = $modelProveedor->id;

                    $flag = $flag && $model->save();
                    $flag = $flag && $modelContacto->save();

                }
                  
                if($flag){
				    $transaction->commit();    // committing 
                    Yii::app()->user->setFlash('success', "Proveedor extranjero registrado con exito.");
                    $this->redirect(array('view','id'=>$model->id));
                }else
                   throw new Exception("Error Processing Request", 1);
	
			}
	        catch (Exception $e){
	            $transaction->rollBack();
	            Yii::app()->user->setFlash('error', "No se pudo registrar el proveedor extranjero.");
	            //return false;
	        }
				
		}

		$this->render('create',array(
			'model'=>$model, 'modelProveedor'=>$modelProveedor, 'modelContacto'=>$modelContacto, //'modelCuenta'=>$modelCuenta, 'modelObjeto'=>$modelObjeto,
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
        
        $modelProveedor= Proveedores::model()->findByPk($model->proveedor_id);
        
        $modelContacto= PersonasContacto::model()->findByAttributes(array('proveedor_id'=>$model->proveedor_id));
        
        //$modelCuenta= ProveedoresCuentas::model()->findById($model->proveedor_id);
        
        //$modelObjeto= ProveedoresObjetos::model()->findById($model->proveedor_id);
        
		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['ProveedoresExtranjeros']))
		{
			$model->attributes=$_POST['ProveedoresExtranjeros'];
            $modelProveedor->attributes=$_POST['Proveedores'];
            $modelContacto->attributes=$_POST['PersonasContacto'];

            
            $transaction = $model->dbConnection->beginTransaction(); // Transaction begin //Yii::app()->db->beginTransaction
			try{
                $modelProveedor->nacional = false;
                if(!$modelProveedor->tiene_rif)
                    $modelProveedor->rif = 'N/A';
                //$modelProveedor->tiene_rif = $_POST['Proveedores']['tiene_rif'];
                $flag = $modelProveedor->save();
                
                if($flag){
                
                    $model->proveedor_id = $modelProveedor->id;
                    $modelContacto->proveedor_id = $modelProveedor->id;

                    $flag = $flag && $model->save();
                    $flag = $flag && $modelContacto->save();

                }
                  
                if($flag){
				    $transaction->commit();    // committing 
                    Yii::app()->user->setFlash('success', "Proveedor extranjero registrado con exito.");
                    $this->redirect(array('view','id'=>$model->id));
                }else
                   throw new Exception("Error Processing Request", 1);
	
			}
	        catch (Exception $e){
	            $transaction->rollBack();
	            Yii::app()->user->setFlash('error', "No se pudo registrar el proveedor extranjero.");
	            //return false;
	        }
				
		}

		$this->render('update',array(
		'model'=>$model, 'modelProveedor'=>$modelProveedor, 'modelContacto'=>$modelContacto, //'modelCuenta'=>$modelCuenta, 'modelObjeto'=>$modelObjeto,
		));
	}

	/**
	* Deletes a particular model.
	* If deletion is successful, the browser will be redirected to the 'admin' page.
	* @param integer $id the ID of the model to be deleted
	*/
	public function actionDelete($id)
	{
        //No queremos borrar proveedores extranjeros por los momentos.
        Yii::app()->end();
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
