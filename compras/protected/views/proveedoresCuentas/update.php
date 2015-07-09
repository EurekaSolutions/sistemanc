<?php
$this->breadcrumbs=array(
		'Proveedores Cuentases'=>array('index'),
		$model->id=>array('view','id'=>$model->id),
		'Update',
	);

	$this->menu=array(
		array('label'=>'List ProveedoresCuentas','url'=>array('index')),
		array('label'=>'Create ProveedoresCuentas','url'=>array('create')),
		array('label'=>'View ProveedoresCuentas','url'=>array('view','id'=>$model->id)),
		array('label'=>'Manage ProveedoresCuentas','url'=>array('admin')),
		);
	?>

	<h1>Update ProveedoresCuentas <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form',array('model'=>$model)); ?>