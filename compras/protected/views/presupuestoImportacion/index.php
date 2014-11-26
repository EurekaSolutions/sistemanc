<?php
/* @var $this PresupuestoImportacionController */
/* @var $dataProvider CActiveDataProvider */
?>

<?php
$this->breadcrumbs=array(
	'Presupuesto Importacions',
);

$this->menu=array(
	array('label'=>'Create PresupuestoImportacion','url'=>array('create')),
	array('label'=>'Manage PresupuestoImportacion','url'=>array('admin')),
);
?>

<h1>Presupuesto Importacions</h1>

<?php $this->widget('bootstrap.widgets.TbListView',array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>