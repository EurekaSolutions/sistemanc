<?php
$this->breadcrumbs=array(
	'Entes Organoses'=>array('index'),
	'Create',
);

$this->menu=array(
array('label'=>'Lista de Entes y Organos','url'=>array('index')),
array('label'=>'Administrar Entes y Organos','url'=>array('admin')),
);
?>

<h1>Crear Entes y Organos</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>