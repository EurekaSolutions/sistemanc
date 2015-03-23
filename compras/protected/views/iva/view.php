<?php
$this->breadcrumbs=array(
		'Ivas'=>array('index'),
		$model->id,
	);

$this->menu=array(
	array('label'=>'List Iva','url'=>array('index')),
	array('label'=>'Create Iva','url'=>array('create')),
	array('label'=>'Update Iva','url'=>array('update','id'=>$model->id)),
	array('label'=>'Delete Iva','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Iva','url'=>array('admin')),
	);
?>

<h1>View Iva #<?php echo $model->id; ?></h1>

<?php 
	$this->widget('booster.widgets.TbDetailView',array(
	'data'=>$model,
	'attributes'=>array(
		//'id',
		'tipo',
		'porcentaje',
		'fecha',
),
)); ?>
