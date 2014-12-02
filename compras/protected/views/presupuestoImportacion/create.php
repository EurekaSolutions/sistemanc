<?php
/* @var $this PresupuestoImportacionController */
/* @var $model PresupuestoImportacion */
?>

<?php
$this->breadcrumbs=array(
	'Presupuesto Importaciones'=>array('index'),
	'Crear',
);

$this->menu=array(
	array('label'=>'Lista de PresupuestoImportacion', 'url'=>array('index')),
	array('label'=>'Administrar PresupuestoImportacion', 'url'=>array('admin')),
);
?>

<h1>Crear PresupuestoImportacion</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>