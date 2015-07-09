<?php
$this->breadcrumbs=array(
			'Proveedores Extranjeroses',
		);

$this->menu=array(
	array('label'=>'Create ProveedoresExtranjeros','url'=>array('create')),
	array('label'=>'Manage ProveedoresExtranjeros','url'=>array('admin')),
	);
?>

<h1>Proveedores Extranjeros</h1>

<?php $this->widget('booster.widgets.TbListView',array(
'dataProvider'=>$dataProvider,
'itemView'=>'_view',
)); ?>
