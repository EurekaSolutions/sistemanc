<?php
/*$this->breadcrumbs=array(
		'Presupuesto Productoses'=>array('index'),
		$model->presupuesto_id=>array('view','id'=>$model->presupuesto_id),
		'Update',
	);*/

/*	$this->menu=array(
		array('label'=>'List PresupuestoProductos','url'=>array('index')),
		array('label'=>'Create PresupuestoProductos','url'=>array('create')),
		array('label'=>'View PresupuestoProductos','url'=>array('view','id'=>$model->presupuesto_id)),
		array('label'=>'Manage PresupuestoProductos','url'=>array('admin')),
		);*/
	?>

	<h1>Actualizar presupuesto del producto <?php echo $model->producto->etiquetaProducto(); ?></h1>

<?php echo $this->renderPartial('_form',array('model'=>$model)); ?>