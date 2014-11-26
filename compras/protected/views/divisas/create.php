<?php
/* @var $this DivisasController */
/* @var $model Divisas */
?>

<?php
$this->breadcrumbs=array(
	'Divisases'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Divisas', 'url'=>array('index')),
	array('label'=>'Manage Divisas', 'url'=>array('admin')),
);
?>

<h1>Create Divisas</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>