<?php
$this->breadcrumbs=array(
			'Usuarios Ws',
		);

$this->menu=array(
	array('label'=>'Crear UsuariosWs','url'=>array('create')),
	array('label'=>'Manejar UsuariosWs','url'=>array('admin')),
	);
?>

<h1>Usuarios Ws</h1>

<?php $this->widget('booster.widgets.TbListView',array(
'dataProvider'=>$dataProvider,
'itemView'=>'_view',
)); ?>
