<?php
$this->breadcrumbs=array(
	'Usuarios'=>array('index'),
	'Create',
);

$this->menu=array(
array('label'=>'Lista de Usuarios','url'=>array('index')),
array('label'=>'Administrar Usuarios','url'=>array('admin')),
);
?>

<h1>Crear Usuarios</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>