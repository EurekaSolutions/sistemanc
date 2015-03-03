<?php
$this->breadcrumbs=array(
			'Ivas',
		);

$this->menu=array(
	array('label'=>'Create Iva','url'=>array('create')),
	array('label'=>'Manage Iva','url'=>array('admin')),
	);
?>

<h1>Ivas</h1>

<?php $this->widget('booster.widgets.TbListView',array(
'dataProvider'=>$dataProvider,
'itemView'=>'_view',
)); ?>
