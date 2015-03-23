<?php $form=$this->beginWidget('booster.widgets.TbActiveForm',array(
	'id'=>'partidas-form',
	'enableAjaxValidation'=>false,
)); ?>

<p class="help-block">Los campos con <span class="required">*</span> son obligatorios.</p>

<?php echo $form->errorSummary($model); ?>

	<?php echo $form->checkBoxGroup($model,'habilitada'); ?>
	
	<?php echo $form->textFieldGroup($model,'p1',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>4,'disabled'=>$model->isNewRecord?false:true)))); ?>

	<?php echo $form->textFieldGroup($model,'p2',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>4,'disabled'=>$model->isNewRecord?false:true)))); ?>

	<?php echo $form->textFieldGroup($model,'p3',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>4,'disabled'=>$model->isNewRecord?false:true)))); ?>

	<?php echo $form->textFieldGroup($model,'p4',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>4,'disabled'=>$model->isNewRecord?false:true)))); ?>

	<?php echo $form->textAreaGroup($model,'nombre', array('widgetOptions'=>array('htmlOptions'=>array('rows'=>6, 'cols'=>50, 'class'=>'span8','disabled'=>$model->isNewRecord?false:true)))); ?>

	

<div class="form-actions">
	<?php $this->widget('booster.widgets.TbButton', array(
			'buttonType'=>'submit',
			'context'=>'primary',
			'label'=>$model->isNewRecord ? 'Create' : 'Save',
		)); ?>
</div>

<?php $this->endWidget(); ?>
