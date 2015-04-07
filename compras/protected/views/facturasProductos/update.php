<?php
$this->breadcrumbs=array(
		'Facturas Productoses'=>array('index'),
		$model->id=>array('view','id'=>$model->id),
		'Update',
	);

	$this->menu=array(
		array('label'=>'List FacturasProductos','url'=>array('index')),
		array('label'=>'Create FacturasProductos','url'=>array('create')),
		array('label'=>'View FacturasProductos','url'=>array('view','id'=>$model->id)),
		array('label'=>'Manage FacturasProductos','url'=>array('admin')),
		);
	?>

	<h1>Update FacturasProductos <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form',array('model'=>$model, 'proyectoSel'=>$proyectoSel)); ?>