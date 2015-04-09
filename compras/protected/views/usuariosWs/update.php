<?php
$this->breadcrumbs=array(
		'Usuarios Ws'=>array('index'),
		$model->id=>array('view','id'=>$model->id),
		'Update',
	);

	$this->menu=array(
		array('label'=>'List UsuariosWs','url'=>array('index')),
		array('label'=>'Create UsuariosWs','url'=>array('create')),
		array('label'=>'View UsuariosWs','url'=>array('view','id'=>$model->id)),
		array('label'=>'Manage UsuariosWs','url'=>array('admin')),
		);
	?>

	<h1>Update UsuariosWs <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form',array('model'=>$model)); ?>