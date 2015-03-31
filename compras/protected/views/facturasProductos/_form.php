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
		$list = CHtml::listData(Facturas::model()->findAllByAttributes(array('ente_organo_id'=>Usuarios::model()->actual()->ente_organo_id)), 'id', 'num_factura');

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
			if(isset($proyectoSel->proyecto_id)){
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
												'placeholder' => 'Seleccione partida.',
												// 'width' => '40%', 
												'tokenSeparators' => array(',', ' ')
											)
										)
									)
								);
			
		 ?>
	</div>

	<div class="form-group">
	<?php 	
	/*
		$list = CHtml::listData(PresupuestoPartidas::model()->findAllByAttributes(array('ente_organo_id'=>Usuarios::model()->actual()->ente_organo_id)), 
			'presupuesto_partida_id', function($presuPartida){ return $presuPartida->partida->etiquetaPartida();});
			
		echo CHtml::label('Seleccionar partida', 'partida');
		echo "<br>";
		$this->widget(
		    'booster.widgets.TbSelect2',
		    array(
		        'asDropDownList' => true,
		        'model' => $model,
		        
		        'attribute' => 'presupuesto_partida_id',
		        //'name' => 'factura_id',
		        'data' => $list,
		        'htmlOptions'=>array('id'=>'partida',
							'ajax' => array(
									'type'=>'POST', //request type
									'url'=>CController::createUrl('facturasProductos/buscarProductosPartida'), //url to call.
									//Style: CController::createUrl('currentController/methodToCall')
									'update'=>'#producto', //selector to update
									//'data'=>'js:javascript statement' 
									//leave out the data key to pass all form values through
							  )),
		        'options' => array(
		            //'tags' => array('proveedores'),
		            'placeholder' => 'Partida',
		            'width' => '40%',
		            'tokenSeparators' => array(',', ' ')
		        )
		    )
		);

					echo $form->select2Group(
						$model,
						'presupuesto_partida_id',
						array(
							'wrapperHtmlOptions' => array(
								'class' => 'col-sm-5',
							),
							'widgetOptions' => array(
								'asDropDownList' => true,
								'data' => $list,
						        'htmlOptions'=>array('id'=>'partida',
											'ajax' => array(
													'type'=>'POST', //request type
													'url'=>CController::createUrl('facturasProductos/buscarProductosPartida'), //url to call.
													//Style: CController::createUrl('currentController/methodToCall')
													'update'=>'#producto', //selector to update
													//'data'=>'js:javascript statement' 
													//leave out the data key to pass all form values through
											  )),
								'options' => array(
									//'tags' => array('clever', 'is', 'better', 'clevertech'),
									'placeholder' => 'type clever, or is, or just type!',
									// 'width' => '40%', 
									'tokenSeparators' => array(',', ' ')
								)
							)
						)
					);*/
	?>
	</div>

	<?php //echo $form->textFieldGroup($model,'proveedor_id',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>
	

	<div class="form-group">
	<?php 	
		//$productos = CController::createUrl('planificacion/listaProductosPartida',array('partidaId'=>$partidaSel->partida_id,'proyectoActualId'=>$proyectoSel->proyecto_id, 'tipo'=>'n'));
		//$list = CHtml::listData(Facturas::model()->findAll(), 'id', 'num_factura');

//print_r(CHtml::listData($model->presupuestoPartida->partida->productos, 'producto_id',function($producto){ return $producto->etiquetaProducto();} ));
		echo CHtml::label('Seleccionar producto', 'producto');
		echo "<br>";
		$this->widget(
		    'booster.widgets.TbSelect2',
		    array(
		        'asDropDownList' => true,
		        'model' => $model,
		        'attribute' => 'producto_id',
		        //'value'=>$model->producto_id,
		        //'name' => 'factura_id',
		        'data' => empty($model->getErrors())?array():CHtml::listData($model->presupuestoPartida->listaProductos(), 'producto_id',function($producto){ return $producto->etiquetaProducto();} ),
		        'htmlOptions'=>array('id'=>'producto',	            
		        			'options' => array($model->producto_id=>array('selected'=>true)) // selected options by default
								        ),
		        'options' => array(
		            //'tags' => array('proveedores'),
		            'placeholder' => 'Producto',
		            'width' => '40%',
		            'tokenSeparators' => array(',', ' ')
		        )
		    )
		);
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
	<?php //echo $form->textFieldGroup($model,'iva_id',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); 

	$list = CHtml::listData(Iva::model()->findAll(), 'id', 'porcentaje');
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
			'buttonType'=>'submit',
			'context'=>'primary',
			'label'=>$model->isNewRecord ? 'Asociar Producto a Factura' : 'Asociar Producto a Factura',
		)); ?>

			<?php $this->widget('booster.widgets.TbButton', array(
			'buttonType'=>'submit',
			'context'=>'primary',
			'label'=>$model->isNewRecord ? 'Finalizar carga' : 'Finalizar carga',
		)); ?>
