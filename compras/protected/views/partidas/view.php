<?php
$this->breadcrumbs=array(
		'Partidases'=>array('index'),
		$model->partida_id,
	);

$this->menu=array(
	array('label'=>'List Partidas','url'=>array('index')),
	array('label'=>'Create Partidas','url'=>array('create')),
	array('label'=>'Update Partidas','url'=>array('update','id'=>$model->partida_id)),
	array('label'=>'Delete Partidas','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->partida_id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Partidas','url'=>array('admin')),
	);
?>

<h1>View Partidas #<?php echo $model->partida_id; ?></h1>

<?php 
	$this->widget('booster.widgets.TbDetailView',array(
	'data'=>$model,
	'attributes'=>array(
		'partida_id',
		'p1',
		'p2',
		'p3',
		'p4',
		'nombre',
		'habilitada',
),
)); ?>
