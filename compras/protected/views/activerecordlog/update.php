<?php
$this->breadcrumbs=array(
		'Activerecordlogs'=>array('index'),
		$model->id=>array('view','id'=>$model->id),
		'Update',
	);

	$this->menu=array(
		array('label'=>'List Activerecordlog','url'=>array('index')),
		array('label'=>'Create Activerecordlog','url'=>array('create')),
		array('label'=>'View Activerecordlog','url'=>array('view','id'=>$model->id)),
		array('label'=>'Manage Activerecordlog','url'=>array('admin')),
		);
	?>

	<h1>Update Activerecordlog <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form',array('model'=>$model)); ?>