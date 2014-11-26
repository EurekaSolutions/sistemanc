<?php
/* @var $this EntesOrganosController */
/* @var $model EntesOrganos */
?>

<?php
$this->breadcrumbs=array(
	'Entes Organoses'=>array('index'),
	$model->ente_organo_id,
);

$this->menu=array(
	array('label'=>'List EntesOrganos', 'url'=>array('index')),
	array('label'=>'Create EntesOrganos', 'url'=>array('create')),
	array('label'=>'Update EntesOrganos', 'url'=>array('update', 'id'=>$model->ente_organo_id)),
	array('label'=>'Delete EntesOrganos', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->ente_organo_id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage EntesOrganos', 'url'=>array('admin')),
);
?>

<h1>View EntesOrganos #<?php echo $model->ente_organo_id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView',array(
    'htmlOptions' => array(
        'class' => 'table table-striped table-condensed table-hover',
    ),
    'data'=>$model,
    'attributes'=>array(
		'ente_organo_id',
		'codigo_onapre',
		'nombre',
		'tipo',
	),
)); ?>