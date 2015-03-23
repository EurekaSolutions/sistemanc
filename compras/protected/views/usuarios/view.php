<?php
$this->breadcrumbs=array(
	'Usuarios'=>array('index'),
	$model->usuario_id,
);

$this->menu=array(
//array('label'=>'Lista de Usuarios','url'=>array('index')),
//array('label'=>'Crear Usuarios','url'=>array('create')),
//array('label'=>'Actualizar Usuarios','url'=>array('update','id'=>$model->usuario_id)),
//array('label'=>'Eliminar Usuarios','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->usuario_id),'confirm'=>'Are you sure you want to delete this item?')),
//array('label'=>'Administrar Usuarios','url'=>array('admin')),
);
?>

<h1>Ver Usuarios #<?php echo $model->usuario; ?></h1>

<?php $this->widget('booster.widgets.TbDetailView',array(
'data'=>$model,
'attributes'=>array(
		//'usuario_id',
		'codigo_onapre',
		'usuario',
		//'contrasena',
		'correo',
		'creado_el',
		'actualizado_el',
		array('name'=>'esta_activo',  'type'=>'text', 'value'=>$model->esta_activo?'Si':'No'),
		array('name'=>'esta_deshabilitado',  'type'=>'text', 'value'=>$model->esta_deshabilitado?'Si':'No'),
		array('name'=>'correo_verificado',  'type'=>'text', 'value'=>$model->correo_verificado?'Si':'No'),
		//'llave_activacion',
		'ultima_visita_el',
),
)); ?>
