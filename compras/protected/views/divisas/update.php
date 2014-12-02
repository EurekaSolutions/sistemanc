<?php
$this->breadcrumbs=array(
		'Divisas'=>array('index'),
		$model->divisa_id=>array('view','id'=>$model->divisa_id),
		'Actualizar',
	);

	$this->menu=array(
		array('label'=>'Lista de Divisas','url'=>array('index')),
		array('label'=>'Crear Divisas','url'=>array('create')),
		array('label'=>'Ver Divisas','url'=>array('view','id'=>$model->divisa_id)),
		array('label'=>'Administrar Divisas','url'=>array('admin')),
		);
	?>

	<h1>Update Divisas <?php echo $model->divisa_id; ?></h1>

<?php echo $this->renderPartial('_form',array('model'=>$model)); ?>