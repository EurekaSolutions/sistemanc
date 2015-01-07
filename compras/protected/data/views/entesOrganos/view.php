<?php
$this->breadcrumbs=array(
		'Entes Organoses'=>array('index'),
		$model->ente_organo_id,
	);

$this->menu=array(
	array('label'=>'Lista de Entes y Organos','url'=>array('index')),
	array('label'=>'Crear Entes y Organos','url'=>array('create')),
	array('label'=>'Actualizar Entes y Organos','url'=>array('update','id'=>$model->ente_organo_id)),
	array('label'=>'Eliminar Entes y Organos','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->ente_organo_id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Administrar Entes y Organos','url'=>array('admin')),
	);
?>

<h1>Ver Entes y Organos #<?php echo $model->ente_organo_id; ?></h1>

<?php 
	$this->widget('booster.widgets.TbDetailView',array(
	'data'=>$model,
	'attributes'=>array(
		'ente_organo_id',
		'codigo_onapre',
		'nombre',
		'tipo',
),
)); ?>
