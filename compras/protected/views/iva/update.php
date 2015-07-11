<?php
$this->breadcrumbs=array(
		'Ivas'=>array('index'),
		$model->id=>array('view','id'=>$model->id),
		'Update',
	);

	$this->menu=array(
		array('label'=>'List Iva','url'=>array('index')),
		array('label'=>'Create Iva','url'=>array('create')),
		array('label'=>'View Iva','url'=>array('view','id'=>$model->id)),
		array('label'=>'Manage Iva','url'=>array('admin')),
		);
	?>

	<h1>Update Iva <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form',array('model'=>$model)); ?>