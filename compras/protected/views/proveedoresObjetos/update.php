<?php
$this->breadcrumbs=array(
		'Proveedores Objetoses'=>array('index'),
		$model->id=>array('view','id'=>$model->id),
		'Update',
	);

	$this->menu=array(
		array('label'=>'List ProveedoresObjetos','url'=>array('index')),
		array('label'=>'Create ProveedoresObjetos','url'=>array('create')),
		array('label'=>'View ProveedoresObjetos','url'=>array('view','id'=>$model->id)),
		array('label'=>'Manage ProveedoresObjetos','url'=>array('admin')),
		);
	?>

	<h1>Update ProveedoresObjetos <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form',array('model'=>$model)); ?>