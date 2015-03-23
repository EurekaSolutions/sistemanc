<?php $form=$this->beginWidget('booster.widgets.TbActiveForm',array(
	'id'=>'usuarios-form',
	'enableAjaxValidation'=>true,
)); ?>

<p class="help-block">Campos marcados con <span class="required">*</span> son obligatorios.</p>

<?php echo $form->errorSummary($model); ?>

	<?php echo $form->textFieldGroup($model,'cedula',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>20,/*'disabled'=>$model->isNewRecord ? false:true*/)))); ?>

	<?php //echo $form->textFieldGroup($model,'usuario',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>50,'disabled'=>$model->isNewRecord ? false:true)))); ?>

	<?php //echo $form->textFieldGroup($model,'contrasena',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>50)))); ?>

    <?php //echo $form->textFieldGroup($model,'repetir_contrasena',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>50)))); ?>

	<?php echo $form->textFieldGroup($model,'correo',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>255)))); ?>

	<?php /*echo  $form->dropDownListGroup( $model, 'ente_organo_id',
			array(
				'wrapperHtmlOptions' => array(
					'class' => 'col-sm-5',
				),
				'label'=>'Selecciona organo u ente',
				'widgetOptions' => array(

					'data' => CHtml::listData(EntesOrganos::model()->findAllByAttributes(array('tipo'=>'O')), 'ente_organo_id', 
                                                        function($ente){ return CHtml::encode(($ente->tipo=='O'? 'Organo' :'Ente') .' - '.$ente->nombre);}),
					//'options'=>array($model->proyecto_id => array('selected'=>true)),
					'htmlOptions' => array('id'=>'ente','prompt' => 'Seleccionar ente', ),
				),
				'hint' => 'Ente u Organo asociado a el usuario.'
			)
		); */ //echo $form->dropDownList($model,'ente_organo_id',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>255)))); ?>
	
	<?php echo $form->checkBoxGroup($model,'esta_deshabilitado'); ?>
	
	<?php /*echo $form->textFieldGroup($model,'creado_el',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>

	<?php echo $form->textFieldGroup($model,'actualizado_el',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>

	<?php echo $form->checkBoxGroup($model,'esta_activo'); ?>

	

	<?php echo $form->checkBoxGroup($model,'correo_verificado'); ?>

	<?php echo $form->textFieldGroup($model,'llave_activacion',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>255)))); ?>

	<?php echo $form->textFieldGroup($model,'ultima_visita_el',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); */?>

<div class="form-actions">
	<?php $this->widget('booster.widgets.TbButton', array(
			'buttonType'=>'submit',
			'context'=>'primary',
			'label'=>$model->isNewRecord ? 'Crear' : 'Guardar',
		)); ?>
</div>

<?php $this->endWidget(); ?>