</div>

<?php $this->endWidget(); ?>

<div id="lista_productos">
	<?php 		
		if(isset($model->factura_id))	 
				$this->widget('booster.widgets.TbGridView',array(
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
											/*
											'fecha',
											'presupuesto_partida_id',
											*/
										array(
										'class'=>'booster.widgets.TbButtonColumn',
											//'template'=>'{view}{update}<br>{delete}',
										),
									),
							));?>
</div><!-- 
<?php $this->widget('booster.widgets.TbGridView',array(
						'id'=>'facturas-productos-grid',
						'dataProvider'=>$model->search(),
						'filter'=>$model,
						'columns'=>array(
								//'id',
								//'factura_id',
								array('name'=>'producto_id', 'value'=>'$data->producto->etiquetaProducto()'),
								array('name' => 'costo_unitario', 'value'=>'number_format($data->costo_unitario,2)'),
								'cantidad_adquirida',
								array('name'=>'iva_id','value'=>'$data->iva->etiquetaPorcentaje()'),
								/*
								'fecha',
								'presupuesto_partida_id',
								*/
							array(
							'class'=>'booster.widgets.TbButtonColumn',
								//'template'=>'{view}{update}<br>{delete}',
							),
						),
				)); ?> -->





<script type="text/javascript">
/*    $(document).ready(function() {
    	var numId = 1;
        $("#add").click(function() {
        		$clone = $("#mytable tbody>tr:last").clone(true);
				$('#mytable tbody>tr:last').clone(true).attr("id",$clone.attr("id").replace(/\d+$/, function(str) { return parseInt(str) + 1; } )).insertAfter("#mytable tbody>tr:last");
						//$("#mytable tbody>tr:last").each(function() {this.reset();});
						numId++;
					    //$('#mytable tbody>tr:last').attr('id','producto'+numId);
					    $('#mytable tbody>tr:last>td>a').attr('id','delete'+numId);
		
					        $("#delete"+numId).click(function(event) {
						    	//alert('#mytable tbody>tr #'+$('#'+event.target.id).parent().parent().attr('id'));
						    	if($('#mytable tr').length >1)
        						{	
									$('#mytable tbody>tr#'+$('#'+event.target.id).parent().parent().attr('id')).remove();
								}
							          return false;
						    });

          return false;
        });

        $("#delete1").click(function(event) {
	    	//alert('#mytable tbody>tr #'+$('#'+event.target.id).parent().parent().attr('id'));
	    	if($('#mytable tr').length >1)
        						{	
				$('#mytable tbody>tr#'+$('#'+event.target.id).parent().parent().attr('id')).remove();
		          return false;
		          }
	    });

    });
*/</script>

<!-- 
<?php echo CHtml::ajaxLink('Agregar Producto', CController::createUrl('facturasProductos/filaProducto'), array(
									'type'=>'POST', //request type
									//'url'=>CController::createUrl('facturasProductos/filaProducto'), //url to call.
									//Style: CController::createUrl('currentController/methodToCall')
									//'update'=>'#producto', //selector to update
									'success' => 'function(html){ alert(html);
					        		$clone = $("#mytable tbody>tr:last").clone(true);
									$clone.attr("id",$clone.attr("id").replace(/\d+$/, function(str) { return parseInt(str) + 1; } )).insertAfter("#mytable tbody>tr:last");

									$("#mytable tbody>tr:last").html(html);
									$("#facturas-productos-fila").remove();
						//alert($("#retorno").html());
									//$("#mytable tbody>tr:last").html($("#retorno").html());
									//$("#retorno").html("AQUI ESTOY")

									}',
									//'complete' => 'function(html){ $("#mytable tbody>tr:last").insertAfter(html);}'
									//'data'=>'js:javascript statement' 
									//leave out the data key to pass all form values through
							  )); ?> -->

						<!--	  <a  id="add">+</a> </td>
  <table id="mytable" width="300" border="1" cellspacing="0" cellpadding="2">
  <tbody>
