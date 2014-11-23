<?php
/* @var $this UsuariosController */
/* @var $model Usuarios */
?>

<?php
$this->breadcrumbs=array(
	'Usuarioses'=>array('index'),
	$model->usuario_id=>array('view','id'=>$model->usuario_id),
	'Update',
);

$this->menu=array(
	array('label'=>'List Usuarios', 'url'=>array('index')),
	array('label'=>'Create Usuarios', 'url'=>array('create')),
	array('label'=>'View Usuarios', 'url'=>array('view', 'id'=>$model->usuario_id)),
	array('label'=>'Manage Usuarios', 'url'=>array('admin')),
);
?>

    <h1>Update Usuarios <?php echo $model->usuario_id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>