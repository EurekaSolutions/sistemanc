<?php
$this->breadcrumbs=array(
			'Fuentes Financiamientos',
		);

$this->menu=array(
	array('label'=>'Crear Fuentes Financiamiento','url'=>array('create')),
	array('label'=>'Administrar fuentes financiamiento','url'=>array('admin')),
	);
?>

<h1>Fuentes financiamientos</h1>

<?php $this->widget('booster.widgets.TbListView',array(
'dataProvider'=>$dataProvider,
'itemView'=>'_view',
)); ?>
