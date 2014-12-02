<?php
$this->breadcrumbs=array(
	'Divisas'=>array('index'),
	'Crear',
);

$this->menu=array(
array('label'=>'Lista de Divisas','url'=>array('index')),
array('label'=>'Administrar Divisas','url'=>array('admin')),
);
?>

<h1>Crear Divisas</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>