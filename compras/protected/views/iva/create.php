<?php
$this->breadcrumbs=array(
	'Ivas'=>array('index'),
	'Create',
);

$this->menu=array(
//array('label'=>'List Iva','url'=>array('index')),
array('label'=>'Gestionar Iva','url'=>array('admin')),
);
?>

<h1>Crear Iva</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>