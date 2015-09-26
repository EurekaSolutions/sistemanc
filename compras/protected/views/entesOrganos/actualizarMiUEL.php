<?php
$this->breadcrumbs=array(
		'Mis Entes'=>array('planificaion/misentes'),
		//$model->nombre=>array('view','id'=>$model->ente_organo_id),
		'Actualizar',
	);

	$this->menu=array(
		array('label'=>'Mis UELs','url'=>array('planificacion/misUELs')),

		);
	?>

	<h1>Actualizar Unidad Ejecutora Local <?php echo $model->nombre; ?></h1>

<?php echo $this->renderPartial('_form',array('model'=>$model)); ?>