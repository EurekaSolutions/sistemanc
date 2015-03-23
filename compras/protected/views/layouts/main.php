<?php /* @var $this Controller */ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php echo Yii::app()->language; ?>" lang="<?php echo Yii::app()->language; ?>" >
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="language" content="<?php echo Yii::app()->language; ?>" />

	<!-- blueprint CSS framework -->
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/screen.css" media="screen, projection" />
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/print.css" media="print" />
	<!--[if lt IE 8]>
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/ie.css" media="screen, projection" />
	<![endif]-->

	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/main.css" />
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/form.css" />

	<title><?php echo CHtml::encode($this->pageTitle); ?></title>
</head>

<body>

<div class="container-fluid" id="page">

	<div id="header">
		<div id="logo" style="text-align: center;"><?php echo CHtml::image(Yii::app()->request->baseUrl.'/images/banner.jpg'); ?></div>
	</div><!-- header -->
	
<div id="trimestre">
	 <?php if(!Yii::app()->user->isGuest)
						echo 'Cargando: '.($trimestre = Yii::app()->session['trimestresDisponibles'][Yii::app()->session['trimestreSeleccionado']])?$trimestre:''; ?>
</div>
	<!--<div id="mainmenu">-->
		<?php 
$form=$this->beginWidget('booster.widgets.TbActiveForm',array(
	'id'=>'trimestre-seleccion-form',
	'enableAjaxValidation'=>false,
)); 

