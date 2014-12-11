<?php
$this->breadcrumbs=array(
		'Partida Productoses'=>array('index'),
		$model->partida_producto_id,
	);

$this->menu=array(
	array('label'=>'List PartidaProductos','url'=>array('index')),
	array('label'=>'Create PartidaProductos','url'=>array('create')),
	array('label'=>'Update PartidaProductos','url'=>array('update','id'=>$model->partida_producto_id)),
	array('label'=>'Delete PartidaProductos','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->partida_producto_id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage PartidaProductos','url'=>array('admin')),
	);
?>

<h1>View PartidaProductos #<?php echo $model->partida_producto_id; ?></h1>

<?php 
	$this->widget('booster.widgets.TbDetailView',array(
	'data'=>$model,
	'attributes'=>array(
		'partida_id',
		'producto_id',
		'tipo_operacion',
		'fecha_desde',
		'fecha_hasta',
		'partida_producto_id',
),
)); ?>
