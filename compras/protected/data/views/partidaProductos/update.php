<?php
$this->breadcrumbs=array(
		'Partida Productoses'=>array('index'),
		$model->partida_producto_id=>array('view','id'=>$model->partida_producto_id),
		'Update',
	);

	$this->menu=array(
		array('label'=>'List PartidaProductos','url'=>array('index')),
		array('label'=>'Create PartidaProductos','url'=>array('create')),
		array('label'=>'View PartidaProductos','url'=>array('view','id'=>$model->partida_producto_id)),
		array('label'=>'Manage PartidaProductos','url'=>array('admin')),
		);
	?>

	<h1>Update PartidaProductos <?php echo $model->partida_producto_id; ?></h1>

<?php echo $this->renderPartial('_form',array('model'=>$model)); ?>