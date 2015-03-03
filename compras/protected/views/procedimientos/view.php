<?php
$this->breadcrumbs=array(
		'Procedimientoses'=>array('index'),
		$model->id,
	);

$this->menu=array(
	array('label'=>'List Procedimientos','url'=>array('index')),
	array('label'=>'Create Procedimientos','url'=>array('create')),
	array('label'=>'Update Procedimientos','url'=>array('update','id'=>$model->id)),
	array('label'=>'Delete Procedimientos','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Procedimientos','url'=>array('admin')),
	);
?>

<h1>View Procedimientos #<?php echo $model->id; ?></h1>

<?php 
	$this->widget('booster.widgets.TbDetailView',array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'num_contrato',
		'anho',
		'fecha',
),
)); ?>
