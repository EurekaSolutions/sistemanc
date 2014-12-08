<?php
/* @var $this PlanificacionController */

$this->breadcrumbs=array(
	'Planificacion'=>array('/planificacion'),
	'Partidas',
);
?>


<?php 

	
	/** @var TbActiveForm $form */
	$form = $this->beginWidget('booster.widgets.TbActiveForm',
	    array(
	        'id' => 'proyecto-form',
	        //'action'=>$this->createUrl('')."#proyecto",
	        'htmlOptions' => array('class' => 'well'), // for inset effect
	    )
	);
	

	$lista_acciones = CHtml::listData($usuario->enteOrgano->acciones, function($accion) {
																return CHtml::encode('a'.$accion->accion->accion_id);
															}, function($accion) {
																return CHtml::encode($accion->codigo_accion.' - '.$accion->accion->nombre);
															});
	$lista_proyectos = CHtml::listData($usuario->enteOrgano->proyectos, 'proyecto_id', function($proyecto) {
																return CHtml::encode($proyecto->codigo.' - '.$proyecto->nombre);
															},'Proyectos');
	 
	$listas = array(!empty($lista_acciones)?'Acciones Centralizadas':null=>$lista_acciones,
	 				!empty($lista_proyectos)?'Proyectos':null =>$lista_proyectos);

	//echo $form->listBoxGroup($model, 'nombre',$proyectos);
	//echo $form->dropDownListGroup($model, 'nombre',$proyectos, array('prompt'=>'Seleccionar proyecto','multiple' => 'multiple'));
	//echo $form->dropDownList($model,'category_id',  array('prompt'=>'Select category','multiple' => 'multiple'));

	 echo $form->dropDownListGroup( $proyectoSel,	'proyecto_id',
			array(
				'wrapperHtmlOptions' => array(
					'class' => 'col-sm-2',
				),
				'label'=>'Seleccione Proyecto o Acción Centralizada a cargar',
				'widgetOptions' => array(
					'data' => $listas,

					//'options'=>array($model->proyecto_id => array('selected'=>true)),
					'htmlOptions' => array(	'id'=>'proyecto', 'prompt' => 'Seleccionar proyecto', 'onChange'=>'submit','submit' => array('/planificacion/partidas','#'=>'proyecto')),
				),
				'hint' => 'Selecciona la Acción o Proyecto.'
			)
		); 

?><?php
	 //print_r($partidas);

	 	 echo $form->dropDownListGroup( $partidaSel, 'partida_id',
			array(
				'wrapperHtmlOptions' => array(
					'class' => 'col-sm-5',
				),
				'label'=>'Seleccione Partida para cargar sus productos',
				'widgetOptions' => array(
					'id'=>'partida',
					'name'=>'partida',
					'data' => CHtml::listData($partidas,'partida_id', function($partida){ return CHtml::encode($this->numeroPartida($partida).' - '.$partida->nombre);}),
					//'options'=>array($model->proyecto_id => array('selected'=>true)),
					'htmlOptions' => array('id'=>'partida', 'prompt' => 'Seleccionar Partida', 'onChange'=>'submit','submit' => array('/planificacion/partidas','#'=>'partida') ),
				),
				'hint' => 'Selecciona la partida correspondiente al proyecto para cargar sus productos.'
			)
		); 

	 	/* $this->widget(
		    'booster.widgets.TbButton',
		    array('buttonType' => 'submit', 'label' => 'Seleccionar')
		);*/
	 	 //$this->endWidget();

?>

