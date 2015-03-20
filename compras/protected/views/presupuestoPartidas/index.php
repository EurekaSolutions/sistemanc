<?php
$this->breadcrumbs=array(
			'Presupuesto Partidases',
		);

$this->menu=array(
	array('label'=>'Create PresupuestoPartidas','url'=>array('create')),
	array('label'=>'Manage PresupuestoPartidas','url'=>array('admin')),
	);
?>

<h1>Presupuesto Partidases</h1>

<?php $this->widget('booster.widgets.TbListView',array(
'dataProvider'=>$dataProvider,
'itemView'=>'_view',
)); ?>
