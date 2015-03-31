<?php
$this->breadcrumbs=array(
		'Proveedores Entes Organoses'=>array('index'),
		$model->id,
	);

$this->menu=array(
	array('label'=>'List ProveedoresEntesOrganos','url'=>array('index')),
	array('label'=>'Create ProveedoresEntesOrganos','url'=>array('create')),
	array('label'=>'Update ProveedoresEntesOrganos','url'=>array('update','id'=>$model->id)),
	array('label'=>'Delete ProveedoresEntesOrganos','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage ProveedoresEntesOrganos','url'=>array('admin')),
	);
?>

<h1>View ProveedoresEntesOrganos #<?php echo $model->id; ?></h1>

<?php 
	$this->widget('booster.widgets.TbDetailView',array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'proveedor_id',
		'ente_organo_id',
		'anho',
),
)); ?>
