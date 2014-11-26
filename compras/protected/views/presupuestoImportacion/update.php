<?php
/* @var $this PresupuestoImportacionController */
/* @var $model PresupuestoImportacion */
?>

<?php
$this->breadcrumbs=array(
	'Presupuesto Importacions'=>array('index'),
	$model->presupuesto_id=>array('view','id'=>$model->presupuesto_id),
	'Update',
);

$this->menu=array(
	array('label'=>'List PresupuestoImportacion', 'url'=>array('index')),
	array('label'=>'Create PresupuestoImportacion', 'url'=>array('create')),
	array('label'=>'View PresupuestoImportacion', 'url'=>array('view', 'id'=>$model->presupuesto_id)),
	array('label'=>'Manage PresupuestoImportacion', 'url'=>array('admin')),
);
?>

    <h1>Update PresupuestoImportacion <?php echo $model->presupuesto_id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>