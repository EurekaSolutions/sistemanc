<?php
/* @var $this PresupuestoImportacionController */
/* @var $model PresupuestoImportacion */
?>

<?php
$this->breadcrumbs=array(
	'Presupuesto Importacions'=>array('index'),
	$model->presupuesto_id,
);

$this->menu=array(
	array('label'=>'Lista de PresupuestoImportacion', 'url'=>array('index')),
	array('label'=>'Crear PresupuestoImportacion', 'url'=>array('create')),
	array('label'=>'Actualizar PresupuestoImportacion', 'url'=>array('update', 'id'=>$model->presupuesto_id)),
	array('label'=>'Eliminar PresupuestoImportacion', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->presupuesto_id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Administrar PresupuestoImportacion', 'url'=>array('admin')),
);
?>

<h1>Ver PresupuestoImportacion #<?php echo $model->presupuesto_id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView',array(
    'htmlOptions' => array(
        'class' => 'table table-striped table-condensed table-hover',
    ),
    'data'=>$model,
    'attributes'=>array(
		'codigo_ncm_id',
		'presupuesto_id',
		'cantidad',
		'fecha_llegada',
		'monto_presupuesto',
		'tipo',
		'monto_ejecutado',
		'divisa_id',
	),
)); ?>