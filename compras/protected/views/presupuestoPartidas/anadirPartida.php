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
<h1>Añadir montos Presupuesto Partidas</h1>
<?php echo $this->renderPartial('_formAnadir', array('model'=>$model, 'proyectoSel'=>$proyectoSel)); ?>
</div>