<?php
$this->breadcrumbs=array(
			'Partida Productoses',
		);

$this->menu=array(
	array('label'=>'Create PartidaProductos','url'=>array('create')),
	array('label'=>'Manage PartidaProductos','url'=>array('admin')),
	);
?>

<h1>Partida Productoses</h1>

<?php $this->widget('booster.widgets.TbListView',array(
'dataProvider'=>$dataProvider,
'itemView'=>'_view',
)); ?>
