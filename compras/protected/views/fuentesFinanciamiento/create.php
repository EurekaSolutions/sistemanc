<?php
$this->breadcrumbs=array(
	'Fuentes Financiamientos'=>array('index'),
	'Crear',
);

$this->menu=array(
array('label'=>'Listar fuentes financiamiento','url'=>array('index')),
array('label'=>'Administrar fuentes financiamiento','url'=>array('admin')),
);
?>

<h1>Crear fuentes de financiamiento</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>