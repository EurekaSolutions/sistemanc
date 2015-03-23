<?php
$this->breadcrumbs=array(
		'Facturas Productoses'=>array('index'),
		$model->id,
	);

$this->menu=array(
	// array('label'=>'List FacturasProductos','url'=>array('index')),
	// array('label'=>'Create FacturasProductos','url'=>array('create')),
	// array('label'=>'Update FacturasProductos','url'=>array('update','id'=>$model->id)),
	// array('label'=>'Delete FacturasProductos','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	// array('label'=>'Manage FacturasProductos','url'=>array('admin')),
	);
?>

<h1>View FacturasProductos #<?php echo $model->id; ?></h1>

<?php 
	$this->widget('booster.widgets.TbDetailView',array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		array('name'=>'factura_id', 'value'=>'$data->factura->num_factura;'),
		array('name'=>'producto_id', 'value'=>'$data->producto->etiquetaProducto();'),
		'costo_unitario',
		'cantidad_adquirida',
		array('name'=>'iva_id', 'value'=>'$data->iva->porcentaje;'),
		'fecha',
		'presupuesto_partida_id',
),
)); ?>
