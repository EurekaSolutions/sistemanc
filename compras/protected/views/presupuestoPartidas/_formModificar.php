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

	<?php //echo $form->textFieldGroup($model,'partida_id',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5'))));
	
	//Yii::app()->clientScript->registerScriptFile(Yii::app()->baseUrl.'/javscript/jquery.number.min.js',CClientScript::POS_END);
	$list = array();
	$presuPartidas =array();
	foreach (Usuarios::model()->actual()->presupuestoPartidas as $key => $value) {
		if($value->partida != null)
			$presuPartidas[] = $value;
	}
	$list = CHtml::listData($presuPartidas, 'presupuesto_partida_id', function($presupuestoPartida) {
															//print_r($presupuestoPartida);
															//Yii::app()->end();
																return $presupuestoPartida->partida->etiquetaPartida();
															});
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
									        'htmlOptions'=>array('id'=>'partida',
														'ajax' => array(
																'type'=>'POST', //request type
																'url'=>CController::createUrl('presupuestoPartidas/montoDisponibleSustraendo'), //url to call.
																//Style: CController::createUrl('currentController/methodToCall')
																//'update'=>'#disponible', //selector to update
																'success' => 'function($data){ 
																	//alert($data);
																		$("#disponible").html($data);
																		//$("#partidaSum").html($data);
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

	<br>
	<?php     

	$listaEntes = array();
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
