<?php
$this->breadcrumbs=array(
	'Usuarios'=>array('index'),
	$model->usuario_id=>array('view','id'=>$model->usuario_id),
	'Actualizar',
);

	$this->menu=array(
	array('label'=>'Lista de Usuarios','url'=>array('index')),
	array('label'=>'Create Usuarios','url'=>array('create')),
	array('label'=>'View Usuarios','url'=>array('view','id'=>$model->usuario_id)),
	array('label'=>'Manage Usuarios','url'=>array('admin')),
	);
	?>

	<h1>Actualizar Usuarios <?php echo $model->usuario_id; ?></h1>

<?php echo $this->renderPartial('_form',array('model'=>$model)); ?>