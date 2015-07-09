<?php $form=$this->beginWidget('booster.widgets.TbActiveForm',array(
	'id'=>'proveedores-objetos-form',
	'enableAjaxValidation'=>false,
)); ?>

<p class="help-block">Fields with <span class="required">*</span> are required.</p>

<?php //echo $form->errorSummary($model); ?>

<!--	<?php echo $form->textFieldGroup($model,'proveedor_id',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>-->

<?php 
	echo CHtml::label('Seleccionar proveedor extranjero', 'Proveedor Extranjero');
	echo "<br>";
	echo CHtml::textField('proveedor_id', '', array('class' => 'span5'));

	$this->widget('ext.ESelect2.ESelect2', array(
	            'selector' => '#proveedor_id',
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

<?php echo CHtml::Link('Añadir proveedor extranjero',$this->createUrl('proveedoresExtranjeros/create'),array(
        'onclick'=>'',
        ),array('id'=>'añadirProveedorExtranjeroTecnica'));?>

	<?php echo $form->textFieldGroup($model,'rama',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>

    <?php 	
        $proveedores = Ramas::model()->findAllByAttributes(array('nacional'=>false,'ente_organo_id'=>Usuarios::model()->findByPk(Yii::app()->user->getId())->enteOrgano->ente_organo_id));

        $list = CHtml::listData($proveedores, 'id', function($model){return $model->etiquetaExtranjero();});
	
		echo CHtml::label('Seleccionar proveedor', 'Provedor');
		echo "<br>";
		$this->widget(
		    'booster.widgets.TbSelect2',
		    array(
		        'asDropDownList' => true,
		        'model' => $model,
		        'attribute' => 'proveedor_id',
		        //'name' => 'procedimiento_id',
		        'data' => $list,
		        'htmlOptions'=>array('id'=>'Proveedores',),
		        'options' => array(
		            //'tags' => array('procedimientos'),
		            'placeholder' => 'Proveedor Extranjero',
		            'width' => '40%',
		            'tokenSeparators' => array(',', ' ')
		        )
		    )
		);
	?>


	<?php echo $form->textFieldGroup($model,'rama_producto_id',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>

	<?php echo $form->textAreaGroup($model,'descripcion', array('widgetOptions'=>array('htmlOptions'=>array('rows'=>6, 'cols'=>50, 'class'=>'span8')))); ?>

<div class="form-actions">
	<?php $this->widget('booster.widgets.TbButton', array(
			'buttonType'=>'submit',
			'context'=>'primary',
			'label'=>$model->isNewRecord ? 'Create' : 'Save',
		)); ?>
</div>

<?php $this->endWidget(); ?>
