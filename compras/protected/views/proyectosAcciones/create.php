<?php
/* @var $this ProyectosAccionesController */
/* @var $model ProyectosAcciones */
?>

<?php
$this->breadcrumbs=array(
	'Proyectos Acciones'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List ProyectosAcciones', 'url'=>array('index')),
	array('label'=>'Manage ProyectosAcciones', 'url'=>array('admin')),
);
?>

<h1>Create ProyectosAcciones</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>