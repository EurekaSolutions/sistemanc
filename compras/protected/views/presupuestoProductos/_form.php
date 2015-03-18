<?php $form=$this->beginWidget('booster.widgets.TbActiveForm',array(
	'id'=>'presupuesto-productos-form',
	'enableAjaxValidation'=>false,
)); ?>

<p class="help-block">Los campos con <span class="required">*</span> son obligatarios.</p>

<?php
    foreach(Yii::app()->user->getFlashes() as $key => $message) {
        echo '<div class="flash-' . $key . '">' . $message . "</div>\n";
    }
?>

<?php echo $form->errorSummary($model); ?>

	<?php //echo $form->textFieldGroup($model,'presupuesto_id',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','type'=>'hidden','disabled'=>$model->isNewRecord?false:true)))); 
	 		//echo $form->hiddenField($model, 'presupuesto_id');
	?>

	<?php //echo $form->textFieldGroup($model,'unidad_id',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','disabled'=>$model->isNewRecord?false:true)))); ?>

	<?php echo $form->textFieldGroup($model,'costo_unidad',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>38)))); ?>

	<?php echo $form->textFieldGroup($model,'cantidad',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>

	<?php echo $form->textFieldGroup($model,'monto_presupuesto',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>38,'disabled'=>$model->isNewRecord?false:true)))); ?>

	<?php //echo $form->textFieldGroup($model,'tipo',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>60,'disabled'=>$model->isNewRecord?false:true)))); ?>

	<?php //echo $form->textFieldGroup($model,'monto_ejecutado',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>38,'disabled'=>$model->isNewRecord?false:true)))); ?>

	<?php //echo $form->textFieldGroup($model,'proyecto_partida_id',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','disabled'=>$model->isNewRecord?true:false)))); ?>

	<?php //echo $form->datePickerGroup($model,'fecha_estimada',array('widgetOptions'=>array('options'=>array(),'htmlOptions'=>array('class'=>'span5','disabled'=>$model->isNewRecord?false:true)), 'prepend'=>'<i class="glyphicon glyphicon-calendar"></i>', 'append'=>'Click on Month/Year to select a different Month/Year.')); ?>

<div class="form-actions">
	<?php $this->widget('booster.widgets.TbButton', array(
			'buttonType'=>'submit',
			'context'=>'primary',
			'label'=>$model->isNewRecord ? 'Create' : 'Modificar',
		)); ?>
</div>

<?php $this->endWidget(); ?>
