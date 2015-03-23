<?php
$this->breadcrumbs=array(
	'Transferir Presupuesto Partidas'=>array('modificarPartida'),
	'Transferir',
);
/*
$this->menu=array(
array('label'=>'List PresupuestoPartidas','url'=>array('index')),
array('label'=>'Manage PresupuestoPartidas','url'=>array('admin')),
);*/
?>
<div id='form'>
<h1>Transferir montos Presupuesto Partidas</h1>


<?php echo $this->renderPartial('_formModificar', array('model'=>$model, 'proyectoSel'=>$proyectoSel)); ?>

</div>