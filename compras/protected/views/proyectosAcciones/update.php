<?php
/* @var $this ProyectosAccionesController */
/* @var $model ProyectosAcciones */
?>

<?php
$this->breadcrumbs=array(
	'Proyectos Acciones'=>array('index'),
	$model->proyecto_id=>array('view','id'=>$model->proyecto_id),
	'Update',
);

$this->menu=array(
	array('label'=>'List ProyectosAcciones', 'url'=>array('index')),
	array('label'=>'Create ProyectosAcciones', 'url'=>array('create')),
	array('label'=>'View ProyectosAcciones', 'url'=>array('view', 'id'=>$model->proyecto_id)),
	array('label'=>'Manage ProyectosAcciones', 'url'=>array('admin')),
);
?>

    <h1>Update ProyectosAcciones <?php echo $model->proyecto_id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>