<?php
$this->breadcrumbs=array(
	'Proveedores Cuentases'=>array('index'),
	'Create',
);

$this->menu=array(
array('label'=>'List ProveedoresCuentas','url'=>array('index')),
array('label'=>'Manage ProveedoresCuentas','url'=>array('admin')),
);
?>

<h1>Create ProveedoresCuentas</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>