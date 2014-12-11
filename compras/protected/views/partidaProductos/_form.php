<?php $form=$this->beginWidget('booster.widgets.TbActiveForm',array(
	'id'=>'partida-productos-form',
	'enableAjaxValidation'=>false,
)); ?>

<p class="help-block">Fields with <span class="required">*</span> are required.</p>

<?php echo $form->errorSummary($model); ?>
	
	<?php

		echo $form->dropDownListGroup($model , 'partida_id',
										array(
											'wrapperHtmlOptions' => array(
												'class' => 'col-sm-2',
											),
											'label'=>'Seleccione partida especifica',
											'widgetOptions' => array(

												'data' => $especificas_lista,
												//'options'=>array($model->proyecto_id => array('selected'=>true)),
												'htmlOptions' => array('prompt' => 'Seleccione partida especifica'),
											)
										)
		); 

	?>
	

	<?php 

		echo $form->dropDownListGroup($model , 'producto_id',
										array(
											'wrapperHtmlOptions' => array(
												'class' => 'col-sm-2',
											),
											'label'=>'Seleccione producto',
											'widgetOptions' => array(

												'data' => $productos,
												//'options'=>array($model->proyecto_id => array('selected'=>true)),
												'htmlOptions' => array('prompt' => 'Seleccione producto'),
											)
										)
		); 


	?>

	<?php 

		echo $form->dropDownListGroup($model , 'tipo_operacion',
										array(
											'wrapperHtmlOptions' => array(
												'class' => 'col-sm-2',
											),
											'label'=>'Seleccione producto',
											'widgetOptions' => array(

												'data' => $operacion,
												//'options'=>array($model->proyecto_id => array('selected'=>true)),
												'htmlOptions' => array('prompt' => 'Seleccione producto'),
											)
										)
		); ?>


	<?php echo $form->datePickerGroup($model,'fecha_desde',array('widgetOptions'=>array('options'=>array('format' => 'yyyy-m-d'),'htmlOptions'=>array('class'=>'span5')), 'prepend'=>'<i class="glyphicon glyphicon-calendar"></i>', /*'append'=>'Click on Month/Year to select a different Month/Year.'*/)); ?>

	<?php echo $form->datePickerGroup($model,'fecha_hasta',array('widgetOptions'=>array('options'=>array('format' => 'yyyy-m-d'),'htmlOptions'=>array('class'=>'span5')), 'prepend'=>'<i class="glyphicon glyphicon-calendar"></i>', /*'append'=>'Click on Month/Year to select a different Month/Year.'*/)); ?>

<div class="form-actions">
	<?php $this->widget('booster.widgets.TbButton', array(
			'buttonType'=>'submit',
			'context'=>'primary',
			'label'=>$model->isNewRecord ? 'Añadir producto a partida' : 'Guardar',
		)); ?>
</div>

<?php $this->endWidget(); ?>
