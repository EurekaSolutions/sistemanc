<?php
/* @var $this DivisasController */
/* @var $model Divisas */
?>

<?php
$this->breadcrumbs=array(
	'Divisases'=>array('index'),
	$model->divisa_id=>array('view','id'=>$model->divisa_id),
	'Update',
);

$this->menu=array(
	array('label'=>'List Divisas', 'url'=>array('index')),
	array('label'=>'Create Divisas', 'url'=>array('create')),
	array('label'=>'View Divisas', 'url'=>array('view', 'id'=>$model->divisa_id)),
	array('label'=>'Manage Divisas', 'url'=>array('admin')),
);
?>

    <h1>Update Divisas <?php echo $model->divisa_id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>