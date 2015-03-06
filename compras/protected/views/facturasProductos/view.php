<?php
$this->breadcrumbs=array(
		'Facturas Productos'=>array('index'),
		$model->id,
	);

$this->menu=array(
	array('label'=>'List FacturasProductos','url'=>array('index')),
	array('label'=>'Create FacturasProductos','url'=>array('create')),
	array('label'=>'Update FacturasProductos','url'=>array('update','id'=>$model->id)),
	array('label'=>'Delete FacturasProductos','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage FacturasProductos','url'=>array('admin')),
	);
?>

<h1>View FacturasProductos #<?php echo $model->id; ?></h1>

<?php 
	$this->widget('booster.widgets.TbDetailView',array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'factura_id',
		'producto_id',
		'costo_unitario',
		'cantidad_adquirida',
		'iva_id',
		'fecha',
),
)); ?>
