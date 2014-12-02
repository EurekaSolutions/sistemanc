<?php
$this->breadcrumbs=array(
			'Entes Organoses',
		);

$this->menu=array(
	array('label'=>'Crear Entes y Organos','url'=>array('create')),
	array('label'=>'Administrar Entes y Organos','url'=>array('admin')),
	);
?>

<h1>Entes Organos</h1>

<?php $this->widget('booster.widgets.TbListView',array(
'dataProvider'=>$dataProvider,
'itemView'=>'_view',
)); ?>
