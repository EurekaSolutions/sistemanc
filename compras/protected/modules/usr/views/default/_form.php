<?php /*
@var $this CController
@var $model ProfileForm
@var $passwordForm PasswordForm
 */
?>

	<?php echo $form->textFieldGroup($model,'cedula',array('widgetOptions'=> array( 'htmlOptions'=>array('span'=>3,'maxlength'=>20,'disabled'=>true /*$model->scenario !== 'register' ? true:false*/)))); ?>
	
	<?php echo $form->textFieldGroup($model,'correo',array('widgetOptions'=> array( 'htmlOptions' => array('span'=>3,'maxlength'=>50,'disabled'=>true)))); ?>
	
	<?php echo $form->textFieldGroup($model,'usuario',array('widgetOptions'=> array( 'htmlOptions' => array('span'=>3,'maxlength'=>50)))); ?>

	

<!-- 	<div class="control-group">
	<?php /*echo $form->labelEx($model,'usuario'); ?>
	<?php echo $form->textField($model,'usuario'); ?>
	<?php echo $form->error($model,'usuario');*/ ?>
</div>

<div class="control-group">
	<?php /*echo $form->labelEx($model,'correo'); ?>
	<?php echo $form->textField($model,'correo'); ?>
	<?php echo $form->error($model,'correo');*/ ?>
</div> -->

<?php if ($model->scenario !== 'register'): ?>

	<?php echo $form->passwordFieldGroup($model,'contrasena',array('widgetOptions'=> array( 'htmlOptions' => array('span'=>3,'maxlength'=>50)))); ?>

<!-- 	<div class="control-group">
	<?php /*echo $form->labelEx($model,'contrasena'); ?>
	<?php echo $form->passwordField($model,'contrasena', array('autocomplete'=>'off')); ?>
	<?php echo $form->error($model,'contrasena');*/ ?>
</div>

 --><?php endif; ?>


<?php if (isset($passwordForm) && $passwordForm !== null): ?>
<?php $this->renderPartial('/default/_newpassword', array('form'=>$form, 'model'=>$passwordForm)); ?>
<?php endif; ?>


<?php if ($model->getIdentity() instanceof IPictureIdentity && !empty($model->pictureUploadRules)):
	$picture = $model->getIdentity()->getPictureUrl(80,80);
	if ($picture !== null) {
		$url = $picture['url'];
		unset($picture['url']);
	}
?>
	<div class="control-group">
		<?php echo $form->labelEx($model,'picture'); ?>
		<?php echo $picture === null ? '' : CHtml::image($url, Yii::t('UsrModule.usr', 'Profile picture'), $picture); ?><br/>
		<?php echo $form->fileField($model,'picture'); ?>
		<?php echo $form->error($model,'picture'); ?>
	</div>
	<div class="control-group">
		<?php echo $form->label($model,'removePicture', array('label'=>$form->checkBox($model,'removePicture').$model->getAttributeLabel('removePicture'), 'class'=>'checkbox')); ?>
		<?php echo $form->error($model,'removePicture'); ?>
	</div>
<?php endif; ?>
