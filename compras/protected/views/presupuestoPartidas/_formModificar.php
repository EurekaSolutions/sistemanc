<?php $form=$this->beginWidget('booster.widgets.TbActiveForm',array(
	'id'=>'presupuesto-partidas-form',
	'enableAjaxValidation'=>false,
)); ?>

<p class="help-block">Fields with <span class="required">*</span> are required.</p>

<?php echo $form->errorSummary($model); ?>

	<?php //echo $form->textFieldGroup($model,'partida_id',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5'))));

	$list = array();

	$list = CHtml::listData(Usuarios::model()->actual()->presupuestoPartidas, 'presupuesto_partida_id', function($presupuestoPartida) {
															//print_r($presupuestoPartida->partida);
															//Yii::app()->end();
																return $presupuestoPartida->partida->etiquetaPartida();
															});
				echo $form->select2Group(
									$modelSustraendo,
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
																//'update'=>'#disponible', //selector to update
																'success' => 'function($data){ 
																		$("#disponible").html("0");
																		$("#partidaSum").html($data);
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

			echo CHtml::label('0','disponible',array('style'=>'color: green;'));
	 ?>

	<?php     

	$listaEntes = array();
			echo $form->select2Group($model, 'presupuesto_partida_id',
	                        array(
	                            'wrapperHtmlOptions' => array(
	                                'class' => 'col-sm-5',
	                            ),
	                            'label'=>'Seleccione el ente',
	                            'widgetOptions' => array(
	                                'asDropDownList' => true,
	                                'data' => $listaEntes,
	                                'htmlOptions'=>array('id'=>'partidaSum',),
	                                'options' => array(
	                                    //'tags' => array('clever', 'is', 'better', 'clevertech'),
	                                    'placeholder' => 'Seleccionar partida a sumar.',
	                                    // 'width' => '40%', 
	                                    'tokenSeparators' => array(',', ' ')
	                                )
	                            )
	                        )
	                    );
	?><!-- 
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
			'label'=>$model->isNewRecord ? 'Create' : 'Save',
		)); ?>
</div>

<?php $this->endWidget(); ?>
