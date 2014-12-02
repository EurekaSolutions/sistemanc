	<div class="control-group ">
		<?php echo $form->labelEx($model,'verifyCode'); ?>
		<div>
		<?php $this->widget('CCaptcha', $this->module->captcha === true ? array() : $this->module->captcha); ?><br/>
		<?php echo $form->textField($model,'verifyCode',array('class'=>'form-control')); ?>
		</div>
		<div class="hint">
			<?php echo Yii::t('UsrModule.usr', 'Por favor introduce las letras tal como se muestran en la imagen de arriba.'); ?><br/>
			<?php echo Yii::t('UsrModule.usr', 'Las letras no distinguen entre mayúsculas y minúsculas.'); ?>
		</div>
		<?php echo $form->error($model,'verifyCode'); ?>
	</div>
