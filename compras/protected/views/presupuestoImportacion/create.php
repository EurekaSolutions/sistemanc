<?php
/* @var $this PresupuestoImportacionController */
/* @var $model PresupuestoImportacion */
?>

<?php
$this->breadcrumbs=array(
	'Presupuesto Importacions'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List PresupuestoImportacion', 'url'=>array('index')),
	array('label'=>'Manage PresupuestoImportacion', 'url'=>array('admin')),
);
?>

<h1>Create PresupuestoImportacion</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>