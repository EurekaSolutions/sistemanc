<?php
/* @var $this ProyectosAccionesController */
/* @var $dataProvider CActiveDataProvider */
?>

<?php
$this->breadcrumbs=array(
	'Proyectos Acciones',
);

$this->menu=array(
	array('label'=>'Create ProyectosAcciones','url'=>array('create')),
	array('label'=>'Manage ProyectosAcciones','url'=>array('admin')),
);
?>

<h1>Proyectos Acciones</h1>

<?php $this->widget('bootstrap.widgets.TbListView',array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>