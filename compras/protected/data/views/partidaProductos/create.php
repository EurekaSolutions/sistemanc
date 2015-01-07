<?php
$this->breadcrumbs=array(
	'Partida Productos'=>array('index'),
	'Crear',
);

$this->menu=array(
array('label'=>'List PartidaProductos','url'=>array('index')),
array('label'=>'Manage PartidaProductos','url'=>array('admin')),
);
?>

<h1>Asociar Productos a Partidas</h1>
<?php
    foreach(Yii::app()->user->getFlashes() as $key => $message) {
        echo '<div class="flash-' . $key . '">' . $message . "</div>\n";
    }
?>
<?php echo $this->renderPartial('_form', array('model'=>$model, 'especificas_lista' => $especificas_lista, 'productos' => $productos, 'operacion' => $operacion)); ?>