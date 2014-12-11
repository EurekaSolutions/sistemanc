<?php /*
@var $this DefaultController
@var $model RecoveryForm */

$title = Yii::t('UsrModule.usr', 'Recupera tu cuenta');
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
	'focus'=>array($model,$model->scenario==='reset' ? 'newPassword' : 'correo'),
)); ?>

	<p><!-- Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas "Letraset", las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum. --></p>
	

	<br/>
	<p class="note"><?php echo Yii::t('UsrModule.usr', 'Campos marcados con <span class="required">*</span> son obligatorios.'); ?></p>


	<?php echo $form->errorSummary($model); ?>

<?php if ($model->scenario === 'reset'): ?>
	<?php echo $form->hiddenField($model,'usuario'); ?>
	<?php //echo $form->hiddenField($model,'codigo_onapre'); ?>
	<?php echo $form->hiddenField($model,'correo'); ?>
	<?php echo $form->hiddenField($model,'llave_activacion');  ?>

<?php $this->renderPartial('_newpassword', array('form'=>$form, 'model'=>$model)); ?>
<?php else: ?>


	<?php //echo $form->textFieldGroup($model, 'cedula'); ?>

	<?php echo $form->textFieldGroup($model, 'correo'); ?>

<?php endif; ?>
<?php if($model->asa('captcha') !== null): ?>
<?php 	$this->renderPartial('_captcha', array('form'=>$form, 'model'=>$model)); ?>
<?php endif; ?>


	<div class="buttons">
		<?php echo CHtml::submitButton(Yii::t('UsrModule.usr', 'Enviar'), array('class'=>$this->module->submitButtonCssClass)); ?>
	</div>
	<br><br>
<?php echo CHtml::link('Regresar a la página de inicio',Yii::app()->createAbsoluteUrl('/')) ?>
<?php $this->endWidget(); ?>
</div><!-- form -->
