<?php
$this->breadcrumbs=array(
		'Proveedores Objetoses'=>array('index'),
		$model->id,
	);

$this->menu=array(
	array('label'=>'List ProveedoresObjetos','url'=>array('index')),
	array('label'=>'Create ProveedoresObjetos','url'=>array('create')),
	array('label'=>'Update ProveedoresObjetos','url'=>array('update','id'=>$model->id)),
	array('label'=>'Delete ProveedoresObjetos','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage ProveedoresObjetos','url'=>array('admin')),
	);
?>

<h1>View ProveedoresObjetos #<?php echo $model->id; ?></h1>

<?php 
	$this->widget('booster.widgets.TbDetailView',array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'proveedor_id',
		'ente_organo_id',
		'rama_producto_id',
),
)); ?>
