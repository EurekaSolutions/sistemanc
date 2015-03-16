<?php
$this->breadcrumbs=array(
			'Fuentes Financiamientos',
		);

$this->menu=array(
	array('label'=>'Crear Fuentes de Financiamiento','url'=>array('create')),
	array('label'=>'Administrar Fuentes de Financiamiento','url'=>array('admin')),
	);
?>

<h1>Fuentes Financiamientos</h1>

<?php $this->widget('booster.widgets.TbListView',array(
'dataProvider'=>$dataProvider,
'itemView'=>'_view',
)); ?>
