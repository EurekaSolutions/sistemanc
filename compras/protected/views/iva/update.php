<?php
$this->breadcrumbs=array(
		'Ivas'=>array('index'),
		$model->id=>array('view','id'=>$model->id),
		'Actualizar',
	);

	$this->menu=array(
		/*array('label'=>'List Iva','url'=>array('index')),
		array('label'=>'Create Iva','url'=>array('create')),
		array('label'=>'View Iva','url'=>array('view','id'=>$model->id)),*/
		array('label'=>'Gestionar Iva','url'=>array('admin')),
		);
	?>

	<h1>Actualizar Iva</h1>

<?php echo $this->renderPartial('_form',array('model'=>$model)); ?>