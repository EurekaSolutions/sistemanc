<?php
$this->breadcrumbs=array(
	'Proveedores'=>array('index'),
	'Create',
);

$this->menu=array(
//array('label'=>'Lista de Proveedores','url'=>array('index')),
array('label'=>'Gestionar Proveedores','url'=>array('admin')),
);
?>

<h1>Registrar Proveedor</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>