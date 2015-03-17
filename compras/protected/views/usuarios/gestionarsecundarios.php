
		<?php 
$dataProvider=new CActiveDataProvider('Usuarios', array(
            'data'=>$model,
    ));/*new CArrayDataProvider($model, array(
    'id'=>'ente_organo_id',
    'keyField'=>'ente_organo_id',
    'sort'=>array(
        'attributes'=>array(
             'ente_organo_id', 'nombre', 'codigo_onapre', 'rif',
        ),
    ),
    'pagination'=>array(
        'pageSize'=>10,
    ),
));*/
	/*			$this->widget('booster.widgets.TbGridView',array(
				'id'=>'entes-organos-grid',
				'dataProvider'=> $dataProvider,
				//'filter'=>new EntesOrganos,

				'columns'=>array(
						//'ente_organo_id',
						'usuario',
						'correo',						
						//'esta_deshabilitado',
						'rif',
						//array('name'=>'Tiene Usuario','value'=>'$data->tieneusuario($value->enteOrgano->ente_organo_id)?"SI":"NO"'),

					array(
					'class'=>'booster.widgets.TbButtonColumn',
					'template'=>'{update}',
						 'buttons'=>array
						(
						    'update' => array
						    (
						          'url'=>'Yii::app()->createUrl("entesOrganos/actualizarMiEnte", array("id"=>$data->ente_organo_id))',
						    ),
				
						),
					),
				),
				)); */
		?>


<?php
$dataProvider=new CActiveDataProvider('Usuarios', array(
            'data'=>$model,
    ));
 $this->widget('booster.widgets.TbGridView',array(
'id'=>'usuarios-grid',
'dataProvider'=>$dataProvider,
//'filter'=>$model,
'columns'=>array(
		//'usuario_id',
		//'codigo_onapre',
		'usuario',
		//'contrasena',
		'correo',
		'creado_el',
		//'esta_deshabilitado',
		//array('name'=>'esta_deshabilitado', 'value'=>'$data->esta_deshabilitado?"Si:"No"'),
		array('name'=>'esta_deshabilitado', 'value'=>'$data->esta_deshabilitado?"Si":"No"', 'filter'=>CHtml::listData(array(
            array('esta_deshabilitado'=>true, 'title'=>'Si'),
            array('esta_deshabilitado'=>false, 'title'=>'No'),
        ), 'esta_deshabilitado', 'title')),
		array('name'=>'correo_verificado', 'value'=>'$data->correo_verificado?"Si":"No"', 'filter'=>CHtml::listData(array(
            array('correo_verificado'=>true, 'title'=>'Si'),
            array('correo_verificado'=>false, 'title'=>'No'),
        ), 'correo_verificado', 'title')),
		/*
		'actualizado_el',
		'esta_activo',
		
		'llave_activacion',
		'ultima_visita_el',
		*/
array(
'class'=>'booster.widgets.TbButtonColumn',
   'template'=>'{view}{update}{delete}',
    'buttons'=>array
     (
        'update' => array
        (
        	'url'=>'Yii::app()->createUrl("usuarios/modificarUsuario", array("id"=>$data->usuario_id))',
            //'visible'=>'!$data->publicada()',
        ),
    // 	//'update'=>array('visible'=>Yii::app()->user->checkAccess('coordinador')?array('label'=>'Publicar Noticias','url'=>array('publicar')):'false',
    //     'email' => array
    //     (
    //         'label'=>'Send an e-mail to this user',
    //         'imageUrl'=>Yii::app()->request->baseUrl.'/images/email.png',
    //         'url'=>'Yii::app()->createUrl("users/email", array("id"=>$data->id))',
    //     ),
    //     'down' => array
    //     (
    //         'label'=>'[-]',
    //         'url'=>'"#"',
    //        // 'visible'=>'$data->score > 0',
    //         'click'=>'function(){alert("Going down!");}',
    //     ),
     ),
),
),
)); ?>
