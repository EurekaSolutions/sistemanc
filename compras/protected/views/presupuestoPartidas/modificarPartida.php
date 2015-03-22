<?php
/*$this->breadcrumbs=array(
	'Presupuesto Partidases'=>array('index'),
	'Create',
);

$this->menu=array(
array('label'=>'List PresupuestoPartidas','url'=>array('index')),
array('label'=>'Manage PresupuestoPartidas','url'=>array('admin')),
);*/
?>
<div id='form'>
<h1>Modificar Presupuesto Partidas</h1>


<?php echo $this->renderPartial('_formModificar', array('model'=>$model, )); ?>

</div>