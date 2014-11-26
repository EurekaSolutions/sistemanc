<?php
/* @var $this EntesOrganosController */
/* @var $model EntesOrganos */
?>

<?php
$this->breadcrumbs=array(
	'Entes Organoses'=>array('index'),
	$model->ente_organo_id=>array('view','id'=>$model->ente_organo_id),
	'Update',
);

$this->menu=array(
	array('label'=>'List EntesOrganos', 'url'=>array('index')),
	array('label'=>'Create EntesOrganos', 'url'=>array('create')),
	array('label'=>'View EntesOrganos', 'url'=>array('view', 'id'=>$model->ente_organo_id)),
	array('label'=>'Manage EntesOrganos', 'url'=>array('admin')),
);
?>

    <h1>Update EntesOrganos <?php echo $model->ente_organo_id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>