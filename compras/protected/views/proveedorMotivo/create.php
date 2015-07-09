<?php
$this->breadcrumbs=array(
	'Proveedor Motivos'=>array('index'),
	'Create',
);
if(Yii::app()->user->checkAccess('admin'))
{
$this->menu=array(
array('label'=>'List ProveedorMotivo','url'=>array('index')),
array('label'=>'Manage ProveedorMotivo','url'=>array('admin')),
);
}
?>

<h1>Motivo de contratación</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>