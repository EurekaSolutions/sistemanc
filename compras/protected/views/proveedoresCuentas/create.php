<?php
$this->breadcrumbs=array(
	'Proveedores Cuentas'=>array('index'),
	'Create',
);
if(Yii::app()->user->checkAccess('admin'))
{
$this->menu=array(
array('label'=>'List ProveedoresCuentas','url'=>array('index')),
array('label'=>'Manage ProveedoresCuentas','url'=>array('admin')),
);
}
?>

<h1>Crear Información financiera</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>