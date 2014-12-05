<?php
/* @var $this EntesOrganosController */
/* @var $model EntesOrganos */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'entes-organos-crearente-form',
	// Please note: When you enable ajax validation, make sure the corresponding
	// controller action is handling ajax validation correctly.
	// See class documentation of CActiveForm for details on this,
	// you need to use the performAjaxValidation()-method described there.
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'nombre'); ?>
		<?php echo $form->textField($model,'nombre'); ?>
		<?php echo $form->error($model,'nombre'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'tipo'); ?>
		<?php echo $form->textField($model,'tipo'); ?>
		<?php echo $form->error($model,'tipo'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'codigo_onapre'); ?>
		<?php echo $form->textField($model,'codigo_onapre'); ?>
		<?php echo $form->error($model,'codigo_onapre'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'rif'); ?>
		<?php echo $form->textField($model,'rif'); ?>
		<?php echo $form->error($model,'rif'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'creado_por'); ?>
		<?php echo $form->textField($model,'creado_por'); ?>
		<?php echo $form->error($model,'creado_por'); ?>
	</div>


	<div class="row buttons">
		<?php echo CHtml::submitButton('Submit'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->