<?php
$this->breadcrumbs=array(
		'Procedimientoses'=>array('index'),
		$model->id=>array('view','id'=>$model->id),
		'Update',
	);

	$this->menu=array(
		array('label'=>'List Procedimientos','url'=>array('index')),
		array('label'=>'Create Procedimientos','url'=>array('create')),
		array('label'=>'View Procedimientos','url'=>array('view','id'=>$model->id)),
		array('label'=>'Manage Procedimientos','url'=>array('admin')),
		);
	?>

	<h1>Update Procedimientos <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form',array('model'=>$model)); ?>