<tr>
  <!--<td><?= CHtml::label('Costo unitario', ''); ?></td>
  <td><?= CHtml::label('Cantidad Adquirida', ''); ?></td>
  <td><?= CHtml::label('Iva', ''); ?></td>-->
  <!--
</tr>
    <tr id='producto1' class="producto">
<td> <?php 	

		$list = CHtml::listData(PresupuestoPartidas::model()->findAllByAttributes(array('ente_organo_id'=>Usuarios::model()->findByPk(Yii::app()->user->getId())->enteOrgano->ente_organo_id)), 
			'partida_id', function($presuPartida){ return $presuPartida->partida->etiquetaPartida();});

		echo CHtml::label('Seleccionar partida', 'partida');
		echo "<br>";
		$this->widget(
		    'booster.widgets.TbSelect2',
		    array(
		        'asDropDownList' => true,
		        'model' => $model,
		        
		        'attribute' => 'presupuesto_partida_id',
		        //'name' => 'factura_id',
		        'data' => $list,
		        'htmlOptions'=>array('id'=>'partida',
							'ajax' => array(
									'type'=>'POST', //request type
									'url'=>CController::createUrl('facturasProductos/buscarProductosPartida'), //url to call.
									//Style: CController::createUrl('currentController/methodToCall')
									'update'=>'#producto', //selector to update
									//'data'=>'js:javascript statement' 
									//leave out the data key to pass all form values through
							  )),
		        'options' => array(
		            //'tags' => array('proveedores'),
		            'placeholder' => 'Partida',
		            'width' => '40%',
		            'tokenSeparators' => array(',', ' ')
		        )
		    )
		);
	?>
</td>
<td>
		<?php 	
//$productos = CController::createUrl('planificacion/listaProductosPartida',array('partidaId'=>$partidaSel->partida_id,'proyectoActualId'=>$proyectoSel->proyecto_id, 'tipo'=>'n'));
//$list = CHtml::listData(Facturas::model()->findAll(), 'id', 'num_factura');

echo CHtml::label('Seleccionar producto', 'producto');
echo "<br>";
$this->widget(
    'booster.widgets.TbSelect2',
		    array(
		        'asDropDownList' => true,
		        'model' => $model,
		        
		        'attribute' => 'producto_id',
		        //'name' => 'factura_id',
		        'data' => array(),
		        'htmlOptions'=>array('id'=>'producto',),
		        'options' => array(
		            //'tags' => array('proveedores'),
		            'placeholder' => 'Producto',
		            'width' => '40%',
		            'tokenSeparators' => array(',', ' ')
		        )
		    )
		);
	?>
 </td>

      <td>	<?php echo $form->textFieldGroup($model,'costo_unitario',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5', 'name'=>'FacturasProductos[costo_unitario][]','maxlength'=>38)))); ?>
     </td>
      <td><?php echo $form->textFieldGroup($model,'cantidad_adquirida',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','name'=>'FacturasProductos[cantidad_adquirida][]')))); ?>
      </td>
      <td>	<?php

				$list = CHtml::listData(Iva::model()->findAll(), 'id', 'porcentaje');
			echo $form->dropDownListGroup(
					$model,
					'iva_id',
					array(
						'wrapperHtmlOptions' => array(
							'class' => 'col-sm-5',
						),
						'widgetOptions' => array(
							'data' => $list,
							'htmlOptions' => array('name'=>'FacturasProductos[iva][]',),
						)
					)
				);
		?> </td>
      <td><a  id="delete1">-</a> </td>
    </tr>
    </tbody>
  </table> -->
