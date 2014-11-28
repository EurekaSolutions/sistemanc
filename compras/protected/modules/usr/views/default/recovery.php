<?php /*
@var $this DefaultController
@var $model RecoveryForm */

$title = Yii::t('UsrModule.usr', 'Username or password recovery');
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
	'focus'=>array($model,$model->scenario==='reset' ? 'newPassword' : 'usuario'),
)); ?>

	<p class="note"><?php echo Yii::t('UsrModule.usr', 'Fields marked with <span class="required">*</span> are required.'); ?></p>

	<?php echo $form->errorSummary($model); ?>

<?php if ($model->scenario === 'reset'): ?>
	<?php echo $form->hiddenField($model,'usuario'); ?>
	<?php echo $form->hiddenField($model,'correo'); ?>
	<?php echo $form->hiddenField($model,'llave_activacion'); ?>

<?php $this->renderPartial('_newpassword', array('form'=>$form, 'model'=>$model)); ?>
<?php else: ?>
	<div class="control-group">
		<?php echo $form->labelEx($model,'usuario'); ?>
		<?php echo $form->textField($model,'usuario'); ?>
		<?php echo $form->error($model,'usuario'); ?>
	</div>

	<div class="control-group">
		<?php echo $form->labelEx($model,'correo'); ?>
		<?php echo $form->textField($model,'correo'); ?>
		<?php echo $form->error($model,'correo'); ?>
	</div>

<?php if($model->asa('captcha') !== null): ?>
<?php $this->renderPartial('_captcha', array('form'=>$form, 'model'=>$model)); ?>
<?php endif; ?>
<?php endif; ?>

	<div class="buttons">
		<?php echo CHtml::submitButton(Yii::t('UsrModule.usr', 'Submit'), array('class'=>$this->module->submitButtonCssClass)); ?>
	</div>

<?php $this->endWidget(); ?>
</div><!-- form -->
