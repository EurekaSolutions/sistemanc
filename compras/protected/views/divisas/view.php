<?php
$this->breadcrumbs=array(
		'Divisas'=>array('index'),
		$model->divisa_id,
	);

$this->menu=array(
	array('label'=>'Lista de Divisas','url'=>array('index')),
	array('label'=>'Crear Divisas','url'=>array('create')),
	array('label'=>'Actualizar Divisas','url'=>array('update','id'=>$model->divisa_id)),
	array('label'=>'Eliminar Divisas','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->divisa_id),'confirm'=>'Estás seguro que quieres eliminar este elemento?')),
	array('label'=>'Administrar Divisas','url'=>array('admin')),
	);
?>

<h1>View Divisas #<?php echo $model->divisa_id; ?></h1>

<?php 
	$this->widget('booster.widgets.TbDetailView',array(
	'data'=>$model,
	'attributes'=>array(
		'divisa_id',
		'abreviatura',
		'simbolo',
		'nombre',
),
)); ?>
