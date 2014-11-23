<?php
/* @var $this UsuariosController */
/* @var $model Usuarios */
?>

<?php
$this->breadcrumbs=array(
	'Usuarios'=>array('index'),
	'Registro',
);

$this->menu=array(
	array('label'=>'List Usuarios', 'url'=>array('index')),
	array('label'=>'Manage Usuarios', 'url'=>array('admin')),
);
?>

<h1>Registro</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>