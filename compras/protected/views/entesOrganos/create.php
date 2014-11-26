<?php
/* @var $this EntesOrganosController */
/* @var $model EntesOrganos */
?>

<?php
$this->breadcrumbs=array(
	'Entes Organoses'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List EntesOrganos', 'url'=>array('index')),
	array('label'=>'Manage EntesOrganos', 'url'=>array('admin')),
);
?>

<h1>Create EntesOrganos</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>