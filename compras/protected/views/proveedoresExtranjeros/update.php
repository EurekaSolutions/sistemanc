<?php
$this->breadcrumbs=array(
		'Proveedores Extranjeroses'=>array('index'),
		$model->id=>array('view','id'=>$model->id),
		'Update',
	);

	$this->menu=array(
		array('label'=>'List ProveedoresExtranjeros','url'=>array('index')),
		array('label'=>'Create ProveedoresExtranjeros','url'=>array('create')),
		array('label'=>'View ProveedoresExtranjeros','url'=>array('view','id'=>$model->id)),
		array('label'=>'Manage ProveedoresExtranjeros','url'=>array('admin')),
		);
	?>

	<h1>Update ProveedoresExtranjeros <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form',array('model'=>$model, 'modelProveedor'=>$modelProveedor, 'modelContacto'=>$modelContacto, //'modelCuenta'=>$modelCuenta, 'modelObjeto'=>$modelObjeto,
                                             )); 
?>