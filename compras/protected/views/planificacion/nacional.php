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
					'htmlOptions' => array(	'id'=>'proyecto', 'prompt' => 'Seleccionar proyecto', //'onChange'=>'submit','submit' => array('/planificacion/nacional','#'=>'proyecto')
										  'ajax' => array(
												'type'=>'POST', //request type
												'url'=>CController::createUrl('planificacion/buscarpartidasproyecto'), //url to call.
												//Style: CController::createUrl('currentController/methodToCall')
												'update'=>'#partida', //selector to update
												//'data'=>'js:javascript statement' 
												//leave out the data key to pass all form values through
										  )),
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
					//'id'=>'partida',
					//'name'=>'partida',
					'data' =>CHtml::listData($partidas,'partida_id', function($partida){ return CHtml::encode($this->numeroPartida($partida).' - '.$partida->nombre);}),
					//'options'=>array($model->proyecto_id => array('selected'=>true)),
					'htmlOptions' => array('id'=>'partida', 'prompt' => 'Seleccionar Partida', //'onChange'=>'submit','submit' => array('/planificacion/nacional','#'=>'partida') 
										'ajax' => array(	
												'type'=>'POST', //request type
												'url'=>CController::createUrl('planificacion/buscarproductospartida'), //url to call.
												//Style: CController::createUrl('currentController/methodToCall')
												'update'=>'#producto', //selector to update
												//'data'=>'js:javascript statement' 
												//leave out the data key to pass all form values through
										  )),
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
		 echo  $form->dropDownListGroup( $productoSel, 'producto_id',
			array(
				'wrapperHtmlOptions' => array(
					'class' => 'col-sm-5',
				),
				'label'=>'Seleccione el producto',
				'widgetOptions' => array(

					'data' => $productosPartidas,// CHtml::listData($productosPartidas, 'producto_id',function($producto){ return CHtml::encode($this->numeroProducto($producto).' - '.$producto->nombre);}),
					//'options'=>array($model->proyecto_id => array('selected'=>true)),
					'htmlOptions' => array('id'=>'producto','prompt' => 'Seleccionar producto', 'onChange'=>'submit','submit' => array('/planificacion/nacional','#'=>'producto') ),
				),
				'hint' => 'Selecciona el producto para añadir.'
			)
		); 

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
		


		
		echo  $form->dropDownListGroup( $presuPro, 'unidad_id',
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
		echo  $form->textFieldGroup($presuPro, 'costo_unidad',array('prepend'=>'Bs'));
		echo  $form->textFieldGroup($presuPro, 'cantidad');


		/********************** IMPORTADO *****************************/

		echo $form->hiddenField($presuPro,'tipo',array('id'=>'tipoPro'));




			//echo $form->checkboxGroup($model, 'checkbox');
			$this->widget(
			    'booster.widgets.TbButton',
			    array('buttonType' => 'submit',/*'url'=>array('/planificacion/nacional','#'=>'pestanas'),*/ 'label' => 'Añadir')
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

		//echo 'probando';
		//print_r($presuPros);

		echo '<h3>Lista de productos nacionales</h3>';
		$presuProducto = new PresupuestoProductos();
		// $gridColumns
		$gridColumns = array(
			//array('name'=>'id', 'header'=>'#', 'htmlOptions'=>array('style'=>'width: 60px')),
			array('name'=>'producto_id', 'header'=>'Producto','value'=>array($this,'obtenerProductoNombre')),
			array('name'=>'unidad_id', 'header'=>'Unidad','value'=>array($this,'obtenerUnidadNombre')),
			array('name'=>'costo_unidad', 'header'=>'Costo Unidad', 'value'=>array($this,'obtenerCostoUnidadNombre')),
			array('name'=>'cantidad', 'header'=>'Cantidad'),
			//array('name'=>'tipo', 'header'=>'Tipo de Compra'),
			array(
				'htmlOptions' => array('nowrap'=>'nowrap'),
				'class'=>'booster.widgets.TbButtonColumn',
				//'viewButtonUrl'=>null,
				'updateButtonUrl'=>null,
				'deleteButtonUrl'=>'Yii::app()->createUrl("planificacion/eliminarProducto", array("id"=>$data->id))',
			)
		);

		$gridDataProvider = new CArrayDataProvider($presuPros,array(
											    'keyField' => 'presupuesto_id',
											));
		/*$this->widget('booster.widgets.TbGridView', array(
		        'type' => 'striped bordered condensed',
		        'id'=>'presupuesto_id',
		        'dataProvider' => $gridDataProvider,
		        'template' => "{items}",
		        //'filter' => $presuProducto->search(),
		        'columns' => $gridColumns,
		    ));*/

		/*foreach ($presuPros as $key => $prepro) {
			if(isset($prepro)){
					//$producto = $prepro->producto;
				 	//echo $producto->nombre;
				 	print_r($prepro);

				 if($prepro->tipo == 'N')
				 {
				 	$this->renderPartial('_nacional',array('form'=>$formpc,'presuPro'=>$prepro, 'productosPartidas'=>$productosPartidas));

				}elseif($prepro->tipo == 'I')
				{
					$this->renderPartial('_internacional',array('form'=>$formpc,'presuPro'=>$prepro, 'productosPartidas'=>$productosPartidas));
				}
			}
		}*/
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