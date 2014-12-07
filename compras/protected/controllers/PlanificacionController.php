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
				'actions'=>array('index','view', 'modal', 'agregarproyecto', 'agregarcentralizada', 'administracion', 'crearente', 'misentes'),
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


	public function actionMisentes() 
	{
		$this->render('misentes');
	}

	public function proyectosPartidasParticular($partida)
	{
		$criteria = new CDbCriteria();
		$criteria->condition = 'p1=:p1';
		$criteria->params = array(':p1'=>$partida);
		return Partidas::model()->findAll($criteria);
	}

	public function GeneralXpartida($partida)
	{
		$criteria = new CDbCriteria();
		$criteria->condition = 'p1=:p1 and p3 = 0 and p2 <> 0';
		$criteria->params = array(':p1'=>$partida);
		return Partidas::model()->findAll($criteria);
	}

	public function numeroPartida($partida){
			$numPartida = $partida->p1;
			if($partida->p2 != 0){
				$numPartida .= '.'.sprintf("%02s", $partida->p2);
			}
			if($partida->p3 != 0){
				$numPartida .= '.'.sprintf("%02s", $partida->p3);
			}
			if($partida->p4 != 0){
				$numPartida .= '.'.sprintf("%02s", $partida->p4);
			}

		return $numPartida;//$partida->p1.'.'.sprintf("%02s", $partida->p2).'.'.sprintf("%02s", $partida->p3).'.'.sprintf("%02s", $partida->p4);
	}

	public function numeroProducto($producto){
		return $producto->cod_segmento.'.'.sprintf("%02s", $producto->cod_familia).'.'.sprintf("%02s", $producto->cod_clase).'.'.sprintf("%02s", $producto->cod_producto);
	}

	public function obtenerAccionesCentralizadas()
	{

		$search_values = array('1000' => 1000, '2000' => 2000, '3000' => 3000, '7000' => 7000);
		//$match = addcslashes($match, '000');
		//$match = "000";
		
		$criteria = new CDbCriteria();
		
		$criteria->condition = 'codigo=:_1000 OR codigo=:_2000 OR codigo=:_3000 OR codigo=:_7000';
		$criteria->params = array(':_1000'=>$search_values['1000'],':_2000'=>$search_values['2000'], ':_3000'=>$search_values['3000'], ':_7000'=>$search_values['7000']);

		$AccionesValidas = Acciones::model()->findAll($criteria);

		return $AccionesValidas;

	}

	public function obtenerPartidas()
	{
			$criteria = new CDbCriteria();
			$criteria->compare('t.p1',401, FALSE, "OR");
			$criteria->compare('t.p1',402, FALSE,  "OR");
			$criteria->compare('t.p1',403, FALSE,  "OR");
			$criteria->compare('t.p1',404, FALSE , "OR"); 
			$criteria->compare('t.p2',0); 
			$criteria->compare('t.p3',0); 
			$criteria->compare('t.p4',0);
			
			//$criteria->addSearchCondition('t.nombre', $busqueda);
			$partidas = Partidas::model()->findAll($criteria);

			return $partidas;
	}

	public function actionCrearente()
	{
		$model = new EntesOrganos();

	    // uncomment the following code to enable ajax-based validation
	    /*
	    if(isset($_POST['ajax']) && $_POST['ajax']==='entes-organos-crearente-form')
	    {
	        echo CActiveForm::validate($model);
	        Yii::app()->end();
	    }
	    */

	    if(isset($_POST['EntesOrganos']))
	    {

	        $model->attributes=$_POST['EntesOrganos'];
	        $model->creado_por= 'snc';
	        $model->tipo = 'E';
	        if($model->save())
	        {
	           $entesAscritos = new EntesAdscritos;
	           $usuario = Usuarios::model()->findByPk(Yii::app()->user->getId());
			   
	           $entesAscritos->padre_id = $usuario->ente_organo_id;
	           
	           $entesAscritos->ente_organo_id = $model->ente_organo_id;
	           $entesAscritos->fecha_desde =  date("Y-m-d");
	           $entesAscritos->fecha_hasta = "2199-12-31";
			   $entesAscritos->save();

			   Yii::app()->user->setFlash('success', "Ente creado con éxito!");

			  // $this->redirect(array('view','id'=>$model->producto_id));
			   $model = new EntesOrganos();

			    $this->render('crearente',array(
						'model'=>$model,
			   ));
	            // form inputs are valid, do something here
	            return;
	        }
	    }

	    $this->render('crearente',array('model'=>$model));


	}
	
	public function actionAgregarproyecto()
	{
		

		$model = new Proyectos;

		if(isset($_POST['Proyectos']))
	    {

	        $model->attributes=$_POST['Proyectos'];
	      
	        if($model->save())
	        {
	           $entesAscritos = new EntesAdscritos;
	           
	           $usuario = Usuarios::model()->findByPk(Yii::app()->user->getId());
			   
	           $entesAscritos->padre_id = $usuario->ente_organo_id;
	           
	           $entesAscritos->ente_organo_id = $model->ente_organo_id;
	           $entesAscritos->fecha_desde =  date("Y-m-d");
	           $entesAscritos->fecha_hasta = "2199-12-31";
			   $entesAscritos->save();

			   Yii::app()->user->setFlash('success', "Ente creado con éxito!");

			  // $this->redirect(array('view','id'=>$model->producto_id));
			   $model = new EntesOrganos();

			    $this->render('crearente',array(
						'model'=>$model,
			   ));
	            // form inputs are valid, do something here
	            return;
	        }
	    }
		
		$this->render('agregarproyecto',array('model'=>$model));

	}

	public function actionAgregarcentralizada()
	{
		$acciones = new Acciones;

		$accionestodas = $this->obtenerAccionesCentralizadas();

		$partidas = $this->obtenerPartidas();

		$generales = $this->GeneralXpartida(404);

		$fuentes = FuentesFinanciamiento::model()->findAll();

		$this->render('agregarcentralizada',array('acciones'=>$acciones, 'accionestodas' => $accionestodas, 'partidas' => $partidas, 'generales' => $generales, 'fuentes' => $fuentes));
	}

	public function actionAdministracion()
	{
		$this->render('administracion');
	}

	public function actionModal() /*Aqui esta vista tratara todo lo que tenga relacion con los datos de CENCOEX.*/
	{

			//$_401 = array();
			//$partidas = $this->proyectosPartidas();
			
			/*$busqueda = "Gatos";
			
			$criteria = new CDbCriteria();
			$criteria->condition = 'cod_producto <> 0';
			$criteria->addSearchCondition('t.nombre', $busqueda);
			
			$productos = Productos::model()->findAll($criteria);

			foreach ($productos as $key => $value) {
				
					Productos::model()->findAll($value->cod_segmento);

			}*/

			
			//print_r($productos);

			//$partidas = $this->productosPartidas();
		/*	foreach ($partidas as $key => $partida) {

				$numPartida = $this->numeroPartida($partida);

					if($partida->p2==0) //Partida
					{

						echo '<h2>Partida '.$numPartida.': '.$partida->nombre.'</h2>';
						//$this->productosPartidas($partida);

					}elseif($partida->p3==0) //Geeneral
					{
						echo '<h3>General '.$numPartida.': '.$partida->nombre.'</h3>';
						//$this->productosPartidas($partida);

					}elseif($partida->p4==0)//Especifica
					{
						echo '<h4>Específica '.$numPartida.': '.$partida->nombre.'id: '.$partida->partida_id.'</h4>';
						$this->productosPartidas($partida);

					}else//Sub Especifica
					{	
						echo '<h5>Sub-Específica '.$numPartida.': <b>'.$partida->nombre.' </b></h5>';
						$this->productosPartidas($partida);
					}


				//$value->p3==0;
			}*/


		$this->render('modal');
	}


	public function montoAccion(PresupuestoPartidaAcciones $accion){

			$monto = 0;
			foreach ($accion->presupuestoPartida as $key => $presupuestoPartida) {
				$monto += $presupuestoPartida->monto_presupuestado;
			}
			return $monto;

	}

	public function montoProyecto(Proyectos $proyecto){

			$monto = 0;
			foreach ($proyecto->presupuestoPartidas as $key => $presupuestoPartida) {
				$monto += $presupuestoPartida->monto_presupuestado;
			}
			return $monto;

	}

	public function actionIndex()   /*Aquí vamos a mostrar la primera vista del excel enviado por Zobeida*/
	{

		
		$usuario = Usuarios::model()->findByPk(Yii::app()->user->getId());

		$proyectos = $usuario->enteOrgano->proyectos;
		
		$criteria = new CDbCriteria();
		$criteria->distinct=true;
		$criteria->condition = "ente_organo_id=".$usuario->ente_organo_id ;      
		$criteria->select = 'accion_id';
		$acciones=PresupuestoPartidaAcciones::model()->findAll($criteria);

		$this->render('index',array(
			'usuario'=>$usuario, 'proyectos' => $proyectos,  'acciones' => $acciones
		));



	}
	/**
	*Recibe el id de la acción y retorna la lista de partidas de la acción
	*@param integer $id
	*@return array(Partidas)
	**/
	public function partidasAccion($id){

		$proyectoActual = Proyectos::model()->findByPk($id);
		//print_r($proyectoActual);

		$usuario = Usuarios::model()->findByPk(Yii::app()->user->getId());

		$presupuestoPartidaAcciones = new PresupuestoPartidaAcciones();
		$presupuestoPartidaAcciones->accion_id = $id;
		$presupuestoPartidaAcciones->ente_organo_id = $usuario->ente_organo_id;

		$partidas =array();
		foreach ($presupuestoPartidaAcciones->presupuestoPartida as $key => $prePar) {
			$partidas[$keys] = $prePar->partida;
		}
		return $partidas;
	}
	/**
	*Recibe el id del proyecto y retorna la lista de partidas del proyecto
	*@param integer $id
	*@return array(Partidas)
	**/
	public function partidasProyecto($id){
			
			$partidas =array();
			foreach (Proyectos::model()->findByPk($id)->presupuestoPartidas as $key => $prePar) { //echo '|'.($partida->partida_id);
				$partidas[$key] = $prePar->partida;
			}
			return $partidas;
	}

	public function actionPartidas() /*Aqui van la logica de negocio asociada a cada partida 401, 402, 403, 404 */
	{
		//Selección de Proyecto a Acción
		$proyectoSel = new Proyectos('search');
		$accionSel = new Acciones('search');

		// Selección Partidas
		$partidaSel = new Partidas('search');
		//Selección Producto
		$productoSel = new Productos('search');
		$presupuestoPartidaAcciones = new PresupuestoPartidaAcciones();

		$usuario = Usuarios::model()->findByPk(Yii::app()->user->getId());

		$presuPros = new PresupuestoProductos();

		//$partidas = new PresupuestoPartidas();
		$partidas =array();

		
		//$partidass = '';
		if(isset($_POST['Proyectos']) /*&& isset($_POST['Acciones'])*/)
		{
			$proyectoSel->attributes = $_POST['Proyectos'];
			// Para el manejo del dropdown de acciones y proyectos
			print_r($_POST['Proyectos']['proyecto_id']);
				if(!empty($_POST['Proyectos']['proyecto_id'])){

					
					// Verificando si el id pasado es de una acción o un proyecto
					if(strstr($proyectoSel->proyecto_id, 'a'))
					{
						$accionSel->accion_id = intval(explode('a', $proyectoSel->proyecto_id));
						
						$partidas = $this->partidasAccion($accionSel->accion_id);
					}else{

						$proyectoActual = Proyectos::model()->findByPk($proyectoSel->proyecto_id);
						$partidas = $this->partidasProyecto($proyectoSel->proyecto_id);

						//$partidas = Partidas::model()->findByPk($partidas[0]->partida_id);
						//$partidas = $proyectoSel->presupuestoPartidaProyecto->presupuestoPartida;
		 				//print_r($_POST['Partidas']);
		 				
						if(isset($_POST['Partidas']) && !empty($_POST['Partidas']['partida_id'])){
							$partidaSel->attributes = $_POST['Partidas'];

							$productos = Partidas::model()->findByPk($partidaSel->partida_id)->productos;
 
							if($presuPros = PresupuestoPartidas::model()->findByAttributes(array('partida_id'=>$partidaSel->partida_id,'ente_organo_id'=>$proyectoActual->ente_organo_id)))
							{
								print_r($presuPros);
								$presuPros = $presuPros->presupuestoProductos;
							}else{
								Yii::log('No se pudo obtener la lista de productos asociados a la partida id: '.$partidaSel->partida_id.' y ente id: '.$proyectoActual->ente_organo_id,'warning');
							}
							//print_r($presuPros);
						}

					}
				}

			
			/*$partidass = 'Partidas: <br>';
			//echo $proyectoSel->proyecto_id;
			//$partidas = PresupuestoPartidas::model()->findAllByAttributes(array('proyecto_id'=>$proyectoSel->proyecto_id));
			//$partidas = $proyectoSel->proyectoPartidas;
			//Yii::log('FUNCIONA!!!!!!','error');
			foreach ($presupuestoPartidas as $key => $partida) {
				$partida = $partida->partida;

				$numPartida = $this->numeroPartida($partida);

					if($partida->p2==0) //Partida
					{

						$partidass.= '<h2>Partida '.$numPartida.': '.$partida->nombre.'</h2>';
						//$this->productosPartidas($partida);

					}elseif($partida->p3==0) //Geeneral
					{
						$partidass.= '<h3>General '.$numPartida.': '.$partida->nombre.'</h3>';
						//$this->productosPartidas($partida);

					}elseif($partida->p4==0)//Especifica
					{
						$partidass .= '<h4>Específica '.$numPartida.': '.$partida->nombre.'id: '.$partida->partida_id.'</h4>';
						//$partidass .= $this->productosPartidas($partida);

					}else//Sub Especifica
					{	
						$partidass .= '<h5>Sub-Específica '.$numPartida.': <b>'.$partida->nombre.' </b></h5>';
						//$partidass .= $this->productosPartidas($partida);
					}
			
			}*/
		}

		$this->render('partidas', array('usuario'=>$usuario,'proyectoSel'=>$proyectoSel,'accionSel'=>$accionSel,
			'partidas'=>$partidas, 'partidaSel'=>$partidaSel,'productoSel'=>$productoSel,'presuPros'=>$presuPros));
	}


	public function actionVistaparcial()  /*Aquí mostramos la carga del usuario hasta donde la lleva al momento de consultarla.*/
	{

		$usuario = Usuarios::model()->findByPk(Yii::app()->user->getId());

		$proyectos = $usuario->enteOrgano->proyectos;
		
		$criteria = new CDbCriteria();
		$criteria->distinct=true;
		$criteria->condition = "ente_organo_id=".$usuario->ente_organo_id ;      
		$criteria->select = 'accion_id';
		$acciones=PresupuestoPartidaAcciones::model()->findAll($criteria);
		

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
		$productos = '';
			foreach ($partida->partidaProductos as $key => $parPro) {
				$producto = $parPro->producto;
				$numProducto = $this->numeroProducto($producto);
				$productos .= '<h6>'.$numProducto.' - '.$producto->nombre.'</h6>';
			}		
		return $productos;
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