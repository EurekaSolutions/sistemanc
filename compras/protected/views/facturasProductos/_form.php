<script type="text/javascript">
$( document ).ready(function() {
	$( "#Factura" ).click(function() {
		//$( ".target" ).change();
		if($( "#Factura" ).val())
		{
			$( "#closeButton").removeAttr('disabled');
		}
	});

	$( "#proyecto" ).change(function() {
			$( "#select2-chosen-2" ).val("");
			$( "#select2-chosen-2" ).html('<span class="select2-chosen" id="select2-chosen-2">Seleccione partida</span>');
			$( "#producto" ).html("");
			$( "#select2-chosen-3" ).val("");
			$( "#select2-chosen-3" ).html('<span class="select2-chosen" id="select2-chosen-3">Producto</span>');
	});

	

	$( "#partidasSus" ).change(function() {
			//$( "#producto" ).html("");
			//$( "#select2-chosen-3" ).val("");
			$( "#select2-chosen-3" ).html('<span class="select2-chosen" id="select2-chosen-3">Producto</span>');	
	});

});
</script>

<?php $form=$this->beginWidget('booster.widgets.TbActiveForm',array(
	'id'=>'facturas-productos-form',
	'enableAjaxValidation'=>false,
)); ?>

<?php
    foreach(Yii::app()->user->getFlashes() as $key => $message) {
        echo '<div class="flash-' . $key . '">' . $message . "</div>\n";
    }
?>


<p class="help-block">Los campos con <span class="required">*</span> son obligatorios.</p>

