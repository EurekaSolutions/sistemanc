<?php
$this->breadcrumbs=array(
		'Productoses'=>array('index'),
		$model->producto_id=>array('view','id'=>$model->producto_id),
		'Actualizar',
	);

	$this->menu=array(
		array('label'=>'Lista de Productos','url'=>array('index')),
		array('label'=>'Crear Productos','url'=>array('create')),
		array('label'=>'Ver Productos','url'=>array('view','id'=>$model->producto_id)),
		array('label'=>'Administrar Productos','url'=>array('admin')),
		);
	?>

	<h1>Actualizar Productos <?php echo $model->producto_id; ?></h1>

<?php echo $this->renderPartial('_form',array('model'=>$model)); ?>