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
				'actions'=>array('index','view', 'modal'),
				'users'=>array('*'),
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

	public function buscarpartida($partida)
	{
		$criteria = new CDbCriteria();
		$criteria->condition = 'p1=:p1';
		$criteria->params = array(':p1'=>$partida);
		return Partidas::model()->findAll($criteria);
	}
	public function actionModal() /*Aqui esta vista tratara todo lo que tenga relacion con los datos de CENCOEX.*/
	{

		//$_401 = array();
		$partidas = $this->proyectosPartidas();


			foreach ($partidas as $key => $partida) {

				$numPartida = $partida->p1.'.'.sprintf("%02s", $partida->p2).'.'.sprintf("%02s", $partida->p3).'.'.sprintf("%02s", $partida->p4);
				
					if($partida->p2==0) //Partida
					{

						echo '<h2>Partida '.$numPartida.': '.$partida->nombre.'</h2>';
						$this->productosPartidas($partida);

					}elseif($partida->p3==0) 
					{
						echo '<h3>General '.$numPartida.': '.$partida->nombre.'</h3>';
						$this->productosPartidas($partida);

					}elseif($partida->p4==0)
					{
						echo '<h4> Específica '.$numPartida.': '.$partida->nombre.'</h4>';
						//$this->productosPartidas($partida);

					}else
					{	
						echo '<h5>Sub '.$numPartida.': <b>'.$partida->nombre.'</b></h5>';
						//$this->productosPartidas($partida);
					}


				//$value->p3==0;
			}
			
			//$_401[$i][]


		//}

		//echo $part["401"];

		//echo count($_401);

		//print_r($_401);


		$this->render('modal');
	}

	public function actionIndex()   /*Aquí vamos a mostrar la primera vista del excel enviado por Zobeida*/
	{

		
		$usuario = Usuarios::model()->findByPk(Yii::app()->user->getId());

		$proyectos = $usuario->codigoOnapre->proyectos;
		
		$acciones = $usuario->codigoOnapre->acciones;
		
		
		$usuario = $usuario->model()->findByPk(Yii::app()->user->getId());

		$this->render('index',array(
			'usuario'=>$usuario, 'proyectos' => $proyectos,  'acciones' => $acciones
		));



	}

	public function actionPartidas() /*Aqui van la logica de negocio asociada a cada partida 401, 402, 403, 404 */
	{
		$proyectoSel = new ProyectosAcciones('search');

		$partidas = new ProyectoPartidas();

		$usuario = Usuarios::model()->findByPk(Yii::app()->user->getId());

		if(isset($_POST['ProyectosAcciones']))
		{
			$proyectoSel->attributes = $_POST['ProyectosAcciones'];
			$partidas = $proyectoSel->proyectoPartidases;
		}

		$this->render('partidas', array('usuario'=>$usuario,'proyectoSel'=>$proyectoSel,'partidas'=>$partidas));
	}


	public function actionVistaparcial()  /*Aquí mostramos la carga del usuario hasta donde la lleva al momento de consultarla.*/
	{

		$usuario = Usuarios::model()->findByPk(Yii::app()->user->getId());

		$proyectos = $usuario->codigoOnapre->proyectos;
		
		$acciones = $usuario->codigoOnapre->acciones;
		
		
		$usuario = $usuario->model()->findByPk(Yii::app()->user->getId());

		$this->render('vistaparcial',array(
			'proyectos' => $proyectos,  'acciones' => $acciones
		));

	}

	public function actionVistaresumen()  /*Aquí mostramos la vista del usuario cuando ya guardo TODOS los datos*/
	{
		$this->render('vistaresumen');
	}

	public function usuarioProyectos(Usuarios $usuario) /*Retorna todos los proyectos pertenecientes al usuario*/  
	{
		
	}

	public function proyectosPartidas(ProyectosAcciones $proyecto=null)  /*Retorna todas las partidas pertenecientes a un proyecto*/
	{
		if(!$proyecto){
			$criteria = new CDbCriteria();
			//$criteria->condition = 'p1=:p1';
			//$criteria->params = array(':p1'=>$partida);
			return Partidas::model()->findAll();
		}
	}

	public function productosPartidas(Partidas $partida)  /*Retorna todas los productos asociados a una partida*/
	{
			foreach ($partida->partidaProductos as $key => $parPro) {
				echo '<h6>'.$parPro->producto->nombre.'</h6>';
			}		
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