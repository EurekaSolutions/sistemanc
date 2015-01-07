<?php
$this->breadcrumbs=array(
	'Proyectos Acciones'=>array('index'),
	'Create',
);

$this->menu=array(
array('label'=>'Lista de Proyectos y Acciones','url'=>array('index')),
array('label'=>'Administrar Proyectos y Acciones','url'=>array('admin')),
);
?>

<h1>Crear un Proyecto o Acción</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>