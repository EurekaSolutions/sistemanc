<?php
$this->breadcrumbs=array(
			'Procedimientoses',
		);

$this->menu=array(
	array('label'=>'Create Procedimientos','url'=>array('create')),
	array('label'=>'Manage Procedimientos','url'=>array('admin')),
	);
?>

<h1>Procedimientoses</h1>

<?php $this->widget('booster.widgets.TbListView',array(
'dataProvider'=>$dataProvider,
'itemView'=>'_view',
)); ?>
