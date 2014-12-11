<?php
$this->breadcrumbs=array(
	'Partida Productoses'=>array('index'),
	'Create',
);

$this->menu=array(
array('label'=>'List PartidaProductos','url'=>array('index')),
array('label'=>'Manage PartidaProductos','url'=>array('admin')),
);
?>

<h1>Create PartidaProductos</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model, 'especificas_lista' => $especificas_lista, 'productos' => $productos, 'operacion' => $operacion)); ?>