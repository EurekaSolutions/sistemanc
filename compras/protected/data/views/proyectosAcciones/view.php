<?php
$this->breadcrumbs=array(
		'Proyectos Acciones'=>array('index'),
		$model->proyecto_id,
	);

$this->menu=array(
	array('label'=>'List Proyectos y Acciones','url'=>array('index')),
	array('label'=>'Create Proyectos y Acciones','url'=>array('create')),
	array('label'=>'Update Proyectos y Acciones','url'=>array('update','id'=>$model->proyecto_id)),
	array('label'=>'Delete Proyectos y Acciones','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->proyecto_id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Proyectos y Acciones','url'=>array('admin')),
	);
?>

<h1>Ver Proyectos y Acciones #<?php echo $model->proyecto_id; ?></h1>

<?php 
	$this->widget('booster.widgets.TbDetailView',array(
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
