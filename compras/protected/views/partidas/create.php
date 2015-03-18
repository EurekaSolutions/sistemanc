<?php
$this->breadcrumbs=array(
	'Partidases'=>array('index'),
	'Create',
);

$this->menu=array(
array('label'=>'List Partidas','url'=>array('index')),
array('label'=>'Manage Partidas','url'=>array('admin')),
);
?>

<h1>Create Partidas</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>