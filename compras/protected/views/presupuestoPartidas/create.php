<?php
$this->breadcrumbs=array(
	'Presupuesto Partidases'=>array('index'),
	'Create',
);

$this->menu=array(
array('label'=>'List PresupuestoPartidas','url'=>array('index')),
array('label'=>'Manage PresupuestoPartidas','url'=>array('admin')),
);
?>

<h1>Create PresupuestoPartidas</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>