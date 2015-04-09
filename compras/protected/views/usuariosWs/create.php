<?php
$this->breadcrumbs=array(
	'Usuarios Ws'=>array('index'),
	'Crear',
);

$this->menu=array(
//array('label'=>'List UsuariosWs','url'=>array('index')),
array('label'=>'Manejar UsuariosWs','url'=>array('admin')),
array('label'=>'Obtener WSDL','url'=>array('http://localhost/sistemanc/compras/index.php?r=wservices/ws'), 'linkOptions'=> array('target'=>'_blank')),
);
?>

<h1>Crear Usuarios Ws</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>