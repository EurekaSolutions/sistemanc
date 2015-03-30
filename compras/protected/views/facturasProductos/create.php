<?php
$this->breadcrumbs=array(
	'Facturas Productos'=>array('index'),
	'Crear',
);

$this->menu=array(
//array('label'=>'Listar Productos de facturas','url'=>array('index')),
array('label'=>'Administrar Productos en facturas','url'=>array('admin')),
);
?>

<h1>Asociar Productos a Facturas</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model, 'proyectoSel'=>$proyectoSel)); ?>