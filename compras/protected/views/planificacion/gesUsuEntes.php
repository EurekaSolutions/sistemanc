
<center><H4>Usuarios principales de mis Entes-Organos</H4></center>

<?php 
$dataProvider=new CActiveDataProvider('Usuarios', array(
            'data'=>$model,
    ));

$this->widget('booster.widgets.TbGridView',array(
'id'=>'usuarios-grid',
'dataProvider'=>$dataProvider,
//'filter'=>$model,
'summaryText'=>'',
'columns'=>array(
		//'usuario_id',
		array('name'=>'ente_organo_id', 'value'=>'$data->enteOrgano->nombre'),
		//'codigo_onapre',
		//'usuario',
		//'contrasena',
		'correo',
		'cedula',
		'creado_el',
		/*
		'actualizado_el',
		'esta_activo',
		'esta_deshabilitado',
		'correo_verificado',
		'llave_activacion',
		'ultima_visita_el',
		*/
		array(
			'class'=>'booster.widgets.TbButtonColumn',
			 'template'=>'{update}',
			 'buttons'=>array(
			/* 		'view'=>array(
			 			'url'=>'Yii::app()->createUrl("usuarios/view", array("id"=>$data->usuario_id))',
			 			),*/
					'update'=>array(
			 			'url'=>'Yii::app()->createUrl("usuarios/modificarUsuarioEnte", array("id"=>$data->usuario_id))',
			 			),


			 	)
			),
		),
)); ?>
