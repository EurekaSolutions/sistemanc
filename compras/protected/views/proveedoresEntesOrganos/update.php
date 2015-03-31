<?php
$this->breadcrumbs=array(
		'Proveedores Entes Organoses'=>array('index'),
		$model->id=>array('view','id'=>$model->id),
		'Update',
	);

	$this->menu=array(
		array('label'=>'List ProveedoresEntesOrganos','url'=>array('index')),
		array('label'=>'Create ProveedoresEntesOrganos','url'=>array('create')),
		array('label'=>'View ProveedoresEntesOrganos','url'=>array('view','id'=>$model->id)),
		array('label'=>'Manage ProveedoresEntesOrganos','url'=>array('admin')),
		);
	?>

	<h1>Update ProveedoresEntesOrganos <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form',array('model'=>$model)); ?>