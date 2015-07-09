<?php
$this->breadcrumbs=array(
	'Proveedores Extranjeroses'=>array('index'),
	'Create',
);

$this->menu=array(
array('label'=>'List ProveedoresExtranjeros','url'=>array('index')),
array('label'=>'Manage ProveedoresExtranjeros','url'=>array('admin')),
);
?>

<h1>Crear Proveedores Extranjeros</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model,'modelProveedor'=>$modelProveedor, 'modelContacto'=>$modelContacto, //'modelCuenta'=>$modelCuenta, 'modelObjeto'=>$modelObjeto,
                                              ));
?>