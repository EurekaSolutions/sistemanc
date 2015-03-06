<?php
$this->breadcrumbs=array(
	'Facturases'=>array('index'),
	'Create',
);

$this->menu=array(
//array('label'=>'Lista de Facturas','url'=>array('index')),
array('label'=>'Administrar Facturas','url'=>array('admin')),
);
?>

<h1>Registrar Factura</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>