<?php
$this->breadcrumbs=array(
		'Fuentes Financiamientos'=>array('index'),
		$model->fuente_financiamiento_id,
	);

$this->menu=array(
	array('label'=>'List FuentesFinanciamiento','url'=>array('index')),
	array('label'=>'Create FuentesFinanciamiento','url'=>array('create')),
	array('label'=>'Update FuentesFinanciamiento','url'=>array('update','id'=>$model->fuente_financiamiento_id)),
	array('label'=>'Delete FuentesFinanciamiento','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->fuente_financiamiento_id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage FuentesFinanciamiento','url'=>array('admin')),
	);
?>

<h1>View FuentesFinanciamiento #<?php echo $model->fuente_financiamiento_id; ?></h1>

<?php 
	$this->widget('booster.widgets.TbDetailView',array(
	'data'=>$model,
	'attributes'=>array(
		'fuente_financiamiento_id',
		'nombre',
		'activo',
),
)); ?>
