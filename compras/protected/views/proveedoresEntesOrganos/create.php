<?php
$this->breadcrumbs=array(
	'Proveedores Entes Organoses'=>array('index'),
	'Create',
);

$this->menu=array(
array('label'=>'List ProveedoresEntesOrganos','url'=>array('index')),
array('label'=>'Manage ProveedoresEntesOrganos','url'=>array('admin')),
);
?>

<h1>Create ProveedoresEntesOrganos</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>