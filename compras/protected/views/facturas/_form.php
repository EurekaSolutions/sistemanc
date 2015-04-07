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
			'hint' => 'Coloque la fecha de generación de la factura.',
			'prepend' => '<i class="glyphicon glyphicon-calendar"></i>'
		)
	); ?>

	<?php //echo $form->textFieldGroup($model,'anho',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>


<div class="form-group">
	<?php 	
		$list = CHtml::listData(Procedimientos::model()->findAllByAttributes(array('ente_organo_id'=>Usuarios::model()->findByPk(Yii::app()->user->getId())->enteOrgano->ente_organo_id)), 'id', 'num_contrato');
	
		echo CHtml::label('Seleccionar procedimiento', 'Procedimeinto');
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

<div class="form-group">
	<?php 	
		//$list = CHtml::listData(Proveedores::model()->findAll(), 'id', 'razon_social');
/*
		$list = array(1 => 'chao');
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
*/
	?>
<?php /*echo $form->select2Group($model, 'proveedor_id', array(
		//'hint'=>'Select your city',
		//	'data'=>GxHtml::listData(City::model()->findAll(),'city_id', 'city_name'),
		'asDropDownList' => false,
		'options' => array(
				'delay'=>300,
				'minLength'=>3,
				'width' => '40%',
				'closeOnSelect' => false,
				'placeholder' => 'Seleccionar proveedor',
				'allowClear' => false,
				'minimumInputLenght'=>3,
				'ajax' => array(
					'url' => CController::createUrl('proveedores/ajaxObtenerProveedores'),
					'delay'=>'250',
					'dataType' => 'json',
					'data' => 'js:function(term,page) { return {q: term, page_limit: 10, page: page}; }',
					'results' => 'js:function(data,page) { return {results: data}; }',
				),
		)));*/

	echo CHtml::label('Seleccionar proveedor', 'Proveedor');
	echo "<br>";
	echo CHtml::textField('proveedor_id', '', array('class' => 'span5'));

	$this->widget('ext.ESelect2.ESelect2', array(
	            'selector' => '#proveedor_id',
	            'options'  => array(
	                    'allowClear'=>true,
	                    'placeholder'=>'Buscar proveedor por rif',
	                    'minimumInputLength' => 7,
	                    'ajax' => array(
	                            'url' => Yii::app()->createUrl('proveedores/ajaxObtenerProveedores'),
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
		                     $.ajax("'.Yii::app()->createUrl('proveedores/ajaxObtenerProveedores').'", {
		                       data: { id: id },
		                       dataType: "json"
		                     }).done(function(data,textStatus, jqXHR) { callback(data[0]); });
		                   }
		                }',
	            ),
          ));



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
		

	<?php //echo $form->textFieldGroup($model,'procedimiento_id',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>

	<?php //echo $form->textFieldGroup($model,'fecha',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>


<?php echo CHtml::ajaxLink('Añadir proveedor',$this->createUrl('proveedores/anadir'),array(
        'onclick'=>'$("#jobDialog").dialog("open"); return false;',
        'update'=>'#jobDialog'
        ),array('id'=>'showJobDialog'));?>

<div id="jobDialog" style="display:none"></div>

<br/><br/>
<div class="form-actions">
	<?php $this->widget('booster.widgets.TbButton', array(
			'buttonType'=>'submit',
			'context'=>'primary',
			'label'=>$model->isNewRecord ? 'Registrar' : 'Guardar',
		)); ?>
</div>

<?php $this->endWidget(); ?>