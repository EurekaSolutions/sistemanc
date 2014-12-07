<?php
$this->breadcrumbs=array(
	'Fuentes Financiamientos'=>array('index'),
	'Create',
);

$this->menu=array(
array('label'=>'List FuentesFinanciamiento','url'=>array('index')),
array('label'=>'Manage FuentesFinanciamiento','url'=>array('admin')),
);
?>

<h1>Create FuentesFinanciamiento</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>