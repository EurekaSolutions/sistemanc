<div class="form" id="jobDialogForm">
<?php $form=$this->beginWidget('booster.widgets.TbActiveForm',array(
	'id'=>'proveedores-form',
	'enableAjaxValidation'=>false,
)); ?>

<p class="help-block">Los campos con <span class="required">*</span> son obligatorios.</p>

<?php //echo $form->errorSummary($model); ?>

	<?php echo $form->textFieldGroup($model,'rif',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>10)))); ?>

	<?php echo $form->textFieldGroup($model,'razon_social',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>255)))); ?>

	<?php //echo $form->textFieldGroup($model,'fecha',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>

<!--<div class="form-actions">
	<?php $this->widget('booster.widgets.TbButton', array(
			'buttonType'=>'submit',
			'context'=>'primary',
			'label'=>$model->isNewRecord ? 'Registrar' : 'Guardar',
		)); ?>
</div>-->

 <div class="form-actions">
        <?php echo CHtml::ajaxSubmitButton('Crear proveedor',CHtml::normalizeUrl(array('proveedores/create','render'=>false)),array('success'=>'js: function(data) {
                        $("#jobDialogForm").html("");
                        $("#jobDialogForm").append(data);
                       /* $("#jobDialog").dialog("close");*/
                    }'),array('id'=>'closeJobDialog')); ?>
</div>

<?php $this->endWidget();
?>
</div>

<?php
	unset($form);
?>