<?php
$this->breadcrumbs=array(
	'Usuarios Ws'=>array('index'),
	'Crear',
);

$this->menu=array(
//array('label'=>'List UsuariosWs','url'=>array('index')),
array('label'=>'Manejar UsuariosWs','url'=>array('admin')),
);
?>

<h1>Crear Usuarios Ws</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>