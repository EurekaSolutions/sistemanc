<?php
/* @var $this EntesOrganosController */
/* @var $dataProvider CActiveDataProvider */
?>

<?php
$this->breadcrumbs=array(
	'Entes Organoses',
);

$this->menu=array(
	array('label'=>'Create EntesOrganos','url'=>array('create')),
	array('label'=>'Manage EntesOrganos','url'=>array('admin')),
);
?>

<h1>Entes Organoses</h1>

<?php $this->widget('bootstrap.widgets.TbListView',array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>