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

	<!--<div id="mainmenu">-->
		<?php 

		if(!Yii::app()->user->isGuest)
		{
		    $this->widget(
    		'booster.widgets.TbNavbar',
		    array(
			    'brand' => 'Plan de compras del estado',
			    'fixed' => false,
			    'fluid' => true,
			    'items' => array(
				    array(
					    'class' => 'booster.widgets.TbMenu',
					    'type' => 'navbar',
					    'items' => array(
						    //array('label' => 'Home', 'url' => '#', 'active' => true),
						    array('label'=>'Inicio', 'url'=>array('/planificacion/index'), 'visible'=>!Yii::app()->user->isGuest),
						    array('label'=>'Partidas', 'url'=>array('/planificacion/partidas'), 'visible'=>!Yii::app()->user->isGuest),
						    array('label'=>'Vista parcial', 'url'=>array('/planificacion/vistaparcial'), 'visible'=>!Yii::app()->user->isGuest),
						    array(
								'label' => 'Agregar',  //si el usuario es creado por este sistema
								'items' => array(
									array('label' => 'Proyecto', 'url' => array('/planificacion/agregarproyecto')),
									array('label' => 'Acción centralizada', 'url' => array('/planificacion/agregarcentralizada')),
									array('label'=>  'Partidas a proyectos', 'url'=>array('/planificacion/asignarpartidasproyecto'), 'visible'=>!Yii::app()->user->isGuest), // si el tipo es admin.
								)
							),
							array('label'=>'Crear ente', 'url'=>array('/planificacion/crearente'), 'visible'=>!Yii::app()->user->isGuest), // si el tipo es ORGANO
							array('label'=>'Mis entes', 'url'=>array('/planificacion/misentes'), 'visible'=>!Yii::app()->user->isGuest), // si el tipo es ORGANO
						    array('label'=>'Perfil usuario', 'url'=>array('/usr/profile'), 'visible'=>!Yii::app()->user->isGuest),
						    
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
