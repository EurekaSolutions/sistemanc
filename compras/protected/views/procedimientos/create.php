<?php
$this->breadcrumbs=array(
	'Procedimientos'=>array('index'),
	'Crear',
);

$this->menu=array(
//array('label'=>'Lista de Procedimientos','url'=>array('index')),
array('label'=>'Administrar Procedimientos','url'=>array('admin')),
);
?>

<h1>Registrar Procedimiento</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>