<?php echo $form->errorSummary($model); ?>

	<?php //echo $form->textFieldGroup($model,'factura_id',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>

	<div class="form-group">
	<?php 	
		$list = CHtml::listData(Facturas::model()->findAllByAttributes(array('ente_organo_id'=>Usuarios::model()->actual()->ente_organo_id, 'cierre_carga'=>false, 'anho' => Yii::app()->params['trimestresFechas'][Yii::app()->session['trimestreSeleccionado']]['anho'])), 'id', function($factura){return $factura->etiquetaFactura();});

		echo CHtml::label('Seleccionar factura', 'Factura');
		echo "<br>";
		$this->widget(
		    'booster.widgets.TbSelect2',
		    array(
		        'asDropDownList' => true,
		        'model' => $model,
		        
		        'attribute' => 'factura_id',
		        //'name' => 'factura_id',
		        'data' => $list,
		        'htmlOptions'=>array('id'=>'Factura',
    			 'ajax' => array(
									'type'=>'POST', //request type
									'url'=>CController::createUrl('facturasProductos/buscarProductosFactura'), //url to call.
									//Style: CController::createUrl('currentController/methodToCall')
									'update'=>'#lista_productos', //selector to update
									//'data'=>'js:javascript statement' 
									//leave out the data key to pass all form values through
							  )),
		        'options' => array(
		            //'tags' => array('proveedores'),
		            'placeholder' => 'Factura',
		            'width' => '40%',
		            'tokenSeparators' => array(',', ' ')
		        )
		    )
		);
	?>

	</div>
	
	<div class="form-group">
			<?php 
			$lista_acciones = CHtml::listData(Usuarios::model()->actual()->enteOrgano->acciones, function($accion) {
																		return CHtml::encode('a'.$accion->accion->accion_id);
																	}, function($accion) {
																		return CHtml::encode($accion->codigo_accion.' - '.$accion->accion->nombre);
																	});
			$lista_proyectos = CHtml::listData(Usuarios::model()->actual()->enteOrgano->proyectos, 'proyecto_id', function($proyecto) {
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
							'htmlOptions' => array(	/*'name'=>'Proyectos[0][proyecto_id]',*/ 'id'=>'proyecto', 'prompt' => 'Seleccionar proyecto', //'onChange'=>'submit','submit' => array('/planificacion/nacional','#'=>'proyecto')
												  'ajax' => array(
														'type'=>'POST', //request type
														'url'=>CController::createUrl('presupuestoPartidas/buscarpartidasproyecto'), //url to call.
														//Style: CController::createUrl('currentController/methodToCall')
														'update'=>'#partidasSus', //selector to update
														//'data'=>'js:javascript statement' 
														//leave out the data key to pass all form values through
												  )),
						),
						'hint' => 'Selecciona la Acción o Proyecto.'
					)
				); 


			$list = array();
			//
			//print_r($proyectoSel->findByPk($proyectoSel->proyecto_id)->presupuestoPartidas);
			//exit();
			if(!empty($proyectoSel->proyecto_id)){
				if(strstr($proyectoSel->proyecto_id, 'a'))
				{//Es un id de accion	

					$accionId = Proyectos::model()->accionId($proyectoSel->proyecto_id);
					
					$presuPartidas = PresupuestoPartidaAcciones::model()->presuPartidas($accionId);

				}else{//Es un id de proyecto

					$proyectoSel = Proyectos::model()->findByPk($proyectoSel->proyecto_id);

					if(Usuarios::model()->actual()->ente_organo_id != $proyectoSel->ente_organo_id)
						throw new CHttpException(403, "No se puede procesar la solicitud.");
					
					$presuPartidas = $proyectoSel->getPresuPartidas();
				}	
					$list = CHtml::listData($presuPartidas,'presupuesto_partida_id',function($presuPartida){return $presuPartida->partida->etiquetaPartida();});

			}
			
				echo $form->select2Group(
									$model,
									'presupuesto_partida_id',
									//'value'=>'',
									array(
										'wrapperHtmlOptions' => array(
											'class' => 'col-sm-5',
										),
										'widgetOptions' => array(
											'asDropDownList' => true,
											'data' => $list,
									        'htmlOptions'=>array('id'=>'partidasSus',
														'ajax' => array(
																'type'=>'POST', //request type
																'url'=>CController::createUrl('facturasProductos/buscarProductosPresupuestoPartida'), //url to call.
																//Style: CController::createUrl('currentController/methodToCall')
																'update'=>'#producto', //selector to update
																//'data'=>'js:javascript statement' 
																//leave out the data key to pass all form values through
														  )),
											'options' => array(
												//'tags' => array('clever', 'is', 'better', 'clevertech'),
												'placeholder' => 'Seleccione partida',
												// 'width' => '40%', 
												'tokenSeparators' => array(',', ' ')
											)
										)
									)
								);
			
		 ?>
	</div>



	<?php //echo $form->textFieldGroup($model,'proveedor_id',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>
	

	<div class="form-group">
	<?php 	

		echo $form->select2Group(
				$model,
				'producto_id',
				//'value'=>'',
				array(
					'wrapperHtmlOptions' => array(
						'class' => 'col-sm-5',
					),
					'widgetOptions' => array(
						'asDropDownList' => true,
						'data' => ($model->presupuesto_partida_id=='')?array():CHtml::listData($model->presupuestoPartida->listaProductos(), 'producto_id',function($producto){ return $producto->etiquetaProducto();} ),
				        'htmlOptions'=>array('id'=>'producto',	            
		        			'options' => array($model->producto_id=>array('selected'=>true)) // selected options by default
								        ),
						'options' => array(
							//'tags' => array('clever', 'is', 'better', 'clevertech'),
							'placeholder' => 'Seleccione producto',
							 'width' => '40%', 
							'tokenSeparators' => array(',', ' ')
						)
					)
				)
			);
		/*echo CHtml::label('Producto', 'producto');
		echo "<br>";
		$this->widget(
		    'booster.widgets.TbSelect2',
		    array(
		        'asDropDownList' => true,
		        'model' => $model,
		        'attribute' => 'producto_id',
		        //'value'=>$model->producto_id,
		        //'name' => 'factura_id',
		        'data' => ($model->presupuesto_partida_id=='')?array():CHtml::listData($model->presupuestoPartida->listaProductos(), 'producto_id',function($producto){ return $producto->etiquetaProducto();} ),
		        'htmlOptions'=>array('id'=>'producto',	            
		        			'options' => array($model->producto_id=>array('selected'=>true)) // selected options by default
								        ),
		        'options' => array(
		            //'tags' => array('proveedores'),
		            'placeholder' => 'Seleccione producto',
		            'width' => '40%',
		            'tokenSeparators' => array(',', ' ')
		        )
		    )
		);*/
	?>

	<?php //echo $form->textFieldGroup($model,'proveedor_id',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>
	</div>
