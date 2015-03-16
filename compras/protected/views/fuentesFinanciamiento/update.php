<?php
$this->breadcrumbs=array(
		'Fuentes Financiamientos'=>array('index'),
		$model->fuente_financiamiento_id=>array('view','id'=>$model->fuente_financiamiento_id),
		'Actualizar',
	);

	$this->menu=array(
		array('label'=>'Listar fuentes financiamiento','url'=>array('index')),
		array('label'=>'Crear fuentes financiamiento','url'=>array('create')),
		//array('label'=>'V FuentesFinanciamiento','url'=>array('view','id'=>$model->fuente_financiamiento_id)),
		array('label'=>'Administrar fuentes financiamiento','url'=>array('admin')),
		);
	?>

	<h1>Actualizar fuentes de financiamiento <?php //cho $model->fuente_financiamiento_id; ?></h1>

<?php echo $this->renderPartial('_form',array('model'=>$model)); ?>