<?php
$this->breadcrumbs=array(
			'Facturas Productos',
		);

$this->menu=array(
	array('label'=>'Cargar Productos a factura','url'=>array('create')),
	array('label'=>'Administrar Productos por factura','url'=>array('admin')),
	);
?>

<h1>Productos de facturas</h1>

<?php $this->widget('booster.widgets.TbListView',array(
'dataProvider'=>$dataProvider,
'itemView'=>'_view',
)); ?>
