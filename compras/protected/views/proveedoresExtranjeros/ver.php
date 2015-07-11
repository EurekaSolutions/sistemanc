<?php
$this->breadcrumbs=array(
	'Proveedores Extranjeros'=>array('index'),
	'Ver',
);


?>
<?php $form=$this->beginWidget('booster.widgets.TbActiveForm',array(
	'id'=>'proveedores-extranjeros-form',
	'enableAjaxValidation'=>false,
)); ?>

<h1>Ver proveedores</h1>

<?php 
	

    echo CHtml::label('Busque el proveedor extranjero', 'Proveedor Extranjero');
	echo "<br>";
	
	echo $form->textFieldGroup($model,'id',array('widgetOptions'=>array('htmlOptions'=>array('class' => 'span5'))));

	$this->widget('ext.ESelect2.ESelect2', array(
	            'selector' => '#ProveedoresExtranjeros_id',
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

<div class="form-actions">
	<?php $this->widget('booster.widgets.TbButton', array(
			'buttonType'=>'submit',
			'context'=>'primary',
			'label'=>$model->isNewRecord ? 'Buscar' : 'Guardar',
		)); ?>
</div>

<?php $this->endWidget(); ?>