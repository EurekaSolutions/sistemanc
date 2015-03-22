<?php $form=$this->beginWidget('booster.widgets.TbActiveForm',array(
	'id'=>'facturas-form',
	'enableAjaxValidation'=>false,
)); ?>

<p class="help-block">Los campos con <span class="required">*</span> son obligatorios.</p>

<?php echo $form->errorSummary($model); ?>

	<?php echo $form->textFieldGroup($model,'num_factura',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>255)))); ?>

	<?php //echo $form->textFieldGroup($model,'fecha_factura',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>

	<?php echo $form->datePickerGroup(
		$model,
		'fecha_factura',
		array(
			'widgetOptions' => array(
				'options' => array(
					'language' => 'es',
					'format' => 'yyyy-m-d',
				),
			),
			'wrapperHtmlOptions' => array(
				'class' => 'col-sm-5',
			),
			'hint' => 'Click inside! This is a super cool date field.',
			'prepend' => '<i class="glyphicon glyphicon-calendar"></i>'
		)
	); ?>

	<?php //echo $form->textFieldGroup($model,'anho',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>

<div class="form-group">
	<?php 	
		$list = CHtml::listData(Proveedores::model()->findAll(), 'id', 'razon_social');

		echo CHtml::label('Seleccionar Proveedor', 'Proveedor');
		echo "<br>";
		$this->widget(
		    'booster.widgets.TbSelect2',
		    array(
		        'asDropDownList' => true,
		        'model' => $model,
		        
		        'attribute' => 'proveedor_id',
		        //'name' => 'proveedor_id',
		        'data' => $list,
		        'htmlOptions'=>array('id'=>'Proveedor',),
		        'options' => array(
		            //'tags' => array('proveedores'),
		            'placeholder' => 'Proveedores',
		            'width' => '40%',
		            'tokenSeparators' => array(',', ' ')
		        )
		    )
		);
	?>


		<?php /*echo $form->dropDownListGroup(
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
		);*/ ?>
	<?php //echo $form->textFieldGroup($model,'proveedor_id',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>
	</div>
		
	
<div class="form-group">
	<?php 	
		$list = CHtml::listData(Procedimientos::model()->findAll(), 'id', 'num_contrato');
	

		echo CHtml::label('Seleccionar Procedimeinto', 'Procedimeinto');	
		echo "<br>";
		$this->widget(
		    'booster.widgets.TbSelect2',
		    array(
		        'asDropDownList' => true,
		        'model' => $model,
		         'attribute' => 'procedimiento_id',
		        //'name' => 'procedimiento_id',
		        'data' => $list,
		        'htmlOptions'=>array('id'=>'Procedimiento',),
		        'options' => array(
		            //'tags' => array('procedimientos'),
		            'placeholder' => 'Procedimientos',
		            'width' => '40%',
		            'tokenSeparators' => array(',', ' ')
		        )
		    )
		);
	?>
		<?php /*echo $form->dropDownListGroup(
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
		);*/ ?>

	</div>
	<?php //echo $form->textFieldGroup($model,'procedimiento_id',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>

	<?php //echo $form->textFieldGroup($model,'fecha',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>



<div class="form-actions">
	<?php $this->widget('booster.widgets.TbButton', array(
			'buttonType'=>'submit',
			'context'=>'primary',
			'label'=>$model->isNewRecord ? 'Registrar' : 'Guardar',
		)); ?>
</div>

<?php $this->endWidget(); ?>
