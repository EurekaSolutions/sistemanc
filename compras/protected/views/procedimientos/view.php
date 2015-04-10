<?php
$this->breadcrumbs=array(
		'Procedimientoses'=>array('index'),
		$model->id,
	);

$this->menu=array(
	//array('label'=>'Listar Procedimientos','url'=>array('index')),
	array('label'=>'Registrar Procedimiento','url'=>array('create')),
	array('label'=>'Actualizar Procedimiento','url'=>array('update','id'=>$model->id)),
	array('label'=>'Eliminar Procedimiento','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Administrar Procedimientos','url'=>array('admin')),
	);
?>

<h1>Ver Procedimiento<?php //echo $model->id; ?></h1>

<?php 
	$this->widget('booster.widgets.TbDetailView',array(
	'data'=>$model,
	'attributes'=>array(
		//'id',
		'num_contrato',
		'anho',
		//'fecha',
		'tipo',
		//'ente_organo_id',
),
)); ?>
