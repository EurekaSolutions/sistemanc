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
					'htmlOptions' => array('prompt' => 'Seleccionar proyecto', 'onChange'=>'submit','submit' => array('/planificacion/partidas')),
				),
				'hint' => 'Selecciona la Acción o Proyecto.'
			)
		); 

	 //print_r($partidas);

	 	 echo $form->dropDownListGroup( $partidaSel, 'partida_id',
			array(
				'wrapperHtmlOptions' => array(
					'class' => 'col-sm-5',
				),
				'label'=>'Seleccione Partida para cargar sus productos',
				'widgetOptions' => array(

					'data' => CHtml::listData($partidas,'partida_id', function($partida){ return CHtml::encode($this->numeroPartida($partida).' - '.$partida->nombre);}),
					//'options'=>array($model->proyecto_id => array('selected'=>true)),
					'htmlOptions' => array('prompt' => 'Seleccionar Partida', 'onChange'=>'submit','submit' => array('/planificacion/partidas') ),
				),
				'hint' => 'Selecciona la partida correspondiente al proyecto para cargar sus productos.'
			)
		); 

	 	/* $this->widget(
		    'booster.widgets.TbButton',
		    array('buttonType' => 'submit', 'label' => 'Seleccionar')
		);*/
	 	 $this->endWidget();
		 	  
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
			

		/*	$formpc->inputFieldGroup($productosCargados[$key],'');
			$formpc->inputFieldGroup($productosCargados[$key],'');
			$formpc->inputFieldGroup($productosCargados[$key],'');
			$formpc->inputFieldGroup($productosCargados[$key],'');
			$formpc->inputFieldGroup($productosCargados[$key],'');
			$formpc->inputFieldGroup($productosCargados[$key],'');*/
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

	if(isset($partidaSel->partida_id)){
		//print_r($partidas);
		/* @var TbActiveForm $form */
		$formp = $this->beginWidget('booster.widgets.TbActiveForm',
		    array(
		        'id' => 'partida-form',
		        'htmlOptions' => array('class' => 'well'), // for inset effect
		    )
		);
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
		
		 echo $formp->dropDownListGroup( $productoSel, 'producto_id',
			array(
				'wrapperHtmlOptions' => array(
					'class' => 'col-sm-5',
				),
				'label'=>'Seleccione el producto',
				'widgetOptions' => array(

					'data' => CHtml::listData(Partidas::model()->findByPk($partidaSel->partida_id)->productos,
						'producto_id', function($producto){ return CHtml::encode($this->numeroProducto($producto).' - '.$producto->nombre);}),
					//'options'=>array($model->proyecto_id => array('selected'=>true)),
					'htmlOptions' => array('prompt' => 'Seleccionar producto', /*'multiple' => false,*/ ),
				),
				'hint' => 'Selecciona el producto para añadir.'
			)
		); 
			//echo $form->checkboxGroup($model, 'checkbox');
			$this->widget(
			    'booster.widgets.TbButton',
			    array('buttonType' => 'submit', 'label' => 'Añadir')
			);
		
		$this->endWidget();
		unset($formp);
	}
?>


<?php


?>