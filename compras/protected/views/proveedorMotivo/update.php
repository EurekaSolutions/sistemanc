<?php
$this->breadcrumbs=array(
		'Proveedor Motivos'=>array('index'),
		$model->id=>array('view','id'=>$model->id),
		'Update',
	);

	$this->menu=array(
		array('label'=>'List ProveedorMotivo','url'=>array('index')),
		array('label'=>'Create ProveedorMotivo','url'=>array('create')),
		array('label'=>'View ProveedorMotivo','url'=>array('view','id'=>$model->id)),
		array('label'=>'Manage ProveedorMotivo','url'=>array('admin')),
		);
	?>

	<h1>Update ProveedorMotivo <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form',array('model'=>$model)); ?>