<?php $form=$this->beginWidget('booster.widgets.TbActiveForm',array(
	'id'=>'presupuesto-partidas-form',
	'enableAjaxValidation'=>false,
	 'action'=>array('','#'=>'form')
)); ?>

<p class="help-block">Los campos con <span class="required">*</span> son oblitorios.</p>

<?php echo $form->errorSummary($model); ?>

<?php
    foreach(Yii::app()->user->getFlashes() as $key => $message) {
        echo '<div class="flash-' . $key . '">' . $message . "</div>\n";
    }
?>
<!-- 	<table style='width: 100%;' >
<caption>table title and/or explanatory text</caption>
<thead>
<tr>
	<th>header</th>
</tr>
</thead>
<tbody>
<tr>
	<td> -->
			<?php //echo $form->textFieldGroup($model,'partida_id',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5'))));
			
			//Yii::app()->clientScript->registerScriptFile(Yii::app()->baseUrl.'/javscript/jquery.number.min.js',CClientScript::POS_END);
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
		/*	$presuPartidas =array();
			foreach (Usuarios::model()->actual()->presupuestoPartidas as $key => $value) {
				if($value->partida != null)
					$presuPartidas[] = $value;
			}
			$list = CHtml::listData($presuPartidas, 'presupuesto_partida_id', function($presupuestoPartida) {
																	//print_r($presupuestoPartida);
																	//Yii::app()->end();
																		return $presupuestoPartida->partida->etiquetaPartida();
																	});*/
						echo $form->select2Group(
											$model,
											'sustraendo_id',
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
																		'url'=>CController::createUrl('presupuestoPartidas/montoDisponibleSustraendo'), //url to call.
																		//Style: CController::createUrl('currentController/methodToCall')
																		//'update'=>'#disponible', //selector to update
																		'success' => 'function($data){ 
																			//alert($data);
																				$("#disponible").html($data);

																		}',
																		//'data'=>'js:javascript statement' 
																		//leave out the data key to pass all form values through
																  )),
													'options' => array(
														//'tags' => array('clever', 'is', 'better', 'clevertech'),
														'placeholder' => 'Seleccione partida a sustraer.',
														// 'width' => '40%', 
														'tokenSeparators' => array(',', ' ')
													)
												)
											)
										);
					
					echo CHtml::label('Monto Disponible:&nbsp;', 'disponible');
					echo CHtml::label(isset($model->sustraendo_id)?number_format($this->loadModel($model->sustraendo_id)->montoDisponible(), 2, ',', '.').' Bs.':'','',array('style'=>'color: green;', 'id'=>'disponible'));
			 ?>

			<?php echo $form->textFieldGroup($model,'monto_transferir',array('prepend'=>'Bs.','widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>38)))); ?>

			<?php echo $form->checkboxGroup($model,'todo',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>38)))); ?>
	<!-- 	</td> -->

	<br>

<!-- 		<td> -->
			<!-- <td>data</td> -->
			<?php     

			 echo $form->dropDownListGroup( $proyectoSel,	'anho',
					array(
						'wrapperHtmlOptions' => array(
							'class' => 'col-sm-2',
						),

						'label'=>'Seleccione Acción Centralizada o Proyecto a cargar',
						'widgetOptions' => array(
							'data' => $listas,

							//'options'=>array($model->proyecto_id => array('selected'=>true)),
							'htmlOptions' => array(	/*'name'=>'Proyectos[1][proyecto_id]',*/'id'=>'proyecto2', 'prompt' => 'Seleccionar proyecto', //'onChange'=>'submit','submit' => array('/planificacion/nacional','#'=>'proyecto')
												  'ajax' => array(
														'type'=>'POST', //request type
														'url'=>CController::createUrl('presupuestoPartidas/buscarpartidasproyecto2'), //url to call.
														//Style: CController::createUrl('currentController/methodToCall')
														'update'=>'#partidaSum', //selector to update
														//'data'=>'js:javascript statement' 
														//leave out the data key to pass all form values through
												  )),
						),
						'hint' => 'Selecciona la Acción o Proyecto.'
					)
				); 


					echo $form->select2Group($model, 'presupuesto_partida_id',
			                        array(
			                            'wrapperHtmlOptions' => array(
			                                'class' => 'col-sm-5',
			                            ),
			                            'label'=>'Seleccione partida a transferir el dinero',
			                            'widgetOptions' => array(
			                                'asDropDownList' => true,
			                                'data' => $list,
			                                'htmlOptions'=>array('id'=>'partidaSum','ajax' => array(
																		'type'=>'POST', //request type
																		'url'=>CController::createUrl('presupuestoPartidas/montoDisponible'), //url to call.
																		//Style: CController::createUrl('currentController/methodToCall')
																		//'update'=>'#disponible', //selector to update
																		'success' => 'function($data){ 
																				$("#disponible2").html($data);
																		}',
																		//'data'=>'js:javascript statement' 
																		//leave out the data key to pass all form values through
																  )),
			                                'options' => array(
			                                    //'tags' => array('clever', 'is', 'better', 'clevertech'),
			                                    'placeholder' => 'Seleccionar partida a sumar.',
			                                    // 'width' => '40%', 
			                                    'tokenSeparators' => array(',', ' ')
			                                )
			                            )
			                        )
			                    );
					echo CHtml::label('Monto Disponible:&nbsp;', 'disponible2');
					echo CHtml::label(isset($model->presupuesto_partida_id)?number_format($this->loadModel($model->presupuesto_partida_id)->montoDisponible(), 2, ',', '.').' Bs.':'','',array('style'=>'color: blue;', 'id'=>'disponible2'));
			?>

<!-- 		</td>
	</tr>
	<tr>
<td colspan="" rowspan="" headers="">
	
</td>
<td colspan="" rowspan="" headers="">
</td>
	</tr>
	</tbody>
</table> -->
	<!-- 
	<?php echo $form->textFieldGroup($model,'monto_presupuestado',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>38)))); ?>
	
	<?php echo $form->datePickerGroup($model,'fecha_desde',array('widgetOptions'=>array('options'=>array(),'htmlOptions'=>array('class'=>'span5')), 'prepend'=>'<i class="glyphicon glyphicon-calendar"></i>', 'append'=>'Click on Month/Year to select a different Month/Year.')); ?>
	
	<?php echo $form->datePickerGroup($model,'fecha_hasta',array('widgetOptions'=>array('options'=>array(),'htmlOptions'=>array('class'=>'span5')), 'prepend'=>'<i class="glyphicon glyphicon-calendar"></i>', 'append'=>'Click on Month/Year to select a different Month/Year.')); ?>
	
	<?php echo $form->textFieldGroup($model,'tipo',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>1)))); ?>
	
	<?php echo $form->textFieldGroup($model,'anho',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>
	
	<?php echo $form->textFieldGroup($model,'ente_organo_id',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>
	
	<?php echo $form->textFieldGroup($model,'presupuesto_id',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?> -->

<div class="form-actions">
	<?php $this->widget('booster.widgets.TbButton', array(
			'buttonType'=>'submit',
			'context'=>'primary',
			'label'=>$model->isNewRecord ? 'Transferir' : 'Transferir',
		)); ?>
</div>

<?php $this->endWidget(); ?>
