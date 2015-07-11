<?php
$this->breadcrumbs=array(
		'Facturases'=>array('index'),
		$model->id=>array('view','id'=>$model->id),
		'Update',
	);

	$this->menu=array(
		//array('label'=>'List Facturas','url'=>array('index')),
		array('label'=>'Registrar Factura','url'=>array('create')),
		//array('label'=>'Ver Factura','url'=>array('view','id'=>$model->id)),
		array('label'=>'Eliminar Factura','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
		//array('label'=>'Administrar Factura','url'=>array('admin')),
		);
	?>

	<h1>Actualizar Factura <?php echo $model->etiquetaFactura(); ?></h1>

<?php echo $this->renderPartial('_form',array('model'=>$model)); ?>