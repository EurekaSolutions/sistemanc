<?php
$this->breadcrumbs=array(
	'Facturas Productoses'=>array('index'),
	'Create',
);

$this->menu=array(
array('label'=>'List FacturasProductos','url'=>array('index')),
array('label'=>'Manage FacturasProductos','url'=>array('admin')),
);
?>

<h1>Create FacturasProductos</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>