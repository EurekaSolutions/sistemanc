<?php
$this->breadcrumbs=array(
		'Facturases'=>array('index'),
		$model->id,
	);

$this->menu=array(
	//array('label'=>'List Facturas','url'=>array('index')),
	array('label'=>'Registrar Factura','url'=>array('create')),
	array('label'=>'Actualizar Factura','url'=>array('update','id'=>$model->id)),
	array('label'=>'Eliminar Factura','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Administrar Factura','url'=>array('admin')),
	);
?>

<h1>View Facturas #<?php echo $model->id; ?></h1>

<?php 
	$this->widget('booster.widgets.TbDetailView',array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'num_factura',
		'anho',
		'proveedor_id',
		'procedimiento_id',
		'fecha',
		'fecha_factura',
		'ente_organo_id',
),
)); ?>
