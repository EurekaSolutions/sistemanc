<?php
/* @var $this PresupuestoImportacionController */
/* @var $model PresupuestoImportacion */
/* @var $form TbActiveForm */
?>

<div class="form">

    <?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm', array(
	'id'=>'presupuesto-importacion-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>false,
)); ?>

    <p class="help-block">Fields with <span class="required">*</span> are required.</p>

    <?php echo $form->errorSummary($model); ?>

            <?php echo $form->textFieldControlGroup($model,'codigo_ncm_id',array('span'=>5)); ?>

            <?php echo $form->textFieldControlGroup($model,'presupuesto_id',array('span'=>5)); ?>

            <?php echo $form->textFieldControlGroup($model,'cantidad',array('span'=>5)); ?>

            <?php echo $form->textFieldControlGroup($model,'fecha_llegada',array('span'=>5)); ?>

            <?php echo $form->textFieldControlGroup($model,'monto_presupuesto',array('span'=>5,'maxlength'=>38)); ?>

            <?php echo $form->textFieldControlGroup($model,'tipo',array('span'=>5,'maxlength'=>100)); ?>

            <?php echo $form->textFieldControlGroup($model,'monto_ejecutado',array('span'=>5,'maxlength'=>38)); ?>

            <?php echo $form->textFieldControlGroup($model,'divisa_id',array('span'=>5)); ?>

        <div class="form-actions">
        <?php echo TbHtml::submitButton($model->isNewRecord ? 'Create' : 'Save',array(
		    'color'=>TbHtml::BUTTON_COLOR_PRIMARY,
		    'size'=>TbHtml::BUTTON_SIZE_LARGE,
		)); ?>
    </div>

    <?php $this->endWidget(); ?>

</div><!-- form -->