<?php

class PlanificacionController extends Controller
{

	public $layout='//layouts/planificacion';


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
				'actions'=>array('index','view'),
				'users'=>array('@'),
			),
			array('allow', // allow authenticated user to perform 'create' and 'update' actions
				'actions'=>array('create','update','partidas','vistaparcial'),
				'users'=>array('@'),
			),
			array('allow', // allow admin user to perform 'admin' and 'delete' actions
				'actions'=>array('admin','delete'),
				'users'=>array('@'),
			),
			array('deny',  // deny all users
				'users'=>array('*'),
			),
		);
	}

	public function actionImportacion() /*Aqui esta vista tratara todo lo que tenga relacion con los datos de CENCOEX.*/
	{
		$this->render('importacion');
	}


	public function actionIndex()   /*Aquí vamos a mostrar la primera vista del excel enviado por Zobeida*/
	{

		$usuario = new Usuarios;
		
		$usuario = $usuario->model()->findByPk(Yii::app()->user->getId());

		$proyectos = $usuario->codigoOnapre->proyectos;
		
		$acciones = $usuario->codigoOnapre->acciones;
		
		
		$usuario = $usuario->model()->findByPk(Yii::app()->user->getId());

		$this->render('index',array(
			'usuario'=>$usuario, 'proyectos' => $proyectos,  'acciones' => $acciones
		));



	}

	public function actionPartidas() /*Aqui van la logica de negocio asociada a cada partida 401, 402, 403, 404 */
	{
		$model = new ProyectosAcciones('search');

		$partidas = new ProyectoPartidas();

		$usuario = Usuarios::model()->findByPk(Yii::app()->user->getId());

		if(isset($_POST['ProyectosAcciones']))
		{
			$model->attributes = $_POST['ProyectosAcciones'];
			$partidas = $model->proyectoPartidases;
		}

		$this->render('partidas', array('usuario'=>$usuario,'model'=>$model,'partidas'=>$partidas));
	}


	public function actionVistaparcial()  /*Aquí mostramos la carga del usuario hasta donde la lleva al momento de consultarla.*/
	{
		$this->render('vistaparcial');
	}

	public function actionVistaresumen()  /*Aquí mostramos la vista del usuario cuando ya guardo TODOS los datos*/
	{
		$this->render('vistaresumen');
	}

	public function usuarioProyectos(Usuarios $usuario) /*Retorna todos los proyectos pertenecientes al usuario*/  
	{
		
	}

	public function proyectosPartidas(ProyectosAcciones $proyecto)  /*Retorna todas las partidas pertenecientes a un proyecto*/
	{
		
	}

	public function productosPartidas(Partidas $partida)  /*Retorna todas los productos asociados a una partida*/
	{
		
	}

	// Uncomment the following methods and override them if needed
	/*
	public function filters()
	{
		// return the filter configuration for this controller, e.g.:
		return array(
			'inlineFilterName',
			array(
				'class'=>'path.to.FilterClass',
				'propertyName'=>'propertyValue',
			),
		);
	}

	public function actions()
	{
		// return external action classes, e.g.:
		return array(
			'action1'=>'path.to.ActionClass',
			'action2'=>array(
				'class'=>'path.to.AnotherActionClass',
				'propertyName'=>'propertyValue',
			),
		);
	}
	*/
}