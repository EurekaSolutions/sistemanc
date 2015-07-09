<?php $form=$this->beginWidget('booster.widgets.TbActiveForm',array(
	'id'=>'proveedor-motivo-form',
	'enableAjaxValidation'=>false,
)); ?>

<p class="help-block">Fields with <span class="required">*</span> are required.</p>

<?php echo $form->errorSummary($model); ?>

		
	<?php

		echo CHtml::label('Busque el proveedor extranjero', 'Proveedor Extranjero');
	echo "<br>";
	
	echo $form->textFieldGroup($model,'proveedor_id',array('widgetOptions'=>array('htmlOptions'=>array('class' => 'span5'))));

	$this->widget('ext.ESelect2.ESelect2', array(
	            'selector' => '#ProveedorMotivo_proveedor_id',
	            'options'  => array(
	                    'allowClear'=>true,
	                    'placeholder'=>'Buscar proveedor por RIF, Razon Social o Codigo Fiscal',
	                    'minimumInputLength' => 3,
	                    'ajax' => array(
	                            'url' => Yii::app()->createUrl('proveedores/ajaxObtenerProveedores',array('nacional'=>0)),
	                            'dataType' => 'json',
	                            'quietMillis'=> 100,
	                            'data' => 'js: function(text,page) {
	                                            return {
	                                                q: text,
	                                                page_limit: 10,
	                                                page: page,
	                                            };
	                                        }',
	                            'results'=>'js:function(data,page) { var more = (page * 10) < data.total; return {results: data, more:more }; }',
	                    ),
		               'initSelection'=>'js:function(element,callback) {
		                   var id=$(element).val(); // read #selector value
		                   if ( id !== "" ) {
		                     $.ajax("'.Yii::app()->createUrl('proveedores/ajaxObtenerProveedores',array('nacional'=>0)).'", {
		                       data: { id: id },
		                       dataType: "json"
		                     }).done(function(data,textStatus, jqXHR) { callback(data[0]); });
		                   }
		                }',
	            ),
          ));

	?>

	<?php echo $form->textAreaGroup($model,'motivo', array('widgetOptions'=>array('htmlOptions'=>array('rows'=>6, 'cols'=>50, 'class'=>'span8')))); ?>

<div class="form-actions">
	<?php $this->widget('booster.widgets.TbButton', array(
			'buttonType'=>'submit',
			'context'=>'primary',
			'label'=>$model->isNewRecord ? 'Create' : 'Save',
		)); ?>
</div>

<?php $this->endWidget(); ?>
