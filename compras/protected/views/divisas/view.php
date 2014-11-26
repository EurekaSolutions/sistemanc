<?php
/* @var $this DivisasController */
/* @var $model Divisas */
?>

<?php
$this->breadcrumbs=array(
	'Divisases'=>array('index'),
	$model->divisa_id,
);

$this->menu=array(
	array('label'=>'List Divisas', 'url'=>array('index')),
	array('label'=>'Create Divisas', 'url'=>array('create')),
	array('label'=>'Update Divisas', 'url'=>array('update', 'id'=>$model->divisa_id)),
	array('label'=>'Delete Divisas', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->divisa_id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Divisas', 'url'=>array('admin')),
);
?>

<h1>View Divisas #<?php echo $model->divisa_id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView',array(
    'htmlOptions' => array(
        'class' => 'table table-striped table-condensed table-hover',
    ),
    'data'=>$model,
    'attributes'=>array(
		'divisa_id',
		'abreviatura',
		'simbolo',
		'nombre',
		'tasa',
		'fecha_desde',
		'fecha_hasta',
	),
)); ?>