<?php
/* @var $this ActiverecordlogController */
/* @var $dataProvider CActiveDataProvider */
?>

<?php
$this->breadcrumbs=array(
	'Activerecordlogs',
);

$this->menu=array(
	array('label'=>'Create Activerecordlog','url'=>array('create')),
	array('label'=>'Manage Activerecordlog','url'=>array('admin')),
);
?>

<h1>Activerecordlogs</h1>

<?php $this->widget('bootstrap.widgets.TbListView',array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>