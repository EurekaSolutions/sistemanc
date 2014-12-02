<?php
$this->breadcrumbs=array(
		'Entes Organoses'=>array('index'),
		$model->ente_organo_id=>array('view','id'=>$model->ente_organo_id),
		'Update',
	);

	$this->menu=array(
		array('label'=>'Lista de Entes y Organos','url'=>array('index')),
		array('label'=>'Crear Entes y Organos','url'=>array('create')),
		array('label'=>'Ver Entes y Organos','url'=>array('view','id'=>$model->ente_organo_id)),
		array('label'=>'Administrar Entes y Organos','url'=>array('admin')),
		);
	?>

	<h1>Actualizar Entes y Organos <?php echo $model->ente_organo_id; ?></h1>

<?php echo $this->renderPartial('_form',array('model'=>$model)); ?>