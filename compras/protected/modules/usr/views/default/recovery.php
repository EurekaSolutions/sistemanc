<?php /*
@var $this DefaultController
@var $model RecoveryForm */

$title = Yii::t('UsrModule.usr', 'Recuperación de cuenta de usuario o contraseña.');
if (isset($this->breadcrumbs))
	$this->breadcrumbs=array($this->module->id, $title);
$this->pageTitle = Yii::app()->name.' - '.$title;
?>
<h1><?php echo $title; ?></h1>

<?php $this->widget('usr.components.UsrAlerts', array('cssClassPrefix'=>$this->module->alertCssClassPrefix)); ?>

<div class="<?php echo $this->module->formCssClass; ?>">
<?php $form=$this->beginWidget($this->module->formClass, array(
	'id'=>'recovery-form',
	'enableClientValidation'=>true,
	'clientOptions'=>array(
		'validateOnSubmit'=>true,
	),
	'focus'=>array($model,$model->scenario==='reset' ? 'newPassword' : 'codigo_onapre'),
)); ?>

	<p class="note"><?php echo Yii::t('UsrModule.usr', 'Campos marcados con <span class="required">*</span> son obligatorios.'); ?></p>

	<?php echo $form->errorSummary($model); ?>

<?php if ($model->scenario === 'reset'): ?>
	<?php echo $form->hiddenField($model,'usuario'); ?>
	<?php echo $form->hiddenField($model,'codigo_onapre'); ?>
	<?php echo $form->hiddenField($model,'correo'); ?>
	<?php echo $form->hiddenField($model,'llave_activacion'); ?>

<?php $this->renderPartial('_newpassword', array('form'=>$form, 'model'=>$model)); ?>
<?php else: ?>


	<?php echo $form->textFieldGroup($model, 'codigo_onapre'); ?>

	<?php echo $form->textFieldGroup($model, 'correo'); ?>

<?php if($model->asa('captcha') !== null): ?>
<?php 	$this->renderPartial('_captcha', array('form'=>$form, 'model'=>$model)); ?>
<?php endif; ?>
<?php endif; ?>

	<div class="buttons">
		<?php echo CHtml::submitButton(Yii::t('UsrModule.usr', 'Enviar'), array('class'=>$this->module->submitButtonCssClass)); ?>
	</div>

<?php $this->endWidget(); ?>
</div><!-- form -->
