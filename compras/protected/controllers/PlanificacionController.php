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
				'actions'=>array('index','view', 'modal', 'agregarproyecto', 'agregarcentralizada', 'administracion', 'nacional','importado','eliminarProducto'),
				'users'=>array('@'),
			),
			array('allow', // allow authenticated user to perform 'create' and 'update' actions
				'actions'=>array('create','update','partidas','vistaparcial', 'buscarpartida', 'buscargeneral', 'asignarpartidasproyecto', 'buscargeneralproyecto','buscarNcm', 'buscarpartidasproyecto', 'buscarproductospartida'),
				'users'=>array('@'),
			),
			array('allow', // allow admin user to perform 'admin' and 'delete' actions
				'actions'=>array('admin','delete'),
				'users'=>array('admin'),
			),

			array('allow', // allow admin user to perform 'admin' and 'delete' actions
				'actions'=>array('crearente','misentes'),
				'users'=>array('@'),
				//'expression' => "Yii::app()->session['organo']==1"
			),

			array('allow', // allow admin user to perform 'admin' and 'delete' actions
				'actions'=>array('importacion'),
				'users'=>array('*'),
				
			),
			
			
			array('deny',  // deny all users
				'users'=>array('*'),
			),
		);
	}

	public function actionImportacion() /*Aqui esta vista tratara todo lo que tenga relacion con los datos de CENCOEX.*/
	{
		/*$_401 = $this->GeneralXpartida(402);
		$this->render('importacion', array('model'=>$_401));*/
		$this->enviarCorreoRecuperacion('edgar.leal0@gmail.com','19310524');
	}


	public function montoAccionProyectoDivisa($tipo,$id,$ente_id,$fecha){

		if ($tipo=='P'){
			$sql = "select sum(p.monto_presupuesto*p.cantidad*a.tasa) as cantidad 
					from presupuesto_importacion p 
					join presupuesto_partidas pr on (p.presupuesto_partida_id = pr.presupuesto_partida_id) 
					join presupuesto_partida_proyecto py on (pr.presupuesto_partida_id = py.presupuesto_partida_id) 
					join proyectos t on (py.proyecto_id = t.proyecto_id)
					join divisas d on ( p.divisa_id =  d.divisa_id)
					join tasas a on (d.divisa_id = a.divisa_id)
					where a.fecha_desde <= '$fecha'
					and a.fecha_hasta >= '$fecha_hasta'
					and t.proyecto_id = $id and pr.ente_organo_id=$ente_id";

		}else{
			$sql = "select sum(p.monto_presupuesto*p.cantidad*a.tasa) as cantidad 
				from presupuesto_importacion p 
				join presupuesto_partidas pr on (p.presupuesto_partida_id = pr.presupuesto_partida_id) 
				join presupuesto_partida_acciones py on (pr.presupuesto_partida_id = py.presupuesto_partida_id) 
				join acciones t on (py.accion_id = t.accion_id)
				join divisas d on ( p.divisa_id =  d.divisa_id)
				join tasas a on (d.divisa_id = a.divisa_id)
				where a.fecha_desde <= '$fecha'
				and a.fecha_hasta >= '$fecha'
				and t.accion_id = $id and pr.ente_organo_id=$ente_id";
		}
	   		$connection=Yii::app()->db;
	      	$command=$connection->createCommand($sql);
	      	$results=$command->queryAll(); 
			return $results[0]['cantidad'];
	}


	public function actionMisentes() 
	{
		$usuario = Usuarios::model()->findByPk(Yii::app()->user->getId());

		$entesadscritos = $usuario->enteOrgano->hijos;

		$this->render('misentes',array(
						'model'=>$entesadscritos,
		));
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

	public function numeroCodigoNcm($codigo){
		

		$numCodigo = $codigo->codigo_ncm_nivel_1;
			
			if(intval($codigo->codigo_ncm_nivel_4) != 0)
				$numCodigo .= '.'.$codigo->codigo_ncm_nivel_2.'.'.$codigo->codigo_ncm_nivel_3.'.'.$codigo->codigo_ncm_nivel_4;
			else
			if(intval($codigo->codigo_ncm_nivel_3) != 0)
				$numCodigo .= '.'.$codigo->codigo_ncm_nivel_2.'.'.$codigo->codigo_ncm_nivel_3;
			else
			if(intval($codigo->codigo_ncm_nivel_2) != 0)
				$numCodigo .= '.'.$codigo->codigo_ncm_nivel_2;

			return $numCodigo;
		//return $codigo->codigo_ncm_nivel_1.'.'.sprintf("%02s", $codigo->codigo_ncm_nivel_2).'.'.sprintf("%02s", $codigo->codigo_ncm_nivel_3).'.'.sprintf("%02s", $codigo->codigo_ncm_nivel_4);
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

	public function obtenerPartidas($tipo)
	{
		$criteria = new CDbCriteria();

		if($tipo == "*")
		{
			$criteria->compare('t.p1',401, FALSE, "OR");
			$criteria->compare('t.p1',402, FALSE,  "OR");
			$criteria->compare('t.p1',403, FALSE,  "OR");
			$criteria->compare('t.p1',404, FALSE , "OR"); 

		}elseif($tipo=="1000")
		{	
			$criteria->compare('t.p1',401);

		}else
		{
			$criteria->compare('t.p1',402, FALSE,  "OR");
			$criteria->compare('t.p1',403, FALSE,  "OR");
			$criteria->compare('t.p1',404, FALSE , "OR"); 
			
		}
			$criteria->compare('t.p2',0); 
			$criteria->compare('t.p3',0); 
			$criteria->compare('t.p4',0);
			
			//$criteria->addSearchCondition('t.nombre', $busqueda);
			$partidas = Partidas::model()->findAll($criteria);

			return $partidas;
	}

	public function actionCrearente()
	{
		$model = new EntesOrganos('crearente');

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

			   $crea_usuario = new Usuarios('crearente');


			   $crea_usuario->correo = $model->correo;
			   $crea_usuario->contrasena = md5("1236aA");
			   $crea_usuario->usuario = $model->correo;
			   $crea_usuario->creado_el = date("Y-m-d");
			   $crea_usuario->actualizado_el = date("Y-m-d");
			   $crea_usuario->rol = 'normal';
			   $crea_usuario->ente_organo_id = $usuario->ente_organo_id;
			   $crea_usuario->save();

			   Yii::app()->user->setFlash('success', "Ente creado con éxito!");
			   Yii::app()->user->setFlash('notice', "Información de activación fue enviada al correo ". $model->correo);

			  // $this->redirect(array('view','id'=>$model->producto_id));
			   $model = new EntesOrganos('crearente');

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
		
		$model = new Proyectos('create');

		if(isset($_POST['Proyectos']))
	    {

	        $model->attributes=$_POST['Proyectos'];
	      	$usuario = Usuarios::model()->findByPk(Yii::app()->user->getId());

	      	$model->ente_organo_id = $usuario->ente_organo_id;

	        if($model->save())
	        {
	          
			   Yii::app()->user->setFlash('success', "Proyecto creado con éxito!");

			  // $this->redirect(array('view','id'=>$model->producto_id));
			   $model = new Proyectos('create');

			    $this->render('agregarproyecto',array(
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
		$model = new Acciones('crearaccion');

		$accionestodas = $this->obtenerAccionesCentralizadas();

		$fuentes = FuentesFinanciamiento::model()->findAll();

		if(isset($_POST['Acciones']))
	    {

	        $model->attributes=$_POST['Acciones'];

	        if($model->validate())
	        {
	        	//return;
	        	$usuario = Usuarios::model()->findByPk(Yii::app()->user->getId());
	        	$presupuesto_partida = new PresupuestoPartidas;
	        	$presupuesto_partida_acciones = new PresupuestoPartidaAcciones;

	        	$presupuesto_partida->partida_id = $model->general;
	        	$presupuesto_partida->monto_presupuestado = $model->monto;
	        	$presupuesto_partida->fecha_desde = "1900-01-01";
	        	$presupuesto_partida->fecha_hasta = "2199-12-31";
	        	$presupuesto_partida->tipo = "A";
	        	$presupuesto_partida->anho = date("Y");
	        	$presupuesto_partida->ente_organo_id= $usuario->ente_organo_id;
	        	$presupuesto_partida->fuente_fianciamiento_id = $model->fuente;
	        	
	        	if($presupuesto_partida->save())
	        	{
	        		$accion = Acciones::model()->find('codigo=:codigo', array(':codigo'=>$model->nombre));
		        	$presupuesto_partida_acciones->accion_id = $accion->accion_id;
		        	$presupuesto_partida_acciones->presupuesto_partida_id = $presupuesto_partida->presupuesto_partida_id;
		        	$presupuesto_partida_acciones->ente_organo_id = $usuario->ente_organo_id;
		        	$presupuesto_partida_acciones->codigo_accion = $model->nombre;

		        	if($presupuesto_partida_acciones->save())
		        	{
		        		Yii::app()->user->setFlash('success', "Acción centralizada creada con éxito!");
		        	}

		        	$this->refresh();
	        	}

	        }else
	        {
	        	if($model->nombre)
	        	{
	        		//$prueba = $lista_acciones = CHtml::listData($accionestodas, 'codigo', 'nombre');
	        		$partidas = $this->obtenerPartidas($model->nombre);
		    
		    		$partidas_principal = CHtml::listData($partidas, function($partidas) {
																	return CHtml::encode($partidas->partida_id);
																}, function($partidas) {
																	return CHtml::encode($partidas->p1.'-'. $partidas->nombre);
																});
		    		if($model->partida)
		    		{
		    			$tipo = Partidas::model()->findByPk($model->partida);

						$generales = $this->GeneralXpartida($tipo->p1);
					    
					    $generales_todas = CHtml::listData($generales, function($generales) {
																			return CHtml::encode($generales->partida_id);
																		}, function($generales) {
																			return CHtml::encode($generales->p1.'-'.$generales->p2.'-'.$generales->p3.'-'. $generales->nombre);
																		});

					 	$this->render('agregarcentralizada',array('acciones'=>$model, 'accionestodas' => $accionestodas, 'fuentes' => $fuentes, 'partidas_principal' => $partidas_principal, 'generales_todas' => $generales_todas));

		    		}else
		    		{
		    			$this->render('agregarcentralizada',array('acciones'=>$model, 'accionestodas' => $accionestodas, 'fuentes' => $fuentes, 'partidas_principal' => $partidas_principal));
		    		}
	        	}else
	        	{
	        		$this->render('agregarcentralizada',array('acciones'=>$model, 'accionestodas' => $accionestodas, 'fuentes' => $fuentes));
	        	}
	        }
	    }else
	    {
	    	$this->render('agregarcentralizada',array('acciones'=>$model, 'accionestodas' => $accionestodas, 'fuentes' => $fuentes));
	    }
		
	}

	public function actionBuscarpartida()
	{
		$name = "Seleccionar partida";

		if($_POST['Acciones']['nombre'])
		{
			$tipo = $_POST['Acciones']['nombre'];
			$partidas = $this->obtenerPartidas($tipo);
		    
		    $partidas_principal = CHtml::listData($partidas, function($partidas) {
																	return CHtml::encode($partidas->partida_id);
																}, function($partidas) {
																	return CHtml::encode($partidas->p1.'-'. $partidas->nombre);
																});
		     echo CHtml::tag('option',
		                   array('value'=>""),CHtml::encode($name),true);

		    foreach($partidas_principal as $value => $name)
		    {
		        echo CHtml::tag('option',
		                   array('value'=>$value),CHtml::encode($name),true);
		    }
		}else
		{

		     echo CHtml::tag('option',
		                   array('value'=>""),CHtml::encode($name),true);
		}

	}


	public function actionBuscargeneral()
	{
		$name = "Seleccionar partida general";

		if($_POST['Acciones']['partida'] and !empty($_POST['Acciones']['nombre']))
		{
			$tipo = Partidas::model()->findByPk($_POST['Acciones']['partida']);

			$generales = $this->GeneralXpartida($tipo->p1);
		    
		    $generales_todas = CHtml::listData($generales, function($generales){
																return CHtml::encode($generales->partida_id);
															}, function($generales) {
																return CHtml::encode($generales->p1.'-'.$generales->p2.' '.$generales->nombre);
															});
								
		     echo CHtml::tag('option',
		                   array('value'=>""),CHtml::encode($name),true);

		    foreach($generales_todas as $value => $name)
		    {
		        echo CHtml::tag('option',
		                   array('value'=>$value),CHtml::encode($name),true);
		    }
		}else
		{

		     echo CHtml::tag('option',
		                   array('value'=>""),CHtml::encode($name),true);
		}

	}

	public function actionBuscargeneralproyecto()
	{
		$name = "Seleccionar partida general";

		if($_POST['Proyectos']['partida'] and !empty($_POST['Proyectos']['nombreid']))
		{
			$tipo = Partidas::model()->findByPk($_POST['Proyectos']['partida']);

			$generales = $this->GeneralXpartida($tipo->p1);
		    
		    $generales_todas = CHtml::listData($generales, function($generales) {
																return CHtml::encode($generales->partida_id);
															}, function($generales) {
																return CHtml::encode($generales->p1.'-'.$generales->p2.' '.$generales->nombre);
															});
								
		     echo CHtml::tag('option',
		                   array('value'=>""),CHtml::encode($name),true);

		    foreach($generales_todas as $value => $name)
		    {
		        echo CHtml::tag('option',
		                   array('value'=>$value),CHtml::encode($name),true);
		    }
		}else
		{

		     echo CHtml::tag('option',
		                   array('value'=>""),CHtml::encode($name),true);
		}

	}


	public function actionAsignarpartidasproyecto()
	{
		$model = new Proyectos('creaproyecto');

		$usuario = Usuarios::model()->findByPk(Yii::app()->user->getId());

	      	//$model->ente_organo_id = $usuario->ente_organo_id;

	    $fuentes = FuentesFinanciamiento::model()->findAll();
	    
	    $partidas_principal = $this->obtenerPartidas("*");
	      	
		$proyectos = $usuario->enteOrgano->proyectos;



		if(isset($_POST['Proyectos']))
	    {

	        $model->attributes=$_POST['Proyectos'];
	        $model->ente_organo_id = $usuario->ente_organo_id;
	        $model->codigo = $model->nombreid;

	        $nombre_proyecto = Proyectos::model()->find('codigo=:codigo and ente_organo_id=:ente_organo_id', array(':codigo' => $model->codigo, ':ente_organo_id' => $usuario->ente_organo_id));

	        $model->nombre = $nombre_proyecto->nombre;

	        if($model->validate())
	        {

	        	$presupuesto_partida = new PresupuestoPartidas;
	        	$presupuesto_partida_proyecto = new PresupuestoPartidaProyecto;

	        	$presupuesto_partida->partida_id = $model->general;
	        	$presupuesto_partida->monto_presupuestado = $model->monto;
	        	$presupuesto_partida->fecha_desde = "1900-01-01";
	        	$presupuesto_partida->fecha_hasta = "2199-12-31";
	        	$presupuesto_partida->tipo = "P";
	        	$presupuesto_partida->anho = date("Y");
	        	$presupuesto_partida->ente_organo_id= $usuario->ente_organo_id;
	        	$presupuesto_partida->fuente_fianciamiento_id = $model->fuente;
	        	
	        	if($presupuesto_partida->save())
	        	{
	        		//$accion = Acciones::model()->find('codigo=:codigo', array(':codigo'=>$model->nombre));
		        	$presupuesto_partida_proyecto->presupuesto_partida_id = $presupuesto_partida->presupuesto_partida_id;
		        	$presupuesto_partida_proyecto->proyecto_id = $nombre_proyecto->proyecto_id;

		        	if($presupuesto_partida_proyecto->save())
		        	{
		        		 Yii::app()->user->setFlash('success', 'Partida asignada con éxito!');
		        	}

		        	$this->refresh();
	        	}			  
	        }else
		    {
		    	if($model->partida)
			    		{
			    			$tipo = Partidas::model()->findByPk($model->partida);

							$generales = $this->GeneralXpartida($tipo->p1);
						    
						    $generales_todas = CHtml::listData($generales, function($generales) {
																				return CHtml::encode($generales->partida_id);
																			}, function($generales) {
																				return CHtml::encode($generales->p1.'-'.$generales->p2.'-'.$generales->p3.'-'. $generales->nombre);
																			});

						    $this->render('asignarpartidasproyecto',array(
							'model'=>$model, 'fuentes' => $fuentes, 'generales_todas' => $generales_todas, 'partidas' => $partidas_principal, 'proyectos' => $proyectos
				   ));
						}
		    }
	    }
		
		$this->render('asignarpartidasproyecto',array(
						'model'=>$model, 'fuentes' => $fuentes, 'partidas' => $partidas_principal, 'proyectos' => $proyectos
			   ));
	}

	public function actionAdministracion()
	{
		$this->render('administracion');
		//$this->redirect('asignarpartidasproyecto');
	}


	public function montoAccion(PresupuestoPartidaAcciones $accion){

			$monto = 0;
			
			$usuario = Usuarios::model()->findByPk(Yii::app()->user->getId());

			$partidasAcciones = PresupuestoPartidaAcciones::model()->findAllByAttributes(array('accion_id'=>$accion->accion_id,'ente_organo_id'=>$usuario->enteOrgano->ente_organo_id));
			foreach ($partidasAcciones as $key => $partidaAcciones) {

					$monto += $partidaAcciones->presupuestoPartida->monto_presupuestado;
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

	public function enviarCorreoRecuperacion($correo,$cedula,$llave_activacion){
		/*list($controlador) = Yii::app()->createController('usr/default');
		if($controlador->Recuperar($correo, $cedula))
			Yii::app()->user->setFlash('success','Se envio un correo de recuperación al ente registrado.');
		else
			Yii::app()->user->setFlash('warning','No se pudo enviar el correo de recuperación al ente registrado.');*/

		Yii::import('application.extensions.phpmailer.JPhpMailer');
		$mail = new JPhpMailer;
		$mail->IsSMTP();
		$mail->Host = 'correo.snc.gob.ve';
		$mail->port = 465;
		$mail->SMTPSecure = 'tls';
		$mail->CharSet = 'UTF-8';
		$mail->SMTPAuth = true;
		$mail->Username = 'admin_rnce';
		$mail->Password = 'GikforewnEd3';
		
		$mail->SetFrom('rnce@snc.gob.ve', 'RNCE');
		$mail->Subject = 'Sistema Nacional de Compras del Estado';
		$mail->AltBody = 'Sistema Nacional de Compras del Estado';
		$mail->MsgHTML('Aqui vaa la url a crear');
		$mail->AddAddress('edgar.leal0@gmail.com', 'John Doe');
		$mail->Send();

		Yii::app()->user->setFlash('success','Se envio un correo de recuperación al ente registrado.');
	}
	
	public function actionIndex()   /*Aquí vamos a mostrar la primera vista del excel enviado por Zobeida*/
	{

/*
			Yii::import('usr.controllers.DefaultController');
			Yii::import('usr.models.*');
	   		$model = new RecoveryForm();
	   		$model->correo = 'eurekasolutionsca@gmail.com';
	   		$model->cedula = '8';
	   		//$controlador = new DefaultController(222);
	   		//$controlador->sendEmail($model,'recovery');
			//UsrController::sendEmail($model,'recovery');*/

			

		/*Yii::import('application.extensions.phpmailer.JPhpMailer');
		$mail = new JPhpMailer;
		$mail->IsSMTP();
		$mail->Host = 'smpt.gmail.com';
		$mail->SMTPAuth = true;
		$mail->Username = 'eurekasolutionsca@gmail.com';
		$mail->Password = '3ur3k4123';
		$mail->Port = 465;
		$mail->SMTPSecure = 'ssl';
		$mail->SetFrom('eurekasolutionsca@gmail.com', 'yourname');
		$mail->Subject = 'PHPMailer Test Subject via smtp, basic with authentication';
		$mail->AltBody = 'To view the message, please use an HTML compatible email viewer!';
		$mail->MsgHTML('<h1>JUST A TEST!</h1>');
		$mail->AddAddress('edgar.leal0@gmail.com', 'John Doe');
		$mail->Send();*/

		$usuario = Usuarios::model()->findByPk(Yii::app()->user->getId());

		$proyectos = $usuario->enteOrgano->proyectos;
		
		$acciones = PresupuestoPartidaAcciones::model()->findAllByAttributes(array('ente_organo_id'=>$usuario->ente_organo_id),array('distinct'=>true,'select'=>'codigo_accion, accion_id, ente_organo_id'));

		//print_r($acciones);
		$this->render('index',array(
			'usuario'=>$usuario, 'proyectos' => $proyectos,  'acciones' => $acciones
		));



	}
	/**
	*Busca la lista de partidas de la acción
	*@param integer $id
	*@return Partidas[] $partidas
	**/
	public function partidasAccion($id){

		$proyectoActual = Proyectos::model()->findByPk($id);
		//print_r($proyectoActual);

		$usuario = Usuarios::model()->findByPk(Yii::app()->user->getId());

		$presupuestoPartidaAcciones = new PresupuestoPartidaAcciones();
		$presupuestoPartidaAcciones->accion_id = $id;
		$presupuestoPartidaAcciones->ente_organo_id = $usuario->ente_organo_id;

		$partidas =array();
		foreach ($presupuestoPartidaAcciones->presupuestoPartidas as $key => $prePar) {
			$partidas[$keys] = $prePar->partida;
		}
		return $partidas;
	}
	/**
	*Busca la lista de partidas del proyecto
	*@param integer $id
	*@return Partidas[] $partidas
	**/
	public function partidasProyecto($id){
			
			$partidas =array();
			foreach (Proyectos::model()->findByPk($id)->presupuestoPartidas as $key => $prePar) { //echo '|'.($partida->partida_id);
				$partidas[$key] = $prePar->partida;
			}
			return $partidas;
	}

	public function condicionVersion(){
		return 't.fecha_desde<\''.date('Y-m-d').'\' AND t.fecha_hasta>=\''.date('Y-m-d').'\'';
	}


	public function hijosCodigoNcm(CodigosNcm $codigo){
		return CodigosNcm::model()->findAll('codigo_ncm_nivel_1=\''.$codigo->codigo_ncm_nivel_1.'\' AND (codigo_ncm_nivel_2!=\''.$codigo->codigo_ncm_nivel_2.'\' 
										AND codigo_ncm_nivel_3!=\''.$codigo->codigo_ncm_nivel_3.'\' OR codigo_ncm_nivel_4!=\''.$codigo->codigo_ncm_nivel_4.'\') AND '.$this->condicionVersion());
	}

	public function actionBuscarNcm(){
		$name = "Seleccionar producto";

		echo CHtml::tag('option',
		                  array('value'=>""),CHtml::encode($name),true);

		if(isset($_POST['CodigosNcm']) and !empty($_POST['CodigosNcm']['codigo_ncm_id']))
		{

			$listaCodigos = array();
			if($codigoSel=CodigosNcm::model()->findByPk($_POST['CodigosNcm']['codigo_ncm_id']))
				$listaCodigos = CHtml::listData($this->hijosCodigoNcm($codigoSel),
						'codigo_ncm_id', function($codigo){ return CHtml::encode($this->numeroCodigoNcm($codigo).' - '.$codigo->descripcion_ncm);});

			
		//$listaCodigos = array('era'=>'asdfasdf','asdfad'=>'asdfasdf');
		    foreach($listaCodigos as $value => $name)
		    {
		        echo CHtml::tag('option',
		                   array('value'=>$value),CHtml::encode($name),true);
		    }
		}
		
	}
	public function actionBuscarpartidasproyecto()
	{
		$name = "Seleccionar partida";

		 echo CHtml::tag('option',
		                   array('value'=>""),CHtml::encode($name),true);

		if(isset($_POST['Proyectos']) and !empty($_POST['Proyectos']['proyecto_id']))
		{

			if(strstr($_POST['Proyectos']['proyecto_id'], 'a'))
			{//Es un id de accion
				$accionId = intval(explode('a', $_POST['Proyectos']['proyecto_id']));
				$partidas = $this->partidasAccion($accionId);
			}else{//Es un id de proyecto
				$proyectoSel = Proyectos::model()->findByPk($_POST['Proyectos']['proyecto_id'] );

				//$proyectoActual = Proyectos::model()->findByPk($proyectoSel->proyecto_id);
				$partidas = $this->partidasProyecto($proyectoSel->proyecto_id);
			}	
		    
		    $partidas_principal = CHtml::listData($partidas, function($partida) {
																	return CHtml::encode($partida->partida_id);
																}, function($partida) {
																	return CHtml::encode($this->numeroPartida($partida).' - '. $partida->nombre);
																});
		    
		    foreach($partidas_principal as $value => $name)
		    {
		        echo CHtml::tag('option',
		                   array('value'=>$value),CHtml::encode($name),true);
		    }
		}

	}
	public function actionBuscarproductospartida()
	{
		$name = "Seleccionar producto";

		 echo CHtml::tag('option',
		                   array('value'=>""),CHtml::encode($name),true);

		if(isset($_POST['Proyectos']) and !empty($_POST['Proyectos']['proyecto_id']))
		{
			$productosPartidas = array();
			if(isset($_POST['Partidas']) && !empty($_POST['Partidas']['partida_id'])){

				$productosPartidas = $this->listaProductosPartida($_POST['Partidas']['partida_id'], $_POST['Proyectos']['proyecto_id']); // Partidas::model()->findByPk($_POST['Partidas']['partida_id'])->productos;
			}
		   
		    $productosPartidass = CHtml::listData($productosPartidas, 'producto_id', 
									function($producto){ return CHtml::encode($this->numeroProducto($producto).' - '.$producto->nombre);}
																);
		    
		    foreach($productosPartidass as $value => $name)
		    {
		        echo CHtml::tag('option',
		                   array('value'=>$value),CHtml::encode($name),true);
		    }
		}

	}
	public function actionEliminarProducto($producto){
		
		$producto = PresupuestoProductos::model()->findByPk($producto);
		$transaction = $producto->dbConnection->beginTransaction(); // Transaction begin //Yii::app()->db->beginTransaction
		 try{

				if($producto->delete())
				{
					$transaction->commit();    // committing 
					return true;
				}else $transaction->rollBack();
		}
        catch (Exception $e){
            $transaction->rollBack();
            return false;
        }
        return false;
	}
	public  function obtenerUnidadNombre($data,$row){
			return $data->unidad->nombre; 
	}
	public  function obtenerProductoNombre($data,$row){
			return $this->numeroProducto($data->producto).' - '.$data->producto->nombre; 
	}
	public  function obtenerCostoUnidadNombre($data,$row){
			return number_format($data->costo_unidad,2,',','.').' Bs.'; 
	}
	public function productoExisteProyecto($presuProId,$proyectoActualId,$partidaId){

			foreach (Proyectos::model()->findByPk($proyectoActualId)->presupuestoPartidas as $key => $value) {
				if($value->partida_id == $partidaId && $value->ente_organo_id == $this->usuario()->ente_organo_id)
					foreach ($value->presupuestoProductos as $key => $producto) {
						if($producto->producto_id == $presuProId){
							echo 'Existe';
							return true;
						}
					}
			}
		return false;
	}
	public function listaProductosPartida($partidaId, $proyectoActualId)
	{
		$productos = array();
		
	/*	foreach (Proyectos::model()->findByPk($proyectoActualId)->presupuestoPartidas as $key => $value) {
			if($value->partida_id == $partidaId)
				foreach ($value->presupuestoProductos as $key => $producto) {
						foreach (Partidas::model()->findByPk($partidaId)->productos as $key => $productoPar) {
							if($productoPar->producto_id != $producto->producto_id)
								$productos[] = $productoPar;
						}
						
				}
		}
*/
		foreach (PresupuestoPartidaProyecto::model()->findAllByAttributes(array('proyecto_id'=>$proyectoActualId)) as $key => $value) {
			foreach (PresupuestoPartidas::model()->findAllByAttributes(array('presupuesto_partida_id'=>$value->presupuesto_partida_id)) as $key => $value) {
				if($value->partida_id == $partidaId)
					foreach (PresupuestoProductos::model()->findAllByAttributes(array('proyecto_partida_id'=>$value->presupuesto_partida_id)) as $key => $producto) {
						foreach (Partidas::model()->findByPk($partidaId)->productos as $key => $productoPar) {
							if($productoPar->producto_id != $producto->producto_id)
								$productos[] = $productoPar;
						}
						
					}
			}
		}
		return $productos;
	}
	public function usuario(){
		return Usuarios::model()->findByPk(Yii::app()->user->getId());
	}
	public function actionNacional() /*Aqui van la logica de negocio asociada a cada partida 401, 402, 403, 404 */
	{
		$usuario = Usuarios::model()->findByPk(Yii::app()->user->getId());

		//Selección de Proyecto a Acción
		$proyectoSel = new Proyectos('search');
		$accionSel = new Acciones('search');

		// Selección Partidas
		$partidaSel = new Partidas('search');
		//Selección Producto
		$productoSel = new Productos('search');

		
		// Lista de productos cargados
		$presuPros = new PresupuestoProductos();

		$presuPro = new PresupuestoProductos();
		$presuPro->tipo = 'N';

		//$partidas = new PresupuestoPartidas();
		$partidas =array();
		
		$productosPartidas = array();

		//$partidass = '';
		if(isset($_POST['Proyectos']) /*&& isset($_POST['Acciones'])*/)
		{
			$proyectoSel->attributes = $_POST['Proyectos'];
			// Para el manejo del dropdown de acciones y proyectos
			//print_r($_POST['Proyectos']['proyecto_id']);
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
							//$presuPros = Proyectos::model()->findAllByAttributes(array('proyecto_id'=>attributeValue), condition, array('key'=>value))

							//$productosPartidas = Partidas::model()->findByPk($partidaSel->partida_id)->productos;
							
							// Producto Nacional
							if(isset($_POST['Productos']))
								$productoSel->attributes = $_POST['Productos'];


							/*localhost:1721616613 port:5435
							echo 'partidaId: '.$partidaSel->partida_id.'  ente: '.$usuario->ente_organo_id;
							echo '<br>';*/

							$presuPros = $proyectoActual->presupuestoPartidas;
							$aux = array();
							foreach ($presuPros as $key => $value) {
								if($value->partida_id == $partidaSel->partida_id)
									$aux[] = $value->presupuestoProducto;
							}
							//print_r($presuPros=$aux);
							$presuPros=$aux;
							/*if($presuPros = PresupuestoPartidas::model()->findByAttributes(array('partida_id'=>$partidaSel->partida_id,'ente_organo_id'=>$usuario->ente_organo_id)))
							{
								//print_r($presuPros);
								$presuPros = $presuPros->presupuestoProductos;
							}else{
								Yii::log('No se pudo obtener la lista de productos asociados a la partida id: '.$partidaSel->partida_id.' y ente id: '.$usuario->ente_organo_id,'warning');
							}*/
							//print_r($presuPros);
						}

					}

					if(isset($_POST['Partidas']) && !empty($_POST['Partidas']['partida_id'])){
							$partidaSel->attributes = $_POST['Partidas'];
							//$presuPros = Proyectos::model()->findAllByAttributes(array('proyecto_id'=>attributeValue), condition, array('key'=>value))

							$productosPartidas = $this->listaProductosPartida($partidaSel->partida_id, $proyectoSel->proyecto_id); //Partidas::model()->findByPk($partidaSel->partida_id)->productos;
							$productosPartidas = CHtml::listData($productosPartidas, 'producto_id', 
                                                        function($producto){ return CHtml::encode($this->numeroProducto($producto).' - '.$producto->nombre);});
					}
				}


		}
				if(isset($_POST['PresupuestoProductos'])){
								$presuPro->attributes = $_POST['PresupuestoProductos'];
								$presuPro->tipo = 'N';

								//print_r($presuPro);
								$presuPartida = new PresupuestoPartidas();
								if(!empty($accionSel->accion_id)){
									foreach ( PresupuestoPartidasAcciones::model()->findAllByAttributes(array('accion_id'=>$accionSel->accion_id,'ente_organo_id'=>$usuario->ente_organo_id)) as $key => $value) {
									 	if($value->presupuestoPartida->partida_id == $partidaSel->partida_id)
									 		$presuPartida = $value->presupuestoPartida;
									 }
								}

								if(isset($proyectoActual))
								{
									foreach ($proyectoActual->presupuestoPartidas as $key => $presupuestoPartida) 
										if($presupuestoPartida->partida_id == $partidaSel->partida_id)
											$presuPartida = $presupuestoPartida;
								}

									
								$presuPro->proyecto_partida_id = $presuPartida->presupuesto_partida_id;
										
								$presuPro->monto_ejecutado = 0;
								$presuPro->producto_id = $productoSel->producto_id;
								/*	if($presupuestoPartida = ->findByAttributes(array('partida_id'=>$partidaSel->partida_id)))
									$presuPro->proyecto_partida_id = $presupuestoPartida->presupuesto_partida_id;*/
								
								//Monto en presupuesto en Bs. del producto
								$presuPro->monto_presupuesto = floatval($presuPro->costo_unidad) * floatval($presuPro->cantidad);


								if($presuPro->validate())
								{
									/*if($this->productoExisteProyecto($presuPro->producto_id,$proyectoActual->proyecto_id,$partidaSel->partida_id))
									{
										Yii::app()->user->setFlash('error', "El producto ya esta cargado!");
									}else{*/
										if($presuPro->save()){
											$presuPro = new PresupuestoProductos();
											//$this->redirect(array('/planificacion/partidas'));
											Yii::app()->user->setFlash('success', "Producto cargado con  éxito!");
										}else
										throw new Exception("Error Processing Request", 1);
									//}
								}//else Yii::app()->user->setFlash('Error','error');
							

					}

		$this->render('nacional', array('usuario'=>$usuario,'proyectoSel'=>$proyectoSel,'accionSel'=>$accionSel,
			'partidas'=>$partidas, 'partidaSel'=>$partidaSel,'productoSel'=>$productoSel,'presuPros'=>$presuPros,
			'presuPro'=>$presuPro, 'productosPartidas'=>$productosPartidas));
	}

	public function actionImportado(){
		$usuario = Usuarios::model()->findByPk(Yii::app()->user->getId());

		//Selección de Proyecto a Acción
		$proyectoSel = new Proyectos('search');
		$accionSel = new Acciones('search');

		// Selección Partidas
		$partidaSel = new Partidas('search');
		//Selección Producto
		$productoSel = new Productos('search');

		
		// Lista de productos cargados
		$presuPros = new PresupuestoImportacion();

		$presuImp = new PresupuestoImportacion();

		$codigoNcmSel = new CodigosNcm();

		//$partidas = new PresupuestoPartidas();
		$partidas =array();
		
		$productosPartidas = array();

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
							//$presuPros = Proyectos::model()->findAllByAttributes(array('proyecto_id'=>attributeValue), condition, array('key'=>value))

							//$productosPartidas = Partidas::model()->findByPk($partidaSel->partida_id)->productos;
							
							// Producto Nacional
							if(isset($_POST['Productos']))
								$productoSel->attributes = $_POST['Productos'];


							/*localhost:1721616613 port:5435
							echo 'partidaId: '.$partidaSel->partida_id.'  ente: '.$usuario->ente_organo_id;
							echo '<br>';*/

							$presuPros = $proyectoActual->presupuestoPartidas;
							$aux = array();
							foreach ($presuPros as $key => $value) {
								if($value->partida_id == $partidaSel->partida_id)
									$aux[] = $value->presupuestoProducto;
							}
							//print_r($presuPros=$aux);
							$presuPros=$aux;
							/*if($presuPros = PresupuestoPartidas::model()->findByAttributes(array('partida_id'=>$partidaSel->partida_id,'ente_organo_id'=>$usuario->ente_organo_id)))
							{
								//print_r($presuPros);
								$presuPros = $presuPros->presupuestoProductos;
							}else{
								Yii::log('No se pudo obtener la lista de productos asociados a la partida id: '.$partidaSel->partida_id.' y ente id: '.$usuario->ente_organo_id,'warning');
							}*/
							//print_r($presuPros);
						}

						if(isset($_POST['Partidas']) && !empty($_POST['Partidas']['partida_id'])){
							$partidaSel->attributes = $_POST['Partidas'];
							//$presuPros = Proyectos::model()->findAllByAttributes(array('proyecto_id'=>attributeValue), condition, array('key'=>value))

							$productosPartidas = Partidas::model()->findByPk($partidaSel->partida_id)->productos;
							$productosPartidas = CHtml::listData($productosPartidas, 'producto_id', 
				                                        function($producto){ return CHtml::encode($this->numeroProducto($producto).' - '.$producto->nombre);});
						}
					}
				}


		}

					
					$presuPartida = new PresupuestoPartidas();
					if(!empty($accionSel->accion_id)){
						foreach ( PresupuestoPartidasAcciones::model()->findAllByAttributes(array('accion_id'=>$accionSel->accion_id,'ente_organo_id'=>$usuario->ente_organo_id)) as $key => $value) {
						 	if($value->presupuestoPartida->partida_id == $partidaSel->partida_id)
						 		$presuPartida = $value->presupuestoPartida;
						 }
					}

					if(isset($proyectoActual))
					{
						foreach ($proyectoActual->presupuestoPartidas as $key => $presupuestoPartida) 
							if($presupuestoPartida->partida_id == $partidaSel->partida_id)
								$presuPartida = $presupuestoPartida;
					}

					// Producto Importado
					if(isset($_POST['PresupuestoImportacion']) /*&& isset($_POST['PresupuestoProductos'])*/)
					{
						
						//if(isset($_POST['CodigosNcm'])){
							//$presuImpSel->attributes = $_POST['CodigosNcm'];

							$presuImp->attributes = $_POST['PresupuestoImportacion'];
							$presuImp->presupuesto_partida_id = $presuPartida->presupuesto_partida_id;
							$presuImp->monto_ejecutado = 0;
							$presuImp->producto_id = $productoSel->producto_id;
							
							
								$transaction = $presuImp->dbConnection->beginTransaction(); // Transaction begin //Yii::app()->db->beginTransaction
								try{

										if($presuImp->save())
										{
											$transaction->commit();    // committing 
											$presuImp = new PresupuestoImportacion();
											Yii::app()->user->setFlash('success', "Producto cargado con  éxito!");
										}else {
											Yii::app()->user->setFlash('warning', "No se pudo guardar el producto.");
											$transaction->rollBack();
										}

								}
		                        catch (Exception $e){
		                        	Yii::app()->user->setFlash('error', "Hubo un problema. No se guardo el producto. ID:".$e);
		                            $transaction->rollBack();
		                        }
							
						//}

					
						//$this->guardarPresupuestoProductos($presuPro);
					}


		$this->render('importado', array('usuario'=>$usuario,'proyectoSel'=>$proyectoSel,'accionSel'=>$accionSel,
			'partidas'=>$partidas, 'partidaSel'=>$partidaSel,'productoSel'=>$productoSel,'presuPros'=>$presuPros,
			'presuImp'=>$presuImp, 'productosPartidas'=>$productosPartidas,'codigoNcmSel'=>$codigoNcmSel));
	}


	public function actionVistaparcial()  /*Aquí mostramos la carga del usuario hasta donde la lleva al momento de consultarla.*/
	{

		$usuario = Usuarios::model()->findByPk(Yii::app()->user->getId());

		$proyectos = $usuario->enteOrgano->proyectos;
		
		$criteria = new CDbCriteria();
		$criteria->distinct=true;
		$criteria->condition = "ente_organo_id=".$usuario->ente_organo_id ;      
		$criteria->select = 'codigo_accion, accion_id, ente_organo_id';
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
		$productos = array();
			foreach ($partida->partidaProductos as $key => $parPro) {
				$productos[] = $parPro->producto;
			}		
		return $productos;
	}






	/*public function montoAccionProyecto($id,$ente_id,$tipo){
		if($tipo == 'A'){

		$monto = PresupuestoPartidas::model()->findAllBySql('select sum(monto_presupuesto)  
from presupuesto_productos p join presupuesto_partidas pr on (p.proyecto_partida_id = pr.presupuesto_partida_id)
join presupuesto_partida_proyecto py on (pr.presupuesto_partida_id = py.presupuesto_partida_id)
join proyectos t on (py.proyecto_id = t.proyecto_id)');

		}else{

			PresupuestoPartida::model()->findAllBySql();

		}

		return $monto;


	}*/

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