<table>
<!-- 	<caption>table title and/or explanatory text</caption>
<thead>
	<tr>
		<th>header</th>
	</tr>
</thead> -->
	<tbody>
		<tr>
			<td>

	<?php echo $form->textFieldGroup($model,'costo_unitario',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>38)))); ?>
</td>
<td>
	<?php echo $form->textFieldGroup($model,'cantidad_adquirida',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>
	</td>
<td>
	<?php
		echo $form->select2Group($model, 'unidad_id',
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
	?>
</td>
<td>
	<?php //echo $form->textFieldGroup($model,'iva_id',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); 

	$criteria = new CDbCriteria();
	$activo = true;
	$criteria->condition = "sys_status='$activo'";      
	$list = CHtml::listData(Iva::model()->findAll($criteria), 'id', 'porcentaje');
			echo $form->dropDownListGroup(
					$model,
					'iva_id',
					array(
						'wrapperHtmlOptions' => array(
							'class' => 'col-sm-5',
						),
						'widgetOptions' => array(
							'data' => $list,
							'htmlOptions' => array(),
						)
					)
				);
		?>
		</td>
		</tr>
	</tbody>
</table>

<div class="form-actions">
	<?php $this->widget('booster.widgets.TbButton', array(
			'htmlOptions' => array('id'=> 'removeButton'),
			'buttonType'=>'submit',
			'context'=>'primary',
			'label'=>$model->isNewRecord ? 'Asociar Producto a Factura' : 'Asociar Producto a Factura',
		)); ?>



			<?php
				$this->widget('booster.widgets.TbButton', array(
				'htmlOptions' => array('id'=> 'closeButton', @$_POST['FacturasProductos']['factura_id'] ? '':'disabled'=> "disabled"),
				'buttonType'=>'ajaxSubmit',
				'context'=>'success',
				'label'=>'Finalizar carga',
				'url' => Yii::app()->createUrl('FacturasProductos/cerrar'),
	            'ajaxOptions' => array(
	                'type' => 'POST',
	                'success' => 'function(data){ 
	                                $( "#removeButton" ).remove();
	                                window.location.href ="'.CController::createUrl('facturas/admin').'";
	                }',
		            )
				));
		 ?>
</div>

<?php $this->endWidget(); ?>

<div id="lista_productos">
	<?php 		
		if(isset($model->factura_id))	 
			$this->renderPartial('_listaProductos', array('model'=>$model, 'dataProvider'=>$model->buscarProductosFactura($model->factura_id)));
				/*$this->widget('booster.widgets.TbGridView',array(
									'id'=>'facturas-productos-grid',
									'dataProvider'=>$model->buscarProductosFactura($model->factura_id),
									//'filter'=>new FacturasProductos(),
									'summaryText'=>'',
									'columns'=>array(
											//'id',
											//'factura_id',
											array('name'=>'producto_id', 'value'=>'$data->producto->etiquetaProducto()'),
											array('name' => 'costo_unitario', 'value'=>'number_format($data->costo_unitario,2)'),
											'cantidad_adquirida',
											array('name'=>'iva_id','value'=>'$data->iva->etiquetaPorcentaje()'),
											array('name'=>'unidad_id','value'=>'$data->unidad->nombre'),
											/*
											'fecha',
											'presupuesto_partida_id',
											
										array(
										'class'=>'booster.widgets.TbButtonColumn', 'template'=>'{delete}', 
											//'template'=>'{view}{update}<br>{delete}',
										),
									),
							));*/

							?>
</div>