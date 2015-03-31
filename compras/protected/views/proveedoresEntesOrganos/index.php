<?php
$this->breadcrumbs=array(
			'Proveedores Entes Organoses',
		);

$this->menu=array(
	array('label'=>'Create ProveedoresEntesOrganos','url'=>array('create')),
	array('label'=>'Manage ProveedoresEntesOrganos','url'=>array('admin')),
	);
?>

<h1>Proveedores Entes Organoses</h1>

<?php $this->widget('booster.widgets.TbListView',array(
'dataProvider'=>$dataProvider,
'itemView'=>'_view',
)); ?>
