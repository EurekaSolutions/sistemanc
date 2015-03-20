<?php
$this->breadcrumbs=array(
		'Presupuesto Partidases'=>array('index'),
		$model->presupuesto_partida_id,
	);

$this->menu=array(
	array('label'=>'List PresupuestoPartidas','url'=>array('index')),
	array('label'=>'Create PresupuestoPartidas','url'=>array('create')),
	array('label'=>'Update PresupuestoPartidas','url'=>array('update','id'=>$model->presupuesto_partida_id)),
	array('label'=>'Delete PresupuestoPartidas','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->presupuesto_partida_id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage PresupuestoPartidas','url'=>array('admin')),
	);
?>

<h1>View PresupuestoPartidas #<?php echo $model->presupuesto_partida_id; ?></h1>

<?php 
	$this->widget('booster.widgets.TbDetailView',array(
	'data'=>$model,
	'attributes'=>array(
		'presupuesto_partida_id',
		'partida_id',
		'monto_presupuestado',
		'fecha_desde',
		'fecha_hasta',
		'tipo',
		'anho',
		'ente_organo_id',
		'presupuesto_id',
),
)); ?>
