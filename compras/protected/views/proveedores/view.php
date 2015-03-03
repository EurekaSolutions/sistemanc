<?php
$this->breadcrumbs=array(
		'Proveedores'=>array('index'),
		$model->id,
	);

$this->menu=array(
	array('label'=>'List Proveedores','url'=>array('index')),
	array('label'=>'Create Proveedores','url'=>array('create')),
	array('label'=>'Update Proveedores','url'=>array('update','id'=>$model->id)),
	array('label'=>'Delete Proveedores','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Proveedores','url'=>array('admin')),
	);
?>

<h1>View Proveedores #<?php echo $model->id; ?></h1>

<?php 
	$this->widget('booster.widgets.TbDetailView',array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'rif',
		'razon_social',
),
)); ?>
