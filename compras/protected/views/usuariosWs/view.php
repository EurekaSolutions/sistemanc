<?php
$this->breadcrumbs=array(
		'Usuarios Ws'=>array('index'),
		$model->id,
	);

$this->menu=array(
	array('label'=>'List UsuariosWs','url'=>array('index')),
	array('label'=>'Create UsuariosWs','url'=>array('create')),
	array('label'=>'Update UsuariosWs','url'=>array('update','id'=>$model->id)),
	array('label'=>'Delete UsuariosWs','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage UsuariosWs','url'=>array('admin')),
	);
?>

<h1>View UsuariosWs #<?php echo $model->id; ?></h1>

<?php 
	$this->widget('booster.widgets.TbDetailView',array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'institucion',
		'correo',
		'usuario',
		'clave',
		'session',
		'token',
		'fecha_creacion',
		'fecha_actualizacion',
),
)); ?>
