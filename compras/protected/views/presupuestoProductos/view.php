<?php
$this->breadcrumbs=array(
		'Presupuesto Productoses'=>array('index'),
		$model->presupuesto_id,
	);

$this->menu=array(
	array('label'=>'List PresupuestoProductos','url'=>array('index')),
	array('label'=>'Create PresupuestoProductos','url'=>array('create')),
	array('label'=>'Update PresupuestoProductos','url'=>array('update','id'=>$model->presupuesto_id)),
	array('label'=>'Delete PresupuestoProductos','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->presupuesto_id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage PresupuestoProductos','url'=>array('admin')),
	);
?>

<h1>View PresupuestoProductos #<?php echo $model->presupuesto_id; ?></h1>

<?php 
	$this->widget('booster.widgets.TbDetailView',array(
	'data'=>$model,
	'attributes'=>array(
		'presupuesto_id',
		'producto_id',
		'unidad_id',
		'costo_unidad',
		'cantidad',
		'monto_presupuesto',
		'tipo',
		'monto_ejecutado',
		'proyecto_partida_id',
		'fecha_estimada',
),
)); ?>
