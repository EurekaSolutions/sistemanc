<?php
$this->breadcrumbs=array(
			'Presupuesto Productoses',
		);

$this->menu=array(
	array('label'=>'Create PresupuestoProductos','url'=>array('create')),
	array('label'=>'Manage PresupuestoProductos','url'=>array('admin')),
	);
?>

<h1>Presupuesto Productoses</h1>

<?php $this->widget('booster.widgets.TbListView',array(
'dataProvider'=>$dataProvider,
'itemView'=>'_view',
)); ?>
