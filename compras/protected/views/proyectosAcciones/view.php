<?php
/* @var $this ProyectosAccionesController */
/* @var $model ProyectosAcciones */
?>

<?php
$this->breadcrumbs=array(
	'Proyectos Acciones'=>array('index'),
	$model->proyecto_id,
);

$this->menu=array(
	array('label'=>'List ProyectosAcciones', 'url'=>array('index')),
	array('label'=>'Create ProyectosAcciones', 'url'=>array('create')),
	array('label'=>'Update ProyectosAcciones', 'url'=>array('update', 'id'=>$model->proyecto_id)),
	array('label'=>'Delete ProyectosAcciones', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->proyecto_id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage ProyectosAcciones', 'url'=>array('admin')),
);
?>

<h1>View ProyectosAcciones #<?php echo $model->proyecto_id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView',array(
    'htmlOptions' => array(
        'class' => 'table table-striped table-condensed table-hover',
    ),
    'data'=>$model,
    'attributes'=>array(
		'proyecto_id',
		'nombre',
		'monto',
		'codigo',
		'ente_organo_id',
		'tipo',
		'fecha',
	),
)); ?>