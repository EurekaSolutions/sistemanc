<?php
$this->breadcrumbs=array(
	'Proveedores Objetoses'=>array('index'),
	'Create',
);

$this->menu=array(
array('label'=>'List ProveedoresObjetos','url'=>array('index')),
array('label'=>'Manage ProveedoresObjetos','url'=>array('admin')),
);
?>

<h1>Create ProveedoresObjetos</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>