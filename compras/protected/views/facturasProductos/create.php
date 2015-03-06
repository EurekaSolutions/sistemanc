<?php
$this->breadcrumbs=array(
	'Facturas Productos'=>array('index'),
	'Create',
);

$this->menu=array(
array('label'=>'Listar Productos por factura','url'=>array('index')),
array('label'=>'Administrar Productos por factura','url'=>array('admin')),
);
?>

<h1>Agregar productos a factura</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>