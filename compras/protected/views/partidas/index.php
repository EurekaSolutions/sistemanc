<?php
$this->breadcrumbs=array(
			'Partidases',
		);

$this->menu=array(
	array('label'=>'Create Partidas','url'=>array('create')),
	array('label'=>'Manage Partidas','url'=>array('admin')),
	);
?>

<h1>Partidases</h1>

<?php $this->widget('booster.widgets.TbListView',array(
'dataProvider'=>$dataProvider,
'itemView'=>'_view',
)); ?>
