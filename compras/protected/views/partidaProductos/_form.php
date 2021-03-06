<?php $form=$this->beginWidget('booster.widgets.TbActiveForm',array(
	'id'=>'partida-productos-form',
	'enableAjaxValidation'=>false,
)); ?>

<?php
    foreach(Yii::app()->user->getFlashes() as $key => $message) {
        echo '<div class="flash-' . $key . '">' . $message . "</div>\n";
    }
?>

<p class="help-block">Campos marcados con <span class="required">*</span> son obligatorios.</p>

<?php echo $form->errorSummary($model); ?>
	
	<?php

/*		echo $form->dropDownListGroup($model , 'partida_id',
										array(
											'wrapperHtmlOptions' => array(
												'class' => 'col-sm-2',
											),
											'label'=>'Seleccione partida especifica',
											'widgetOptions' => array(

												'data' => $especificas_lista,
												//'options'=>array($model->proyecto_id => array('selected'=>true)),
												'htmlOptions' => array('prompt' => 'Seleccione partida especifica'),
											)
										)
		); */
	echo $form->select2Group($model, 'partida_id',
							array(
							'wrapperHtmlOptions' => array(
								'class' => 'col-sm-5',
							),
							'widgetOptions' => array(
								'asDropDownList' => true,
								'data' => $especificas_lista,
						        'htmlOptions'=>array('id'=>'partida',),
								'options' => array(
									//'tags' => array('clever', 'is', 'better', 'clevertech'),
									'placeholder' => 'Seleccione partida especifica',
									// 'width' => '40%', 
									'tokenSeparators' => array(',', ' ')
								)
							)
						)
					);
	?>
	

	<?php 

		echo $form->dropDownListGroup($model , 'producto_id',
										array(
											'wrapperHtmlOptions' => array(
												'class' => 'col-sm-2',
											),
											'label'=>'Seleccione producto',
											'widgetOptions' => array(

												'data' => $productos,
												//'options'=>array($model->proyecto_id => array('selected'=>true)),
												'htmlOptions' => array(//'prompt' => 'Seleccione producto',
													'multiple' => true, 'width' => '320px'),
											)
										)
		); 
	/*echo $form->select2Group($model, 'producto_id',
						array(
							'wrapperHtmlOptions' => array(
								'class' => 'col-sm-5',
							),
							'label'=>'Seleccione productos',
							'widgetOptions' => array(
								'asDropDownList' => true,
								'data' => $productos,
						        'htmlOptions'=>array(  'multiple'=>true,),
								'options' => array(
									//'tags' => array('clever', 'is', 'better', 'clevertech'),
									'placeholder' => 'Seleccione productos',
									// 'width' => '40%', 
									'tokenSeparators' => array(',', ' ')
								)
							)
						)
					);*/

	?>

	<?php 

		echo $form->dropDownListGroup($model , 'tipo_operacion',
										array(
											'wrapperHtmlOptions' => array(
												'class' => 'col-sm-2',
											),
											'label'=>'Seleccione operación',
											'widgetOptions' => array(

												'data' => $operacion,
												//'options'=>array($model->proyecto_id => array('selected'=>true)),
												'htmlOptions' => array('prompt' => 'Seleccione operación'),
											)
										)
		); ?>


	<?php echo $form->datePickerGroup($model,'fecha_desde',array('widgetOptions'=>array('options'=>array('format' => 'yyyy-m-d'),'htmlOptions'=>array('class'=>'span5')), 'prepend'=>'<i class="glyphicon glyphicon-calendar"></i>', /*'append'=>'Click on Month/Year to select a different Month/Year.'*/)); ?>

	<?php echo $form->datePickerGroup($model,'fecha_hasta',array('widgetOptions'=>array('options'=>array('format' => 'yyyy-m-d'),'htmlOptions'=>array('class'=>'span5')), 'prepend'=>'<i class="glyphicon glyphicon-calendar"></i>', /*'append'=>'Click on Month/Year to select a different Month/Year.'*/)); ?>

<div class="form-actions">
	<?php $this->widget('booster.widgets.TbButton', array(
			'buttonType'=>'submit',
			'context'=>'primary',
			'label'=>$model->isNewRecord ? 'Asociar Productos a Partida' : 'Guardar',
		)); ?>
</div>

<?php $this->endWidget(); ?>
