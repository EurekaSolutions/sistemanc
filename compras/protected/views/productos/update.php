<?php
/* @var $this ProductosController */
/* @var $model Productos */
?>

<?php
$this->breadcrumbs=array(
	'Productoses'=>array('index'),
	$model->producto_id=>array('view','id'=>$model->producto_id),
	'Update',
);

$this->menu=array(
	array('label'=>'List Productos', 'url'=>array('index')),
	array('label'=>'Create Productos', 'url'=>array('create')),
	array('label'=>'View Productos', 'url'=>array('view', 'id'=>$model->producto_id)),
	array('label'=>'Manage Productos', 'url'=>array('admin')),
);
?>

    <h1>Update Productos <?php echo $model->producto_id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>