<?php $form=$this->beginWidget('booster.widgets.TbActiveForm',array(
	'id'=>'proveedores-objetos-form',
	'enableAjaxValidation'=>false,
	'htmlOptions'=>array('enctype'=>'multipart/form-data'),
)); ?>

<p class="help-block">Fields with <span class="required">*</span> are required.</p>

<?php echo $form->errorSummary($model); ?>

<!--	<?php //echo $form->textFieldGroup($model,'proveedor_id',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>-->

<?php 
	echo CHtml::label('Seleccionar proveedor extranjero', 'Proveedor Extranjero');
	echo "<br>";
	
	echo $form->textFieldGroup($model,'proveedor_id',array('widgetOptions'=>array('htmlOptions'=>array('class' => 'span5'))));

	$this->widget('ext.ESelect2.ESelect2', array(
	            'selector' => '#ProveedoresObjetos_proveedor_id',
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

<?php echo CHtml::Link('O añadalo aquí',$this->createUrl('proveedoresExtranjeros/create'),array(
        'onclick'=>'',
        ),array('id'=>'añadirProveedorExtranjeroTecnica'));?> <br>
<!--

	<?php //echo $form->textFieldGroup($model,'rama',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>
-->

    <?php 	
        $ramas = Ramas::model()->findAll();

        $list = CHtml::listData($ramas, 'id', 'nombre');
	
		echo CHtml::label('Seleccionar objeto principal', 'Objeto principal');
		echo "<br>";
		$this->widget(
		    'booster.widgets.TbSelect2',
		    array(
		        'asDropDownList' => true,
		        'model' => $model,
		        'attribute' => 'rama',
		        //'name' => 'procedimiento_id',
		        'data' => $list,
		        'htmlOptions'=>array('id'=>'ObjetoPrincipal'),
		        'options' => array(
		            //'tags' => array('procedimientos'),
		            'placeholder' => 'Objeto principal',
		            'width' => '40%',
		            'tokenSeparators' => array(',', ' ')
		        )
		    )
		);
	?>
	<br>
	<?php 	
        $ramaproductos = RamaProductos::model()->findAll();

        $list = CHtml::listData($ramaproductos, 'id', 'nombre');
	
		echo CHtml::label('Seleccionar productos', 'Productos');
		echo "<br>";
		$this->widget(
		    'booster.widgets.TbSelect2',
		    array(
		        'asDropDownList' => true,
		        'model' => $model,
		        'attribute' => 'rama_producto_id',
		        //'name' => 'procedimiento_id',
		        'data' => $list,
		        'htmlOptions'=>array('id'=>'Productos', 'multiple'=>'multiple'),
		        'options' => array(
		            //'tags' => array('procedimientos'),
		            'placeholder' => 'Productos',
		            'width' => '40%',
		            'tokenSeparators' => array(',', ' ')
		        )
		    )
		);
	?>
<!--
	<?php //echo $form->textFieldGroup($model,'rama_producto_id',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>-->

	<?php echo $form->textAreaGroup($model,'descripcion', array('widgetOptions'=>array('htmlOptions'=>array('rows'=>6, 'cols'=>50, 'class'=>'span8')))); ?>

<div class="form-actions">
	<?php $this->widget('booster.widgets.TbButton', array(
			'buttonType'=>'submit',
			'context'=>'primary',
			'label'=>$model->isNewRecord ? 'Create' : 'Save',
		)); ?>
</div>

<?php $this->endWidget(); ?>
