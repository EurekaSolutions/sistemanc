<?php
$this->breadcrumbs=array(
			'Proyectos Acciones',
		);

$this->menu=array(
	array('label'=>'Crear ProyectosAcciones','url'=>array('create')),
	array('label'=>'Administrar ProyectosAcciones','url'=>array('admin')),
	);
?>

<h1>Proyectos y Acciones</h1>

<?php $this->widget('booster.widgets.TbListView',array(
'dataProvider'=>$dataProvider,
'itemView'=>'_view',
)); ?>
