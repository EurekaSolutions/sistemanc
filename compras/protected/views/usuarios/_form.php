<?php
/* @var $this UsuariosController */
/* @var $model Usuarios */
/* @var $form TbActiveForm */
?>

<div class="form">

    <?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm', array(
	'id'=>'usuarios-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// There is a call to performAjaxValidation() commented in generated controller code.
	// See class documentation of CActiveForm for details on this.
	'enableAjaxValidation'=>true,
)); ?>

    <p class="help-block">Fields with <span class="required">*</span> are required.</p>

    <?php echo $form->errorSummary($model); ?>

            <?php echo $form->textFieldControlGroup($model,'codigo_onapre',array('span'=>5,'maxlength'=>20, 'disabled'=>$model->isNewRecord ? false:true)); ?>

            <?php echo $form->textFieldControlGroup($model,'usuario',array('span'=>5,'maxlength'=>50, 'disabled'=>$model->isNewRecord ? false:true)); ?>

            <?php echo $form->passwordFieldControlGroup($model,'contrasena',array('span'=>5,'maxlength'=>50)); ?>

            <?php echo $form->passwordFieldControlGroup($model,'repetir_contrasena',array('span'=>5,'maxlength'=>50)); ?>

            <?php echo $form->textFieldControlGroup($model,'correo',array('span'=>5,'maxlength'=>255)); ?>

            <?php //echo $form->textFieldControlGroup($model,'creado_el',array('span'=>5)); ?>

            <?php //echo $form->textFieldControlGroup($model,'actualizado_el',array('span'=>5)); ?>

        <div class="form-actions">
        <?php echo TbHtml::submitButton($model->isNewRecord ? 'Registrar' : 'Actualizar',array(
		    'color'=>TbHtml::BUTTON_COLOR_PRIMARY,
		    'size'=>TbHtml::BUTTON_SIZE_LARGE,
		)); ?>
    </div>

    <?php $this->endWidget(); ?>

</div><!-- form -->