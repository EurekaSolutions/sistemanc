<?php
$this->breadcrumbs=array(
		'Fuentes Financiamientos'=>array('index'),
		$model->fuente_financiamiento_id=>array('view','id'=>$model->fuente_financiamiento_id),
		'Update',
	);

	$this->menu=array(
		array('label'=>'List FuentesFinanciamiento','url'=>array('index')),
		array('label'=>'Create FuentesFinanciamiento','url'=>array('create')),
		array('label'=>'View FuentesFinanciamiento','url'=>array('view','id'=>$model->fuente_financiamiento_id)),
		array('label'=>'Manage FuentesFinanciamiento','url'=>array('admin')),
		);
	?>

	<h1>Update FuentesFinanciamiento <?php echo $model->fuente_financiamiento_id; ?></h1>

<?php echo $this->renderPartial('_form',array('model'=>$model)); ?>