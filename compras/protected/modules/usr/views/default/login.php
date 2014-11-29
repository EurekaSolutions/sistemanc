<?php /*
@var $this DefaultController
@var $model LoginForm */

$title = Yii::t('UsrModule.usr', 'Iniciar Sesión');
if (isset($this->breadcrumbs))
	$this->breadcrumbs=array($this->module->id, $title);
$this->pageTitle = Yii::app()->name.' - '.$title;
?>
<h1><?php echo $title; ?></h1>

<?php $this->widget('usr.components.UsrAlerts', array('cssClassPrefix'=>$this->module->alertCssClassPrefix)); ?>
<div class="<?php echo $this->module->formCssClass; ?>" style="min-height:450px;">
<div style="float:left">
<?php $form=$this->beginWidget($this->module->formClass, array(
	'id'=>'login-form',
	'enableClientValidation'=>true,
	'clientOptions'=>array(
		'validateOnSubmit'=>true,
	),
	'focus'=>array($model,'username'),
)); ?>

	<p class="note"><?php echo Yii::t('UsrModule.usr', 'Campos marcados con <span class="required">*</span> son obligatorios.'); ?></p>

	<?php echo $form->errorSummary($model); ?>

<!-- 	<div class="control-group">
	<?php /*echo $form->labelEx($model,'username'); ?>
	<?php echo $form->textField($model,'username'); ?>
	<?php echo $form->error($model,'username');*/ ?>
</div> -->
	<?php echo $form->textFieldGroup($model,'username');?>

<!-- 	<div class="control-group">
	<?php /*echo $form->labelEx($model,'password'); ?>
	<?php echo $form->passwordField($model,'password'); ?>
	<?php echo $form->error($model,'password'); */?>
</div> -->

	<?php echo $form->passwordFieldGroup($model,'password');?>

<?php if ($this->module->rememberMeDuration > 0): ?>
	<div class="rememberMe control-group">
		<?php echo $form->label($model,'rememberMe', array('label'=>$form->checkBox($model,'rememberMe').$model->getAttributeLabel('rememberMe'), 'class'=>'checkbox')); ?>
		<?php echo $form->error($model,'rememberMe'); ?>
	</div>
<?php endif; ?>

	<div class="buttons">
		<?php echo CHtml::submitButton(Yii::t('UsrModule.usr', 'Iniciar Sesión'), array('class'=>$this->module->submitButtonCssClass)); ?>
	</div>
<?php if ($this->module->recoveryEnabled): ?>
	<p>
		<?php echo Yii::t('UsrModule.usr', '¿No recuerda el nombre de usuario o contraseña?'); ?>
		<?php echo Yii::t('UsrModule.usr', 'Ir a {link}.', array(
			'{link}'=>CHtml::link(Yii::t('UsrModule.usr', 'recuperar la contraseña'), array('recovery')),
		)); ?>
	</p>
<?php endif; ?>
<?php if ($this->module->registrationEnabled): ?>
	<p>
		<?php echo Yii::t('UsrModule.usr', '¿Aún no tiene una cuenta?'); ?>
		<?php echo Yii::t('UsrModule.usr', 'Ir a {link}.', array(
			'{link}'=>CHtml::link(Yii::t('UsrModule.usr', 'registro'), array('register')),
		)); ?>
	</p>
<?php endif; ?>
<?php if ($this->module->hybridauthEnabled()): ?>
    <p>
        <?php //echo CHtml::link(Yii::t('UsrModule.usr', 'Sign in using one of your social sites account.'), array('hybridauth/login')); ?>
        <?php $this->renderPartial('_login_remote'); ?>
    </p>
<?php endif; ?>

<?php $this->endWidget(); ?>
</div><!-- form -->

<div>
	<br/><br/><br/>
	Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas "Letraset", las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.
</div>
</div>