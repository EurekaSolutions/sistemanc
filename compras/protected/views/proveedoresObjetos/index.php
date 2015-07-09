<?php
$this->breadcrumbs=array(
			'Proveedores Objetoses',
		);

$this->menu=array(
	array('label'=>'Create ProveedoresObjetos','url'=>array('create')),
	array('label'=>'Manage ProveedoresObjetos','url'=>array('admin')),
	);
?>

<h1>Proveedores Objetoses</h1>

<?php $this->widget('booster.widgets.TbListView',array(
'dataProvider'=>$dataProvider,
'itemView'=>'_view',
)); ?>
