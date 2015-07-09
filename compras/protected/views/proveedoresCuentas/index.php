<?php
$this->breadcrumbs=array(
			'Proveedores Cuentas',
		);

$this->menu=array(
	array('label'=>'Create ProveedoresCuentas','url'=>array('create')),
	array('label'=>'Manage ProveedoresCuentas','url'=>array('admin')),
	);
?>

<h1>Proveedores Cuentas</h1>

<?php $this->widget('booster.widgets.TbListView',array(
'dataProvider'=>$dataProvider,
'itemView'=>'_view',
)); ?>
