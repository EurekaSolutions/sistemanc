<?php
/* @var $this PresupuestoImportacionController */
/* @var $dataProvider CActiveDataProvider */
?>

<?php
$this->breadcrumbs=array(
	'Presupuesto Importaciones',
);

$this->menu=array(
	array('label'=>'Crear PresupuestoImportacion','url'=>array('create')),
	array('label'=>'Administrar PresupuestoImportacion','url'=>array('admin')),
);
?>

<h1>Presupuesto Importacions</h1>

<?php $this->widget('booster.widgets.TbListView',array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>