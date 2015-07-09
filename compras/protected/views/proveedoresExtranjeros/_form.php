<?php $form=$this->beginWidget('booster.widgets.TbActiveForm',array(
	'id'=>'proveedores-extranjeros-form',
	'enableAjaxValidation'=>false,
)); ?>

<p class="help-block">Fields with <span class="required">*</span> are required.</p>

<?php echo $form->errorSummary($model); ?>

	<?php //echo $form->textFieldGroup($model,'proveedor_id',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>

    <?php echo $form->checkBoxGroup($modelProveedor,'tiene_rif',array('widgetOptions'=>array('htmlOptions'=>array('id'=>'tieneRif','checked'=>!empty($modelProveedor->tiene_rif)?'checked':'','class'=>'span5','maxlength'=>10)))); ?>

	<?php echo $form->textFieldGroup($modelProveedor,'rif',array('widgetOptions'=>array('htmlOptions'=>array('id'=>'rif','class'=>'span5','maxlength'=>10)))); ?>

	<?php echo $form->textFieldGroup($modelProveedor,'razon_social',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>255)))); ?>

	<?php echo $form->textFieldGroup($model,'num_identificacion',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>255)))); ?>

	<?php //echo $form->textFieldGroup($model,'pais_id',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>

	<?php 	
		$list = CHtml::listData(Paises::model()->findAll(), 'id', 'nombre');
	
		echo CHtml::label('Seleccionar país', 'País');
		echo "<br>";
		$this->widget(
		    'booster.widgets.TbSelect2',
		    array(
		        'asDropDownList' => true,
		        'model' => $model,
		         'attribute' => 'pais_id',
		        //'name' => 'procedimiento_id',
		        'data' => $list,
		        'htmlOptions'=>array('id'=>'Pais',),
		        'options' => array(
		            //'tags' => array('procedimientos'),
		            'placeholder' => 'País de facturación',
		            'width' => '40%',
		            'tokenSeparators' => array(',', ' ')
		        )
		    )
		);
	?>

	<?php echo $form->textFieldGroup($model,'calle',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>255)))); ?>

	<?php echo $form->textFieldGroup($model,'distrito',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>255)))); ?>

	<?php echo $form->textFieldGroup($model,'poblacion',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>255)))); ?>

	<?php echo $form->textFieldGroup($model,'tlf_fijo',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>255)))); ?>

	<?php echo $form->textFieldGroup($model,'pagina_web',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>255)))); ?>

    <h3>INFORMACIÓN TECNICA DE LA EMPRESA</h3>

	<?php 	
		/*$list = CHtml::listData(ObjetosPrincipales::model()->findAll(), 'id', 'nombre');
	
		echo CHtml::label('Seleccionar objeto principal', 'Objeto Principal');
		echo "<br>";
		$this->widget(
		    'booster.widgets.TbSelect2',
		    array(
		        'asDropDownList' => true,
		        'model' => $modelObjeto,
		         'attribute' => 'objeto_principal_id',
		        //'name' => 'procedimiento_id',
		        'data' => $list,
		        'htmlOptions'=>array('id'=>'ObjetoPrincipal',),
		        'options' => array(
		            //'tags' => array('procedimientos'),
		            'placeholder' => 'Objeto principal',
		            'width' => '40%',
		            'tokenSeparators' => array(',', ' ')
		        )
		    )
		);*/
	?>

  <!--  <h3>Información de Pagos</h3>
-->
	<?php /*echo $form->textFieldGroup($modelCuenta,'codigo_swift',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>255)))); ?>

	<?php echo $form->textFieldGroup($modelCuenta,'num_cuenta_bancaria',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>255))));*/ ?>


    <h3>Información de Contacto</h3>

	<?php echo $form->textFieldGroup($modelContacto,'nombre',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>255)))); ?>
	<?php echo $form->textFieldGroup($modelContacto,'documento_identidad',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>255)))); ?>
	<?php echo $form->textFieldGroup($modelContacto,'tlf_fijo',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>255)))); ?>
	<?php echo $form->textFieldGroup($modelContacto,'tlf_movil',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>255)))); ?>
	<?php echo $form->textFieldGroup($modelContacto,'fax_telefax',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>255)))); ?>
	<?php echo $form->textFieldGroup($modelContacto,'correo_electronico',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>255)))); ?>


<div class="form-actions">
	<?php $this->widget('booster.widgets.TbButton', array(
			'buttonType'=>'submit',
			'context'=>'primary',
			'label'=>$model->isNewRecord ? 'Create' : 'Save',
		)); ?>
</div>

<?php $this->endWidget(); ?>


<script >
    
    toogleRif();
    
    function toogleRif(){
        if($('#tieneRif').is(':checked'))
        {
            $('#rif').parent().show();
        }
        //if($('#tieneRif').val() == 1)
        if(!$('#tieneRif').is(':checked'))
        {
            $('#rif').parent().hide();
        }
    }
    
    $('#tieneRif').change(function(){ 
        //if($('#tieneRif').val() == 0)
       toogleRif();
    });
    
    
    
</script>
