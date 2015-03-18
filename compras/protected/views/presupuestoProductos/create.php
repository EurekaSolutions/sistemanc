<?php
$this->breadcrumbs=array(
	'Presupuesto Productoses'=>array('index'),
	'Create',
);

$this->menu=array(
array('label'=>'List PresupuestoProductos','url'=>array('index')),
array('label'=>'Manage PresupuestoProductos','url'=>array('admin')),
);
?>

<h1>Create PresupuestoProductos</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>