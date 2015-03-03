<?php $form=$this->beginWidget('booster.widgets.TbActiveForm',array(
	'id'=>'facturas-form',
	'enableAjaxValidation'=>false,
)); ?>

<p class="help-block">Fields with <span class="required">*</span> are required.</p>

<?php echo $form->errorSummary($model); ?>

	<?php echo $form->textFieldGroup($model,'num_factura',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>255)))); ?>

	<?php echo $form->textFieldGroup($model,'anho',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>

	<?php 	
		$list = CHtml::listData(Proveedores::model()->findAll(), 'id', 'razon_social');

		$this->widget(
		    'booster.widgets.TbSelect2',
		    array(
		        'asDropDownList' => false,
		        'model' => $model,
		        'attribute' => 'proveedor_id',
		        //'name' => 'proveedor_id',
		        'data' => $list,
		        'options' => array(
		            'tags' => array('proveedores'),
		            'placeholder' => 'Proveedores',
		            'width' => '40%',
		            'tokenSeparators' => array(',', ' ')
		        )
		    )
		,true);
	?>
		<?php echo $form->dropDownListGroup(
			$model,
			'proveedor_id',
			array(
				'wrapperHtmlOptions' => array(
					'class' => 'col-sm-5',
				),
				'widgetOptions' => array(
					'data' => $list,
					'htmlOptions' => array(),
				)
			)
		); ?>
	<?php //echo $form->textFieldGroup($model,'proveedor_id',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>

	<?php 	
		$list = CHtml::listData(Procedimientos::model()->findAll(), 'id', 'num_contrato');

		$this->widget(
		    'booster.widgets.TbSelect2',
		    array(
		        'asDropDownList' => false,
		        'name' => 'procedimiento_id',
		        'data' => $list,
		        'options' => array(
		            'tags' => array('procedimientos'),
		            'placeholder' => 'Procedimientos',
		            'width' => '40%',
		            'tokenSeparators' => array(',', ' ')
		        )
		    )
		);
	?>
		<?php echo $form->dropDownListGroup(
			$model,
			'procedimiento_id',
			array(
				'wrapperHtmlOptions' => array(
					'class' => 'col-sm-5',
				),
				'widgetOptions' => array(
					'data' => $list,
					'htmlOptions' => array(),
				)
			)
		); ?>
	<?php //echo $form->textFieldGroup($model,'procedimiento_id',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>

	<?php echo $form->textFieldGroup($model,'fecha',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>

<div class="form-actions">
	<?php $this->widget('booster.widgets.TbButton', array(
			'buttonType'=>'submit',
			'context'=>'primary',
			'label'=>$model->isNewRecord ? 'Create' : 'Save',
		)); ?>
</div>

<?php $this->endWidget(); ?>
