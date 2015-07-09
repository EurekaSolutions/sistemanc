<?php $form=$this->beginWidget('booster.widgets.TbActiveForm',array(
	'id'=>'proveedores-cuentas-form',
	'enableAjaxValidation'=>false,
)); ?>

<p class="help-block">Fields with <span class="required">*</span> are required.</p>

<?php //echo $form->errorSummary($model); ?>

	<?php echo $form->textFieldGroup($model,'codigo_swift',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>255)))); ?>

	<?php echo $form->textFieldGroup($model,'num_cuenta_bancaria',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>255)))); ?>

	<?php echo $form->textFieldGroup($model,'proveedor_id',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>

	<?php /*echo $form->textFieldGroup($model,'ente_organo_id',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); */?>

<div class="form-actions">
	<?php $this->widget('booster.widgets.TbButton', array(
			'buttonType'=>'submit',
			'context'=>'primary',
			'label'=>$model->isNewRecord ? 'Añadir' : 'Guardar',
		)); ?>
</div>

<?php $this->endWidget(); ?>
