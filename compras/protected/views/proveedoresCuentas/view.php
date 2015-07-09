<?php
$this->breadcrumbs=array(
		'Proveedores Cuentases'=>array('index'),
		$model->id,
	);

if(Yii::app()->user->checkAccess('admin'))
{
$this->menu=array(
	array('label'=>'List ProveedoresCuentas','url'=>array('index')),
	array('label'=>'Create ProveedoresCuentas','url'=>array('create')),
	array('label'=>'Update ProveedoresCuentas','url'=>array('update','id'=>$model->id)),
	array('label'=>'Delete ProveedoresCuentas','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage ProveedoresCuentas','url'=>array('admin')),
	);
}
?>

<h1>View ProveedoresCuentas #<?php echo $model->id; ?></h1>

<?php 
	$this->widget('booster.widgets.TbDetailView',array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'codigo_swift',
		'num_cuenta_bancaria',
		'proveedor_id',
		'ente_organo_id',
),
)); ?>
