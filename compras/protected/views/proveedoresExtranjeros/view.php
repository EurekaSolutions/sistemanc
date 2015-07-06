<?php
$this->breadcrumbs=array(
		'Proveedores Extranjeroses'=>array('index'),
		$model->id,
	);

$this->menu=array(
	array('label'=>'List ProveedoresExtranjeros','url'=>array('index')),
	array('label'=>'Create ProveedoresExtranjeros','url'=>array('create')),
	array('label'=>'Update ProveedoresExtranjeros','url'=>array('update','id'=>$model->id)),
	array('label'=>'Delete ProveedoresExtranjeros','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage ProveedoresExtranjeros','url'=>array('admin')),
	);
?>

<h1>View ProveedoresExtranjeros #<?php echo $model->id; ?></h1>

<?php 
	$this->widget('booster.widgets.TbDetailView',array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'proveedor_id',
		'num_identificacion',
		'pais_id',
		'codigo_postal',
		'calle',
		'distrito',
		'poblacion',
		'tlf_fijo',
		'pagina_web',
),
)); ?>
