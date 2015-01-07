<?php
$this->breadcrumbs=array(
			'Divisas',
		);

$this->menu=array(
	array('label'=>'Crear Divisas','url'=>array('create')),
	array('label'=>'Administrar Divisas','url'=>array('admin')),
	);
?>

<h1>Divisas</h1>

<?php $this->widget('booster.widgets.TbListView',array(
'dataProvider'=>$dataProvider,
'itemView'=>'_view',
)); ?>
