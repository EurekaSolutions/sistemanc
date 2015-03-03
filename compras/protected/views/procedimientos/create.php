<?php
$this->breadcrumbs=array(
	'Procedimientoses'=>array('index'),
	'Create',
);

$this->menu=array(
array('label'=>'List Procedimientos','url'=>array('index')),
array('label'=>'Manage Procedimientos','url'=>array('admin')),
);
?>

<h1>Create Procedimientos</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>