<?php
$this->breadcrumbs=array(
	'Activerecordlogs'=>array('index'),
	'Create',
);

$this->menu=array(
array('label'=>'List Activerecordlog','url'=>array('index')),
array('label'=>'Manage Activerecordlog','url'=>array('admin')),
);
?>

<h1>Create Activerecordlog</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>