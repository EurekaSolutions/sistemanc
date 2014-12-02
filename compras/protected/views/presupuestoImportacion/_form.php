<?php
/* @var $this PresupuestoImportacionController */
/* @var $model PresupuestoImportacion */
/* @var $form TbActiveForm */
?>

<div class="form">

    <?php $form=$this->beginWidget('booster.widgets.TbActiveForm', array(
	'id'=>'presupuesto-importacion-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
)); ?>

    <p class="help-block">Fields with <span class="required">*</span> are required.</p>

    <?php echo $form->errorSummary($model); ?>

            <?php echo $form->textFieldGroup($model,'codigo_ncm_id',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>

            <?php echo $form->textFieldGroup($model,'presupuesto_id',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>

            <?php echo $form->textFieldGroup($model,'cantidad',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>

            <?php echo $form->textFieldGroup($model,'fecha_llegada',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>

            <?php echo $form->textFieldGroup($model,'monto_presupuesto',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>38)))); ?>

            <?php echo $form->textFieldGroup($model,'tipo',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>100)))); ?>

            <?php echo $form->textFieldGroup($model,'monto_ejecutado',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>38)))); ?>

            <?php echo $form->textFieldGroup($model,'divisa_id',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>

        <div class="form-actions">

    <?php $this->widget('booster.widgets.TbButton', array(
            'buttonType'=>'submit',
            'context'=>'primary',
            'label'=>$model->isNewRecord ? 'Crear' : 'Guardar',
        )); ?>

    </div>

    <?php $this->endWidget(); ?>

</div><!-- form -->