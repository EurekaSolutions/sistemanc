<?php
/* @var $this DivisasController */
/* @var $dataProvider CActiveDataProvider */
?>

<?php
$this->breadcrumbs=array(
	'Divisases',
);

$this->menu=array(
	array('label'=>'Create Divisas','url'=>array('create')),
	array('label'=>'Manage Divisas','url'=>array('admin')),
);
?>

<h1>Divisases</h1>

<?php $this->widget('bootstrap.widgets.TbListView',array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>