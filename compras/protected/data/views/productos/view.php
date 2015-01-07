<?php
$this->breadcrumbs=array(
		'Productos'=>array('index'),
		$model->producto_id,
	);

$this->menu=array(
	array('label'=>'Lista de Productos','url'=>array('index')),
	array('label'=>'Crear Productos','url'=>array('create')),
	array('label'=>'Actualizar Productos','url'=>array('update','id'=>$model->producto_id)),
	array('label'=>'Eliminar Productos','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->producto_id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Administrar Productos','url'=>array('admin')),
	);
?>

<h1>Ver Productos #<?php echo $model->producto_id; ?></h1>

<?php 
	$this->widget('booster.widgets.TbDetailView',array(
	'data'=>$model,
	'attributes'=>array(
		'producto_id',
		'cod_segmento',
		'cod_familia',
		'cod_clase',
		'cod_producto',
		'nombre',
),
)); ?>
