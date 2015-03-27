<?php
$this->breadcrumbs=array(
		'Procedimientoses'=>array('index'),
		$model->id=>array('view','id'=>$model->id),
		'Actualizar',
	);

	$this->menu=array(
		//array('label'=>'Listar Procedimientos','url'=>array('index')),
		array('label'=>'Crear Procedimientos','url'=>array('create')),
		//array('label'=>'View Procedimientos','url'=>array('view','id'=>$model->id)),
		//array('label'=>'Manage Procedimientos','url'=>array('admin')),
		);
	?>

	<h1> Actualizar Procedimiento: <?php echo $model->num_contrato; ?></h1>

<?php echo $this->renderPartial('_form',array('model'=>$model)); ?>