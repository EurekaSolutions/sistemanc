<?php
/* @var $this UnidadesController */
/* @var $model Unidades */
?>

<?php
$this->breadcrumbs=array(
	'Unidades'=>array('index'),
	$model->unidad_id,
);

$this->menu=array(
	array('label'=>'List Unidades', 'url'=>array('index')),
	array('label'=>'Create Unidades', 'url'=>array('create')),
	array('label'=>'Update Unidades', 'url'=>array('update', 'id'=>$model->unidad_id)),
	array('label'=>'Delete Unidades', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->unidad_id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Unidades', 'url'=>array('admin')),
);
?>

<h1>View Unidades #<?php echo $model->unidad_id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView',array(
    'htmlOptions' => array(
        'class' => 'table table-striped table-condensed table-hover',
    ),
    'data'=>$model,
    'attributes'=>array(
		'unidad_id',
		'nombre',
	),
)); ?>