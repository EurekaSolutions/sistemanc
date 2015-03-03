<?php
$this->breadcrumbs=array(
			'Facturases',
		);

$this->menu=array(
	array('label'=>'Create Facturas','url'=>array('create')),
	array('label'=>'Manage Facturas','url'=>array('admin')),
	);
?>

<h1>Facturases</h1>

<?php $this->widget('booster.widgets.TbListView',array(
'dataProvider'=>$dataProvider,
'itemView'=>'_view',
)); ?>
