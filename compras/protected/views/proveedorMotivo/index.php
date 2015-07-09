<?php
$this->breadcrumbs=array(
			'Proveedor Motivos',
		);

$this->menu=array(
	array('label'=>'Create ProveedorMotivo','url'=>array('create')),
	array('label'=>'Manage ProveedorMotivo','url'=>array('admin')),
	);
?>

<h1>Proveedor Motivos</h1>

<?php $this->widget('booster.widgets.TbListView',array(
'dataProvider'=>$dataProvider,
'itemView'=>'_view',
)); ?>