$list = Yii::app()->session['trimestresDisponibles']?Yii::app()->session['trimestresDisponibles']:array();
if(!Yii::app()->user->isGuest)
$this->widget(
		    'booster.widgets.TbSelect2',
		    array(
		        'asDropDownList' => true,
		        'name' => 'trimestreSeleccion',
		        'data' =>$list,
		        'htmlOptions'=>array('id'=>'trimestreSel',
    			 'ajax' => array(
									'type'=>'POST', //request type
									'url'=>CController::createUrl('site/seleccionarTrimestre'), //url to call.
									//Style: CController::createUrl('currentController/methodToCall')
									//'update'=>'#trimestre', //selector to update
									'success'=>'function(){ location.reload();}'
									//'data'=>'js:javascript statement' 
									//leave out the data key to pass all form values through
							  )),
		        'options' => array(
		            //'tags' => array('proveedores'),
		            'placeholder' => 'Seleccionar trimestre de carga',
		            'width' => '25%',
		            'tokenSeparators' => array(',', ' ')
		        )
		    )
		);
 $this->endWidget();?>
 <?php 
		if(!Yii::app()->user->isGuest)
		{
		    $this->widget(
    		'booster.widgets.TbNavbar',
		    array(
			    'brand' => 'Plan de compras del estado - '.$trimestre,
			    'fixed' => false,
			    'fluid' => true,
			    'items' => array(
				    array(
					    'class' => 'booster.widgets.TbMenu',
					    'type' => 'navbar',
					    'items' => array(
						    //array('label' => 'Home', 'url' => '#', 'active' => true),
						    array('label'=>'Inicio', 'url'=>array('/planificacion/index'), 'visible'=>!Yii::app()->user->isGuest),
						    //array('label'=>'Partidas', 'url'=>array('/planificacion/partidas'), 'visible'=>!Yii::app()->user->isGuest),
						    array(
								'label' => 'Productos',  //si el usuario es creado por este sistema
								'items' => array(
									array('label' => 'Nacional', 'url' => array('/planificacion/nacional')),
									array('label' => 'Importado', 'url' => array('/planificacion/importado')),
									//array('label'=>  'Partidas a proyectos', 'url'=>array('/planificacion/asignarpartidasproyecto'), 'visible'=>!Yii::app()->user->isGuest), // si el tipo es admin.
								)
							),
						    array('label'=>'Estado de carga', 'url'=>array('/planificacion/vistaparcial'), 'visible'=>!Yii::app()->user->isGuest),
						    array(
								'label' => 'Agregar',  //si el usuario es creado por este sistema
								'items' => array(
									array('label' => 'Proyecto', 'url' => array('/planificacion/agregarproyecto'), 'visible'=>Yii::app()->user->checkAccess('presupuesto')),
									array('label' => 'Acción centralizada', 'url' => array('/planificacion/agregarcentralizada'), 'visible'=>Yii::app()->user->checkAccess('presupuesto')),
									array('label'=>  'Partidas a proyectos', 'url'=>array('/planificacion/asignarpartidasproyecto'), 'visible'=>Yii::app()->user->checkAccess('presupuesto')), // si el tipo es admin.
								)
							),
							array('label'=>'Modificación de partida', 'url'=>array('/presupuestoPartidas/modificarPartida'), 'visible'=>Yii::app()->user->checkAccess('presupuesto')),
							array(
								'label' => 'Eliminar',  //si el usuario es creado por este sistema
								'items' => array(
									array('label' => 'Proyecto', 'url' => array('/planificacion/eliminarproyecto'), 'visible'=>(Yii::app()->user->checkAccess('presupuesto'))),
									array('label' => 'Acción centralizada', 'url' => array('/planificacion/eliminaraccion'), 'visible'=>(Yii::app()->user->checkAccess('presupuesto'))),
									array('label'=>  'Partidas', 'url'=>array('/planificacion/eliminarpartidas'), 'visible'=>(Yii::app()->user->checkAccess('presupuesto'))), // si el tipo es admin.
								)
							),
							array(
								'label' => 'Rendición de cuentas',  //si el usuario es creado por este sistema
								'items' => array(
									array('label' => 'Proveedores', 'url' => array('/proveedores/index')),
									array('label' => 'Procedimientos', 'url' => array('/procedimientos/index')),
									array('label'=>  'Facturas', 'url'=>array('/facturas/index'), 'visible'=>!Yii::app()->user->isGuest), // si el tipo es admin.
									array('label'=>  'Agregar productos a facturas', 'url'=>array('/facturasProductos/index'), 'visible'=>!Yii::app()->user->isGuest), // si el tipo es admin.
								),
								//'visible'=>AQUI COLOCAR CONDICIÓN DE SI ESTA EN LA FECHA DE RENDICION DE CUENTA DEL TRIMESTRE PASADO),
							),
							array(
								'label' => 'Mis usuarios',  //si el usuario es creado por este sistema
								'items' => array(
									array('label' => 'Crear usuarios secundarios', 'url'=>array('/usuarios/secundario'), 'visible'=>(Yii::app()->user->checkAccess('ente'))), // si el tipo es ORGANO Yii::app()->session['organo']==1
									array('label' => 'Gestionar', 'url'=>array('/usuarios/gestionarsecundarios'), 'visible'=>(Yii::app()->user->checkAccess('ente'))), // si el tipo es ORGANO Yii::app()->session['organo']==1
									//array('label' => 'Crear usuarios', 'url'=>array('/usuarios/secundario'), 'visible'=>(Yii::app()->user->checkAccess('ente'))), // si el tipo es ORGANO Yii::app()->session['organo']==1
									//array('label'=>  'Partidas a proyectos', 'url'=>array('/planificacion/asignarpartidasproyecto'), 'visible'=>!Yii::app()->user->isGuest), // si el tipo es admin.
								), 'visible'=>(Yii::app()->user->checkAccess('ente')),
							),
							array(
								'label' => 'Entes',  //si el usuario es creado por este sistema
								'items' => array(
									array('label' => 'Crear entes', 'url'=>array('/planificacion/crearente'), 'visible'=>(Yii::app()->user->checkAccess('organo'))), // si el tipo es ORGANO Yii::app()->session['organo']==1
									array('label' => 'Mis entes', 'url'=>array('/planificacion/misentes'), 'visible'=>(Yii::app()->user->checkAccess('organo'))), // si el tipo es ORGANO Yii::app()->session['organo']==1
									array('label' => 'Crear usuarios', 'url'=>array('/planificacion/usuariosentes'), 'visible'=>(Yii::app()->user->checkAccess('organo'))), // si el tipo es ORGANO Yii::app()->session['organo']==1
									array('label' => 'Gestionar usuarios', 'url'=>array('/planificacion/gesUsuEntes'), 'visible'=>(Yii::app()->user->checkAccess('organo'))), // si el tipo es ORGANO Yii::app()->session['organo']==1
									array('label' => 'Reportes por usuario', 'url'=>array('/planificacion/rporusuario'), 'visible'=>(Yii::app()->user->checkAccess('organo'))), // si el tipo es ORGANO Yii::app()->session['organo']==1
									//array('label'=>  'Partidas a proyectos', 'url'=>array('/planificacion/asignarpartidasproyecto'), 'visible'=>!Yii::app()->user->isGuest), // si el tipo es admin.
								), 'visible'=>(Yii::app()->user->checkAccess('organo')),
							),
							array(
								'label' => 'Reportes',  //si el usuario es creado por este sistema
								'items' => array(
									array('label' => 'Carga por partidas', 'url'=>array('/planificacion/rcargaporpartida'), 'visible'=>(Yii::app()->user->checkAccess('ente'))), // si el tipo es ORGANO Yii::app()->session['organo']==1
									array('label' => 'Productos', 'url'=>array('/planificacion/rproducto'), 'visible'=>(Yii::app()->user->checkAccess('ente'))), // si el tipo es ORGANO Yii::app()->session['organo']==1
									/*array('label' => 'Mis entes', 'url'=>array('/planificacion/misentes'), 'visible'=>(Yii::app()->user->checkAccess('organo'))), // si el tipo es ORGANO Yii::app()->session['organo']==1
									array('label' => 'Crear usuarios', 'url'=>array('/planificacion/usuariosentes'), 'visible'=>(Yii::app()->user->checkAccess('organo'))), // si el tipo es ORGANO Yii::app()->session['organo']==1
									array('label' => 'Gestionar usuarios', 'url'=>array('/planificacion/gesUsuEntes'), 'visible'=>(Yii::app()->user->checkAccess('organo'))), // si el tipo es ORGANO Yii::app()->session['organo']==1*/
									//array('label'=>  'Partidas a proyectos', 'url'=>array('/planificacion/asignarpartidasproyecto'), 'visible'=>!Yii::app()->user->isGuest), // si el tipo es admin.
								), 'visible'=>(Yii::app()->user->checkAccess('ente')),
							),


			
							array(
								'label' => 'Administrador',
								'items' => array(
									array('label' => 'Asociar Productos a Partidas', 'url'=>array('/partidaProductos/create'), 'visible'=>(Yii::app()->user->checkAccess('admin'))), // si el tipo es ORGANO Yii::app()->session['organo']==1
									array('label' => 'Eliminar Productos de Partidas', 'url'=>array('/partidaProductos/eliminar'), 'visible'=>(Yii::app()->user->checkAccess('admin'))), // si el tipo es ORGANO Yii::app()->session['organo']==1
									array('label' => 'Modificar correos', 'url'=>array('/planificacion/modificarcorreo'), 'visible'=>(Yii::app()->user->checkAccess('admin'))), // si el tipo es ORGANO Yii::app()->session['organo']==1
									array('label' => 'Gestionar montos de IVA', 'url'=>array('/iva/index'), 'visible'=>(Yii::app()->user->checkAccess('admin'))), 
									array('label' => 'Gestionar partidas', 'url'=> array('/partidas/index'), /*'items'=>array(
													array('label' => 'Crear', 'url'=>array('/partidas/create'), 'visible'=>(Yii::app()->user->checkAccess('admin'))), 
													array('label' => 'Habilitar/Deshabilitar', 'url'=>array('/partidas/admin'), 'visible'=>(Yii::app()->user->checkAccess('admin'))), 
										),*/ 'visible'=>(Yii::app()->user->checkAccess('admin'))), 
									//array('label' => 'Crear organos', 'url'=>array('/entesOrganos/index'), 'visible'=>(Yii::app()->user->checkAccess('admin'))), 
									array('label' => 'Crear organos', 'url'=>array('/planificacion/cargamasiva'), 'visible'=>(Yii::app()->user->checkAccess('admin'))),
									array('label' => 'Fuentes financiamiento', 'url'=>array('/fuentesFinanciamiento'), 'visible'=>(Yii::app()->user->checkAccess('admin'))),  
									/*array('label' => 'Mis entes', 'url'=>array('/planificacion/misentes'), 'visible'=>(Yii::app()->user->checkAccess('admin'))), // si el tipo es ORGANO Yii::app()->session['organo']==1
									array('label' => 'Crear usuarios', 'url'=>array('/planificacion/usuariosentes'), 'visible'=>(Yii::app()->user->checkAccess('admin'))), // si el tipo es ORGANO Yii::app()->session['organo']==1*/
									),
								'visible'=>(Yii::app()->user->checkAccess('admin'))
							),
						   // array('label'=>'Perfil usuario', 'url'=>array('/usr/profile'), 'visible'=>!Yii::app()->user->isGuest),
						    
							array('label'=>'Salir ('.Yii::app()->user->name.')', 'url'=>array('/usr/logout'), 'visible'=>!Yii::app()->user->isGuest)
					    )
				    )
			    )
		    )
	  	  );
		}
	 	?>

	<!--</div> -->
	<?php if(isset($this->breadcrumbs)):?>
		<?php 	
			$this->widget(
				'booster.widgets.TbBreadcrumbs',
				array(
					'homeLink' => 'Inicio',
					'links' => $this->breadcrumbs,
				)
			);
		?><!-- breadcrumbs -->
	<?php endif?>

	<?php echo $content; ?>

	<div class="clear"></div>

	<div id="footer">
		Copyright &copy; <?php echo date('Y'); ?> Servicio Nacional de Contrataciones.<br/>
		All Rights Reserved.<br/>
		<?php //echo Yii::powered(); ?>
	</div><!-- footer -->

</div><!-- page -->

</body>
</html>
