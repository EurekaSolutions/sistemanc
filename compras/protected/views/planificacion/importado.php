<?php
/* @var $this PlanificacionController */

$this->breadcrumbs=array(
	'Planificacion'=>array('/planificacion'),
	'Partidas',
);
?>

    <?php
        foreach(Yii::app()->user->getFlashes() as $key => $message) {
            echo '<div class="flash-' . $key . '">' . $message . "</div>\n";
        }
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

/*		Yii::app()->clientScript->registerScript("cambioProyecto", '
						$(\'#proyecto\').change(function(){
							if($(\'#producto\').val() != \'\')
							{
								location.reload(true);
							}
				})');*/

	 echo $form->dropDownListGroup( $proyectoSel,	'proyecto_id',
			array(
				'wrapperHtmlOptions' => array(
					'class' => 'col-sm-2',
				),
				'label'=>'Seleccione Proyecto o Acción Centralizada a cargar',
				'widgetOptions' => array(
					'data' => $listas,

					//'options'=>array($model->proyecto_id => array('selected'=>true)),
					'htmlOptions' => array(	'id'=>'proyecto', 'prompt' => 'Seleccionar proyecto', //'onChange'=>'submit','submit' => array('/planificacion/importado','#'=>'proyecto')
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
					'htmlOptions' => array('id'=>'partida', 'prompt' => 'Seleccionar Partida', //'onChange'=>'submit','submit' => array('/planificacion/importado','#'=>'partida') 
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
		Yii::app()->clientScript->registerScript("cambioProducto", '
				$(\'#producto\').change(function(){
					$(\'#ncmnivel2\').val(\'\');
					$(\'#tipolicitacion\').val(\'\');
					$(\'#montoPresupuesto\').val(\'\');
					$(\'#cantidad\').val(\'\');
					$(\'#descripcion\').val(\'\');
					$(\'#fecha\').val(\'\');
					$(\'#divisa\').val(\'\');
		})');
		 echo  $form->dropDownListGroup( $productoSel, 'producto_id',
			array(
				'wrapperHtmlOptions' => array(
					'class' => 'col-sm-5',
				),
				'label'=>'Seleccione el producto',
				'widgetOptions' => array(

					'data' => $productosPartidas,// CHtml::listData($productosPartidas, 'producto_id',function($producto){ return CHtml::encode($this->numeroProducto($producto).' - '.$producto->nombre);}),
					//'options'=>array($model->proyecto_id => array('selected'=>true)),
					'htmlOptions' => array('id'=>'producto','prompt' => 'Seleccionar producto', 'onChange'=>'submit','submit' => array('/planificacion/importado','#'=>'producto') ),
				),
				'hint' => 'Selecciona el producto para añadir.'
			)
		); 

	if(isset($productoSel->producto_id)){

		echo '<div class="flash-notice"><h4> Cargar tantos codigos arancvelarios como se requiera para este producto.<h4></div>';

		echo $form->errorSummary($presuImp);

		echo $form->dropDownListGroup( $presuImp, 'codigo_ncm_id',
			array(
				'wrapperHtmlOptions' => array(
					'class' => 'col-sm-5',
				),
				'label'=>'Código arancelario',
				'widgetOptions' => array(

					'data' => CHtml::listData(CodigosNcm::model()->findAll($this->condicionVersion()),
						'codigo_ncm_id', function($codigo){ return CHtml::encode($this->numeroCodigoNcm($codigo).' - '.$codigo->descripcion_ncm);}),
					//'options'=>array($model->proyecto_id => array('selected'=>true)),
					'htmlOptions' => array('id'=>'ncmnivel2', 'prompt' => 'Seleccionar codigo arancelario',  /*'multiple' => false,*/ ),
				),
				'hint' => 'Código arancelario.'
			)
		); 

		//Yii::app()->clientScript->registerScript("cambioDivisa", '$(\'#divisa\').change(function(){$(\'#montoPresupuesto\').parent(\'span\').html(\'$\');})');
		echo $form->dropDownListGroup( $presuImp, 'divisa_id',
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

		echo $form->dropDownListGroup( $presuImp, 'tipo',
			array(
				'wrapperHtmlOptions' => array(
					'class' => 'col-sm-5',
				),
				'label'=>'Tipo Importación',
				'widgetOptions' => array(

					'data' =>  array('corpovex'=>'Corpovex','licitacionInternacional'=>'Licitación Internacional'),
					//'options'=>array($model->proyecto_id => array('selected'=>true)),
					'htmlOptions' => array('id'=>'tipolicitacion','prompt' => 'Seleccionar tipo', /*'multiple' => false,*/ ),
				),
				'hint' => 'Tipo de importación a ser utiilzada en este producto.'
			)
		); 


 		echo $form->datePickerGroup(
			$presuImp,
			'fecha_llegada',
			array(
				'widgetOptions' => array(
					'htmlOptions'=> array('id'=>'fecha'),
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

		echo $form->textFieldGroup($presuImp, 'monto_presupuesto',array(/*'prepend'=>'Bs',*/'widgetOptions'=>array('htmlOptions'=> array('id'=>'montoPresupuesto'))));
		echo $form->textFieldGroup($presuImp, 'cantidad',array('widgetOptions'=>array('htmlOptions'=> array('id'=>'cantidad'))));
		echo $form->textFieldGroup($presuImp, 'descripcion',array('widgetOptions'=>array('htmlOptions'=> array('id'=>'descripcion'))));
		
		//Yii::app()->clientScript->registerScript("linkClick", "$('#nacional').click(function(){ $('#tipoPro').val('N');})
		//													   $('#importado').click(function(){ $('#tipoPro').val('I');})");
		//Yii::app()->clientScript->registerScript("link2Click", "$('#link2').click(function(){alert('link2 is clicked');})");




			//echo $form->checkboxGroup($model, 'checkbox');
			$this->widget(
			    'booster.widgets.TbButton',
			    array('buttonType' => 'submit',/*'url'=>array('/planificacion/importado','#'=>'pestanas'),*/ 'label' => 'Añadir')
			);
		

	}
		$this->endWidget();
		unset($form);
?>

<?php 

		//echo 'probando';
		//print_r($presuImps);
		
		//echo count($presuImps);
		$this->renderPartial('_importado',array('presuImps'=>$presuImps));

/*		echo '<h3>Lista de productos </h3>';
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
				'viewButtonUrl'=>null,
				'updateButtonUrl'=>null,
				'deleteButtonUrl'=>null,
			)
		);

		$gridDataProvider = new CArrayDataProvider($presuImps,array(
											    'keyField' => 'presupuesto_id',
											));
		$this->widget('booster.widgets.TbGridView', array(
		        'type' => 'striped bordered condensed',
		        'id'=>'presupuesto_id',
		        'dataProvider' => $gridDataProvider,
		        'template' => "{items}",
		        //'filter' => $presuProducto->search(),
		        'columns' => $gridColumns,
		    ));*/

		/*foreach ($presuImps as $key => $prepro) {
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