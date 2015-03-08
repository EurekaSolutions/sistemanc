<?php

class FacturasProductosController extends Controller
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
			'actions'=>array('index','view','buscarProductosPartida', 'filaProducto','buscarProductosFactura'),
			'users'=>array('*'),
		),
		array('allow', // allow authenticated user to perform 'create' and 'update' actions
			'actions'=>array('create','update'),
			'users'=>array('@'),
		),
		array('allow', // allow admin user to perform 'admin' and 'delete' actions
			'actions'=>array('admin','delete'),
			//'users'=>array('admin'),
		),
		array('deny',  // deny all users
			'users'=>array('*'),
		),
		);
	}

	/**
	* Busqueda de la lista de productos según la partida.
	*/
	public function actionBuscarProductosFactura()
	{
		if(!empty($_POST['FacturasProductos']['factura_id'])){
			$model=new FacturasProductos;
			
			 $this->widget('booster.widgets.TbGridView',array(
									'id'=>'facturas-productos-grid',
									'dataProvider'=>$model->buscarProductosFactura($_POST['FacturasProductos']['factura_id']),
									'filter'=>$model,
									'columns'=>array(
											//'id',
											//'factura_id',
											array('name'=>'producto_id', 'value'=>'$data->producto->etiquetaProducto()'),
											array('name' => 'costo_unitario', 'value'=>'number_format($data->costo_unitario,2)'),
											'cantidad_adquirida',
											array('name'=>'iva_id','value'=>'$data->iva->etiquetaPorcentaje()'),
											/*
											'fecha',
											'presupuesto_partida_id',
											*/
										array(
										'class'=>'booster.widgets.TbButtonColumn',
											//'template'=>'{view}{update}<br>{delete}',
										),
									),
							));
				} 
	}

	/**
	* Busqueda de la lista de productos según la partida.
	*/
	public function actionBuscarProductosPartida()
	{
		if(!empty($_POST['FacturasProductos']['presupuesto_partida_id']))
			PresupuestoPartidas::model()->findByPk($_POST['FacturasProductos']['presupuesto_partida_id'])->partida->listaProductos();
	}

	/**
	* Displays a particular model.
	* @param integer $id the ID of the model to be displayed
	*/
	public function actionFilaProducto()
	{
		$model=new FacturasProductos;

		//echo '<tr>';

			$form=$this->beginWidget('booster.widgets.TbActiveForm',array(
				'id'=>'facturas-productos-fila',
				'enableAjaxValidation'=>false,
			)); 
				//echo '<div id="retorno">';
				echo '<td>';

					echo '<div class="form-group">';
					$list = CHtml::listData(PresupuestoPartidas::model()->findAllByAttributes(array('ente_organo_id'=>Usuarios::model()->findByPk(Yii::app()->user->getId())->enteOrgano->ente_organo_id)), 
						'partida_id', function($presuPartida){ return $presuPartida->partida->etiquetaPartida();});

					echo CHtml::label('Seleccionar partida', 'partida');
					echo "<br>";
					$this->widget(
					    'booster.widgets.TbSelect2',
					    array(
					        'asDropDownList' => true,
					        'model' => $model,
					        
					        'attribute' => 'presupuesto_partida_id',
					        //'name' => 'factura_id',
					        'data' => $list,
					        'htmlOptions'=>array('id'=>'partida',
										'ajax' => array(
												'type'=>'POST', //request type
												'url'=>CController::createUrl('facturasProductos/buscarProductosPartida'), //url to call.
												//Style: CController::createUrl('currentController/methodToCall')
												'update'=>'#producto', //selector to update
												//'data'=>'js:javascript statement' 
												//leave out the data key to pass all form values through
										  )),
					        'options' => array(
					            //'tags' => array('proveedores'),
					            'placeholder' => 'Partida',
					            'width' => '40%',
					            'tokenSeparators' => array(',', ' ')
					        )
					    )
					);
					echo '</div>';
				echo '</td>';

				echo '<td>';

					echo '<div class="form-group">';

					echo CHtml::label('Seleccionar producto', 'producto');
					echo "<br>";
					$this->widget(
					    'booster.widgets.TbSelect2',
					    array(
					        'asDropDownList' => true,
					        'model' => $model,
					        
					        'attribute' => 'producto_id',
					        //'name' => 'factura_id',
					        'data' => array(),
					        'htmlOptions'=>array('id'=>'producto',),
					        'options' => array(
					            //'tags' => array('proveedores'),
					            'placeholder' => 'Producto',
					            'width' => '40%',
					            'tokenSeparators' => array(',', ' ')
					        )
					    )
					);
					echo '</div>';
				echo '</td>';
				
				echo '<td>';
					echo $form->textFieldGroup($model,'costo_unitario',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>38))));
				echo '</td>';

				echo '<td>';
					echo $form->textFieldGroup($model,'cantidad_adquirida',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5'))));
				echo '</td>';


				echo '<td>';
					$list = CHtml::listData(Iva::model()->findAll(), 'id', 'porcentaje');
					echo $form->dropDownListGroup(
								$model,
								'iva_id',
								array(
									'wrapperHtmlOptions' => array(
										'class' => 'col-sm-5',
									),
									'widgetOptions' => array(
										'data' => $list,
										'htmlOptions' => array(),
									)
								)
							);
				echo '</td>';
				echo '</div>';
	 		$this->endWidget(); 
 	//echo '</tr>';
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
		$model=new FacturasProductos;

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['FacturasProductos']))
		{
			$model->attributes=$_POST['FacturasProductos'];
			if($model->save())
				//$this->redirect(array('view','id'=>$model->id));
				$this->render('create',array(
					'model'=>$model,
		));
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

		if(isset($_POST['FacturasProductos']))
		{
			$model->attributes=$_POST['FacturasProductos'];
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
/*		$dataProvider=new CActiveDataProvider('FacturasProductos');
			$this->render('index',array(
			'dataProvider'=>$dataProvider,
		));*/
		$this->redirect(array('facturasProductos/create'));
	}

	/**
	* Manages all models.
	*/
	public function actionAdmin()
	{
		$model=new FacturasProductos('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['FacturasProductos']))
			$model->attributes=$_GET['FacturasProductos'];

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
		$model=FacturasProductos::model()->findByPk($id);
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
		if(isset($_POST['ajax']) && $_POST['ajax']==='facturas-productos-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
}
