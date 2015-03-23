<?php $form=$this->beginWidget('booster.widgets.TbActiveForm',array(
	'id'=>'archivos-form',
	'enableAjaxValidation'=>false,
	'htmlOptions' => array('enctype' => 'multipart/form-data'),
)); ?>

<center><h4>Carga masiva de Organos</h4></center>


<p class="help-block">Los campos con <span class="required">*</span> son requeridos.</p>

<?php //echo $form->errorSummary($model); ?>
 <?php 
        foreach(Yii::app()->user->getFlashes() as $key => $message) {
            echo '<div class="flash-' . $key . '">' . $message . "</div>\n";
        }
    ?>

<?php
if(isset($errores) )
{
	echo '<p class="help-block">Se han encontrado los siguientes errores:</p>';
	foreach ($errores as $key => $value) {
		echo '<div class="flash-notice"> Linea '.($key+2).' '.$value."</div>";
		echo '<div class="flash-error">'.$todosErrores[$key].'</div>';
	}
}else
{
	echo '<p class="help-block">Todo el archivo cargado con éxito.</p>';	
}
?>


 <?php

 	echo $form->labelEx($model, 'archivo');
	echo $form->fileField($model, 'archivo');
	echo $form->error($model, 'archivo');


 ?>
<!--
<form action="#" method="post" enctype="multipart/form-data">
	<label for="archivo">
    	<input type="file" name="archivo" id="archivo" value="" />
    </label>
    <br/>
   	<input type="submit" value="Cargar" name="Cargar" />
</form>
-->
<br>
<div class="form-group">

	<?php echo CHtml::link('Descargar formato de ejemplo',array('planificacion/descargar')); ?>

</div>
<div class="form-group">

	<p>El documento de ejemplo, una vez digitado debera ser convertido a .csv</p>

</div>

<div class="form-actions">
	<?php $this->widget('booster.widgets.TbButton', array(
			'buttonType'=>'submit',
			'context'=>'primary',
			'label'=>Yii::t('msg','Cargar archivo'),
		)); ?>
</div>



<?php $this->endWidget(); ?>