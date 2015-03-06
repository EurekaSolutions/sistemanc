<?php
$this->breadcrumbs=array(
			'Facturas Productoses',
		);

$this->menu=array(
	array('label'=>'Create FacturasProductos','url'=>array('create')),
	array('label'=>'Manage FacturasProductos','url'=>array('admin')),
	);
?>

<h1>Facturas Productoses</h1>

<?php $this->widget('booster.widgets.TbListView',array(
'dataProvider'=>$dataProvider,
'itemView'=>'_view',
)); ?>
