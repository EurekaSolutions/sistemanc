<?php
$this->breadcrumbs=array(
		'Proveedor Motivos'=>array('index'),
		$model->id,
	);
if(Yii::app()->user->checkAccess('admin'))
{
$this->menu=array(
	array('label'=>'List ProveedorMotivo','url'=>array('index')),
	array('label'=>'Create ProveedorMotivo','url'=>array('create')),
	array('label'=>'Update ProveedorMotivo','url'=>array('update','id'=>$model->id)),
	array('label'=>'Delete ProveedorMotivo','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage ProveedorMotivo','url'=>array('admin')),
	);
}
?>

<h1>Ver Proveedor Motivo</h1>

<?php 
	$this->widget('booster.widgets.TbDetailView',array(
	'data'=>$model,
	'attributes'=>array(
		//'id',
		//'proveedor_id',
		//'ente_organo_id',
		'motivo',
),
)); ?>
