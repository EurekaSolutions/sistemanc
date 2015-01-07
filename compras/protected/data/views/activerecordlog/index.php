<?php
$this->breadcrumbs=array(
			'Activerecordlogs',
		);

$this->menu=array(
	array('label'=>'Create Activerecordlog','url'=>array('create')),
	array('label'=>'Manage Activerecordlog','url'=>array('admin')),
	);
?>

<h1>Activerecordlogs</h1>

<?php $this->widget('booster.widgets.TbListView',array(
'dataProvider'=>$dataProvider,
'itemView'=>'_view',
)); ?>
