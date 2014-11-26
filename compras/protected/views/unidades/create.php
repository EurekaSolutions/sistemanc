<?php
/* @var $this UnidadesController */
/* @var $model Unidades */
?>

<?php
$this->breadcrumbs=array(
	'Unidades'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Unidades', 'url'=>array('index')),
	array('label'=>'Manage Unidades', 'url'=>array('admin')),
);
?>

<h1>Create Unidades</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>