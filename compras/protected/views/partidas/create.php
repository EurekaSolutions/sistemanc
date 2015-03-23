<?php
$this->breadcrumbs=array(
	'Partidases'=>array('index'),
	'Create',
);

$this->menu=array(
//array('label'=>'List Partidas','url'=>array('index')),
array('label'=>'Gestionar Partidas','url'=>array('admin')),
);
?>

<h1>Crear Partidas</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>