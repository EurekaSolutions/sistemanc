<?php
$this->breadcrumbs=array(
		'Presupuesto Partidases'=>array('index'),
		$model->presupuesto_partida_id=>array('view','id'=>$model->presupuesto_partida_id),
		'Update',
	);

	$this->menu=array(
		array('label'=>'List PresupuestoPartidas','url'=>array('index')),
		array('label'=>'Create PresupuestoPartidas','url'=>array('create')),
		array('label'=>'View PresupuestoPartidas','url'=>array('view','id'=>$model->presupuesto_partida_id)),
		array('label'=>'Manage PresupuestoPartidas','url'=>array('admin')),
		);
	?>

	<h1>Update PresupuestoPartidas <?php echo $model->presupuesto_partida_id; ?></h1>

<?php echo $this->renderPartial('_form',array('model'=>$model)); ?>