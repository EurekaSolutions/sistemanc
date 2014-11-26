<?php
/* @var $this UnidadesController */
/* @var $model Unidades */
?>

<?php
$this->breadcrumbs=array(
	'Unidades'=>array('index'),
	$model->unidad_id=>array('view','id'=>$model->unidad_id),
	'Update',
);

$this->menu=array(
	array('label'=>'List Unidades', 'url'=>array('index')),
	array('label'=>'Create Unidades', 'url'=>array('create')),
	array('label'=>'View Unidades', 'url'=>array('view', 'id'=>$model->unidad_id)),
	array('label'=>'Manage Unidades', 'url'=>array('admin')),
);
?>

    <h1>Update Unidades <?php echo $model->unidad_id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>