<?php 

	if(isset($partidaSel->partida_id)){
		//print_r($partidas);
		/* @var TbActiveForm $form */
	/*	$formp = $this->beginWidget('booster.widgets.TbActiveForm',
		    array(
		        'id' => 'partida-form',
		        'htmlOptions' => array('class' => 'well'), // for inset effect
		    )
		);*/
		//print_r($partidaSel);
		//echo '<br> '.$partidaSel->partida_id;
		//echo print_r($partidaSel);
		//echo count(Partidas::model()->findByPk($partidaSel->partida_id)->productos);


		/*$par_productos = PartidaProductos::model()->findAllByAttributes(array('partida_id'=>$partidaSel->partida_id));
		$productos = array();
		foreach ($par_productos as $key => $par_producto) {
			$productos[] = Productos::model()->findByAttributes(array('producto_id'=>$par_producto->producto_id));
		}*/
		
		/*foreach ($productos as $key => $producto) {
			
		   echo $formp->textFieldGroup($producto, 'nombre',
				array(
					'wrapperHtmlOptions' => array(
						'class' => 'col-sm-5',
					),
					'hint' => 'In addition to freeform text, any HTML5 text-based input appears like so.'
				)
			);
		}*/
		
	/*	foreach (Partidas::model()->findByPk($partidaSel->partida_id)->productos as $key => $producto) {
			
		   echo $formp->textFieldGroup($producto, 'nombre',
				array(
					'wrapperHtmlOptions' => array(
						'class' => 'col-sm-5',
					),
					'hint' => 'In addition to freeform text, any HTML5 text-based input appears like so.'
				)
			);
		}*/


	/********************** NACIONAL *****************************/
		$nacional = '';
		 $nacional .= $form->dropDownListGroup( $presuPro, 'producto_id',
			array(
				'wrapperHtmlOptions' => array(
					'class' => 'col-sm-5',
				),
				'label'=>'Seleccione el producto',
				'widgetOptions' => array(

					'data' => CHtml::listData($productosPartidas,'producto_id', 
							function($producto){ return CHtml::encode($this->numeroProducto($producto).' - '.$producto->nombre);}),
					//'options'=>array($model->proyecto_id => array('selected'=>true)),
					'htmlOptions' => array('prompt' => 'Seleccionar producto', /*'multiple' => false,*/ ),
				),
				'hint' => 'Selecciona el producto para añadir.'
			)
		); 

		
		$nacional .= $form->dropDownListGroup( $presuPro, 'unidad_id',
			array(
				'wrapperHtmlOptions' => array(
					'class' => 'col-sm-5',
				),
				'label'=>'Unidad',
				'widgetOptions' => array(

					'data' => CHtml::listData(Unidades::model()->findAll(),'unidad_id', 'nombre'),
					//'options'=>array($model->proyecto_id => array('selected'=>true)),
					'htmlOptions' => array('prompt' => 'Seleccionar Unidad', /*'multiple' => false,*/ ),
				),
				'hint' => 'Selecciona la unidad del producto.'
			)
		); 
		$nacional .= $form->textFieldGroup($presuPro, 'costo_unidad',array('prepend'=>'Bs'));
		$nacional .= $form->textFieldGroup($presuPro, 'cantidad');


		/********************** IMPORTADO *****************************/

		
		$importado = '';
		$importado .= $form->dropDownListGroup( $codigoNcmSel, 'codigo_ncm_id',
			array(
				'wrapperHtmlOptions' => array(
					'class' => 'col-sm-5',
				),
				'label'=>'Seleccione el grupo del producto',
				'widgetOptions' => array(

					'data' => CHtml::listData(CodigosNcm::model()->findAll('to_number(codigo_ncm_nivel_1, \'99G999D9S\')!=0 AND to_number(codigo_ncm_nivel_2, \'99G999D9S\') = 0 
	AND to_number(codigo_ncm_nivel_3, \'99G999D9S\') = 0 AND (coalesce(codigo_ncm_nivel_4, \'\')=\'\' OR to_number(codigo_ncm_nivel_4, \'99G999D9S\') = 0) AND '.$this->condicionVersion()),
						'codigo_ncm_id', function($codigo){ return CHtml::encode($this->numeroCodigoNcm($codigo).' - '.$codigo->descripcion_ncm);}),
					//'options'=>array($model->proyecto_id => array('selected'=>true)),
					'htmlOptions' => array('id'=>'codigoNcm1','prompt' => 'Seleccionar producto',/*'onChange'=>'submit','submit'=>array('/planificacion/partidas','#'=>'codigoNcm1')*/
										'ajax' => array(
												'type'=>'POST', //request type
												'url'=>CController::createUrl('planificacion/buscarNcm'), //url to call.
												//Style: CController::createUrl('currentController/methodToCall')
												'update'=>'#ncmnivel2', //selector to update
												//'data'=>'js:javascript statement' 
												//leave out the data key to pass all form values through
										  )),
				),
				'hint' => 'Grupo del producto para añadir.'
			)
		);

		/*$listaCodigos = array();
		if($codigoSel=CodigosNcm::model()->findByPk($codigoNcmSel->codigo_ncm_id))
			$listaCodigos = CHtml::listData(CodigosNcm::model()->findAll('codigo_ncm_nivel_1='.$codigoSel->codigo_ncm_nivel_1.' AND t.fecha_desde<\''.date('Y-m-d').'\' AND t.fecha_hasta>\''.date('Y-m-d').'\''),
						'codigo_ncm_id', function($codigo){ return CHtml::encode($this->numeroCodigoNcm($codigo).' - '.$codigo->descripcion_ncm);});*/
		$importado .= $form->dropDownListGroup( $presuImp, 'codigo_ncm_id',
			array(
				'wrapperHtmlOptions' => array(
					'class' => 'col-sm-5',
				),
				'label'=>'Seleccione el producto',
				'widgetOptions' => array(

					'data' => array(),
					//'options'=>array($model->proyecto_id => array('selected'=>true)),
					'htmlOptions' => array('prompt' => 'Seleccionar producto', 'id'=>'ncmnivel2' /*'multiple' => false,*/ ),
				),
				'hint' => 'Producto para añadir.'
			)
		); 

		Yii::app()->clientScript->registerScript("cambioDivisa", '$(\'#divisa\').change(function(){$(\'#montoPresupuesto\').parent(\'span.input-group-addon\').val(\'$\');})');
		$importado .= $form->dropDownListGroup( $presuImp, 'divisa_id',
			array(
				'wrapperHtmlOptions' => array(
					'class' => 'col-sm-5',
				),
				'label'=>'Divisa',
				'widgetOptions' => array(

					'data' =>  CHtml::listData(Divisas::model()->findAll(),'divisa_id', function($divisa){ return CHtml::encode($divisa->nombre.' - '.$divisa->simbolo);}),
					//'options'=>array($model->proyecto_id => array('selected'=>true)),
					'htmlOptions' => array('id'=>'divisa', 'prompt' => 'Seleccionar divisa', /*'multiple' => false,*/ ),
				),
				'hint' => 'Divisa a ser utiilzada en este producto.'
			)
		); 

		$importado .= $form->dropDownListGroup( $presuImp, 'tipo',
			array(
				'wrapperHtmlOptions' => array(
					'class' => 'col-sm-5',
				),
				'label'=>'Tipo Importación',
				'widgetOptions' => array(

					'data' =>  array('corpovex'=>'Corpovex','licitacionInternacional'=>'Licitación Internacional'),
					//'options'=>array($model->proyecto_id => array('selected'=>true)),
					'htmlOptions' => array('prompt' => 'Seleccionar tipo', /*'multiple' => false,*/ ),
				),
				'hint' => 'Tipo de importación a ser utiilzada en este producto.'
			)
		); 


 		$importado .= $form->datePickerGroup(
			$presuImp,
			'fecha_llegada',
			array(

				'widgetOptions' => array(

					'options' => array(
						'format' => 'dd-mm-yyyy',
						'language' => 'es',
					),
				),
				'wrapperHtmlOptions' => array(
					'class' => 'col-sm-5',
				),
				'hint' => 'Fecha de llegada estimada del producto.',
				'prepend' => '<i class="glyphicon glyphicon-calendar"></i>'
			)
		);

		$importado .= $form->textFieldGroup($presuImp, 'monto_presupuesto',array('prepend'=>'Bs','widgetOptions'=>array('htmlOptions'=> array('id'=>'montoPresupuesto'))));
		$importado .= $form->textFieldGroup($presuImp, 'cantidad');
		
		Yii::app()->clientScript->registerScript("linkClick", "$('#nacional').click(function(){ $('#tipoPro').val('N');})
															   $('#importado').click(function(){ $('#tipoPro').val('I');})");
		//Yii::app()->clientScript->registerScript("link2Click", "$('#link2').click(function(){alert('link2 is clicked');})");

		$this->widget(
		    'booster.widgets.TbTabs',
		    array(
		        'type' => 'tabs', // 'tabs' or 'pills'
		        'id' => 'pestanas',
		        'tabs' => array(
		            array(
		                'label' => 'Nacional',
		                'content' => $nacional,
		                'active' => $presuPro->tipo == 'N'?true:false,'linkOptions' => array('id'=>'nacional')
		            ),
		            array(
		            	'label' => 'Importado', 
		            	'content' => $importado,
		                'active' => $presuPro->tipo == 'N'?false:true, 'linkOptions' => array('id'=>'importado')),
		        ),
		    )
		);

		echo $form->hiddenField($presuPro,'tipo',array('id'=>'tipoPro'));




			//echo $form->checkboxGroup($model, 'checkbox');
			$this->widget(
			    'booster.widgets.TbButton',
			    array('buttonType' => 'submit',/*'url'=>array('/planificacion/partidas','#'=>'pestanas'),*/ 'label' => 'Añadir')
			);
		

	}
		$this->endWidget();
		unset($form);
?>

<?php 
	$formpc = $this->beginWidget('booster.widgets.TbActiveForm',
		    array(
		        'id' => 'partida-form',
		        'htmlOptions' => array('class' => 'well'), // for inset effect
		    )
		);

		print_r($presuPros);
		foreach ($presuPros as $key => $prepro) {
		
				//$producto = $prepro->producto;
			 	//echo $producto->nombre;
			 	print_r($prepro);
			

			 //if($prepro->tipo == 'N')
			 {

				/*$formpc->textFieldGroup($presuPros[$key],'');
				$formpc->textFieldGroup($presuPros[$key],'');
				$formpc->textFieldGroup($presuPros[$key],'');
				$formpc->textFieldGroup($presuPros[$key],'');
				$formpc->textFieldGroup($presuPros[$key],'');
				$formpc->textFieldGroup($presuPros[$key],'');*/
			}
		}
	 $this->endWidget();
		/*$this->widget(
		    'booster.widgets.TbSelect2',
		    array(
		        'name' => 'emptydata',
		        'data' => $listas,
		        'options' => array(
		            'placeholder' => 'type clever, or is, or just type!',
		            'width' => '80%',
		        )
		    )
		);*/
/*		foreach(
    array('default', 'primary', 'success', 'info', 'warning', 'danger')
    as $context
		) {
		    $label = $context;
		    $this->widget('booster.widgets.TbLabel', compact('context', 'label'));
		}*/
?>
<?php


?>