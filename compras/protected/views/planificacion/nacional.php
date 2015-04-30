<?php
/* @var $this PlanificacionController */

$this->breadcrumbs=array(
	'Planificacion'=>array('/planificacion'),
	'Producto Nacional'/*=>array('/planificacion/nacional')*/,
);
?>

    <?php
        foreach(Yii::app()->user->getFlashes() as $key => $message) {
            echo '<div class="flash-' . $key . '">' . $message . "</div>\n";
        }
    ?>
    <h4 style="text-align: center;">CARGA DE PRODUCTOS NACIONALES</h4><br>
    
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


	 echo $form->dropDownListGroup( $proyectoSel,	'proyecto_id',
			array(
				'wrapperHtmlOptions' => array(
					'class' => 'col-sm-2',
				),
				'label'=>'Seleccione Acción Centralizada o Proyecto a cargar',
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
/*
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
					'htmlOptions' => array('id'=>'partida', 'prompt' => 'Seleccionar partida', //'onChange'=>'submit','submit' => array('/planificacion/nacional','#'=>'partida') 
										'ajax' => array(	
												'type'=>'POST', //request type
												'url'=>CController::createUrl('planificacion/buscarproductospartida',array('t'=>'n')), //url to call.
												//Style: CController::createUrl('currentController/methodToCall')
												'update'=>'#producto', //selector to update
												//'data'=>'js:javascript statement' 
												//leave out the data key to pass all form values through
										  )),
				),
				'hint' => 'Selecciona la partida correspondiente al proyecto para cargar sus productos.'
			)
		); */
    echo $form->select2Group($partidaSel, 'partida_id',
                        array(
                            'wrapperHtmlOptions' => array(
                                'class' => 'col-sm-5',
                            ),
                            'label'=>'Seleccione Partida para cargar sus productos',
                            'widgetOptions' => array(
                                'asDropDownList' => true,
                                'data' => CHtml::listData($partidas,'partida_id', function($partida){ return CHtml::encode($this->numeroPartida($partida).' - '.$partida->nombre);}),
                                'htmlOptions'=>array('id'=>'partida','onChange'=>'submit','submit' => array('/planificacion/nacional','#'=>'producto'),/*'ajax' => array(	
												'type'=>'POST', //request type
												'url'=>CController::createUrl('planificacion/buscarproductospartida',array('t'=>'n')), //url to call.
												//Style: CController::createUrl('currentController/methodToCall')
												'update'=>'#producto', //selector to update
												//'data'=>'js:javascript statement' 
												//leave out the data key to pass all form values through
										  )*/),			
                                'options' => array(
                                    //'tags' => array('clever', 'is', 'better', 'clevertech'),
                                    'placeholder' => 'Seleccionar partida',
                                    // 'width' => '40%', 
                                    'tokenSeparators' => array(',', ' ')
                                )
                            )
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
					if($(\'#producto\').val() == \'\')
					{
						$(\'#datos\').html("");
					}
					$(\'#unidad\').val(\'\');
					$(\'#costounidad\').val(\'\');
					$(\'#cantidad\').val(\'\');
		})');
?>
<?php
/*		 echo  $form->dropDownListGroup( $productoSel, 'producto_id',
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
		); */

    echo $form->select2Group($productoSel, 'producto_id',
                        array(
                            'wrapperHtmlOptions' => array(
                                'class' => 'col-sm-5',
                            ),
                            'label'=>'Seleccione el producto',
                            'hint' => 'Selecciona el producto para añadir.',
                            'widgetOptions' => array(
                                'asDropDownList' => true,
                                'data' => $productosPartidas,
                                'htmlOptions'=>array('id'=>'producto', 'onChange'=>'submit','submit' => array('/planificacion/nacional','#'=>'producto')),
                                'options' => array(
                                    //'tags' => array('clever', 'is', 'better', 'clevertech'),
                                    'placeholder' => 'Seleccionar producto',
                                    // 'width' => '40%', 
                                    'tokenSeparators' => array(',', ' ')
                                )
                            )
                        )
                    );

	if(!empty($productoSel->producto_id)){
 ?><div id="datos"><?php

	/********************** NACIONAL *****************************/
		


		echo $form->errorSummary($presuPro);

/*		echo  $form->dropDownListGroup( $presuPro, 'unidad_id',
			array(
				'wrapperHtmlOptions' => array(
					'class' => 'col-sm-5',
				),
				'label'=>'Unidad',
				'widgetOptions' => array(
					'data' => CHtml::listData(Unidades::model()->findAll(),'unidad_id', 'nombre'),
					//'options'=>array($model->proyecto_id => array('selected'=>true)),
					'htmlOptions' => array('id'=>'unidad', 'prompt' => 'Seleccionar unidad', //'multiple' => false,
						),
				),
				'hint' => 'Selecciona la unidad del producto.'
			)
		); */

    	echo $form->select2Group($presuPro, 'unidad_id',
                        array(
                            'wrapperHtmlOptions' => array(
                                'class' => 'col-sm-5',
                            ),
                            'label'=>'Unidad',
                            'widgetOptions' => array(
                                'asDropDownList' => true,
                                'data' => CHtml::listData(Unidades::model()->findAll(),'unidad_id', 'nombre'),
                                'htmlOptions'=>array('id'=>'unidad',),
                                'options' => array(
                                    //'tags' => array('clever', 'is', 'better', 'clevertech'),
                                    'placeholder' => 'Seleccionar unidad',
                                    // 'width' => '40%', 
                                    'tokenSeparators' => array(',', ' ')
                                )
                            )
                        )
                    );

		echo  $form->textFieldGroup($presuPro, 'costo_unidad',array('prepend'=>'Bs','widgetOptions'=>array('htmlOptions'=>array('id'=>'costounidad'))));
		echo  $form->textFieldGroup($presuPro, 'cantidad',array('widgetOptions'=>array('htmlOptions'=>array('id'=>'cantidad'))));

		//echo  $form->textFieldGroup($presuPro, 'fecha_estimada',array('widgetOptions'=>array('htmlOptions'=>array('id'=>'fecha_estimada'))));

		$ahno = Presupuestos::model()->findByAttributes(array('activo'=>true))->ahno;
 		echo $form->datePickerGroup(
			$presuPro,
			'fecha_estimada',
			array(
				'widgetOptions' => array(
					'htmlOptions'=> array('id'=>'fecha'),
					'options' => array(
						'format' => 'yyyy-m-d',
						'language' => 'es',
						'startDate'=>$ahno.'-01-01',
						'endDate'=>$ahno.'-12-31'
					),
				),

				'wrapperHtmlOptions' => array(
					'class' => 'col-sm-5',
				), 
				'hint' => 'Fecha de compra estimada.',
				'prepend' => '<i class="glyphicon glyphicon-calendar"></i>'
			)
		);


		echo $form->hiddenField($presuPro,'tipo',array('id'=>'tipoPro'));




			//echo $form->checkboxGroup($model, 'checkbox');
			$this->widget(
			    'booster.widgets.TbButton',
			    array('buttonType' => 'submit',/*'url'=>array('/planificacion/nacional','#'=>'pestanas'),*/ 'label' => 'Cargar producto')
			);


		?></div><?php 
	}
		$this->endWidget();
		unset($form);

		

?>
<?php
		echo '<h3>Lista de productos nacionales por partida seleccionada: </h3>';
		?> 

<div id='listaProductosNacionales'>
				<?php
		$this->renderPartial('_nacional',array('presuPros'=>$presuPros));
		?></div>
<?php 

	//echo count($presuPros);
	
		//echo 'probando';
		//print_r($presuPros);


	
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

 <script type="text/javascript">
		$( document ).ready(function() {
			$( "#producto").change(function() {
				$('#datos').html("");
			});

			$( "#partida").change(function() {
				$('#producto').html("");
				$( "#producto" ).append( '<option value="">Seleccionar producto</option>' );
				$('#datos').html("");
			});

			$( "#proyecto").change(function() {
				$('#partida').html("");
				$( "#partida" ).append( '<option value="">Seleccionar partida</option>' );
				$('#producto').html("");
				$( "#producto" ).append( '<option value="">Seleccionar producto</option>' );
				$('#datos').html("");
			});
		});
	</script>