<?php
$this->breadcrumbs=array(
			'Fuentes Financiamientos',
		);

$this->menu=array(
	array('label'=>'Create FuentesFinanciamiento','url'=>array('create')),
	array('label'=>'Manage FuentesFinanciamiento','url'=>array('admin')),
	);
?>

<h1>Fuentes Financiamientos</h1>

<?php $this->widget('booster.widgets.TbListView',array(
'dataProvider'=>$dataProvider,
'itemView'=>'_view',
)); ?>
