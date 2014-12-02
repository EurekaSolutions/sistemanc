<?php
$this->breadcrumbs=array(
	'Unidades'=>array('index'),
	'Create',
);

$this->menu=array(
array('label'=>'List Unidades','url'=>array('index')),
array('label'=>'Manage Unidades','url'=>array('admin')),
);
?>

<h1>Create Unidades</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>