<?php
/* @var $this PresupuestoImportacionController */
/* @var $model PresupuestoImportacion */
/* @var $form CActiveForm */
?>

<div class="wide form">

    <?php $form=$this->beginWidget('booster.widgets.TbActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

            <?php echo $form->textFieldGroup($model,'codigo_ncm_id',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>

            <?php echo $form->textFieldGroup($model,'presupuesto_id',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>

            <?php echo $form->textFieldGroup($model,'cantidad',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>

            <?php echo $form->textFieldGroup($model,'fecha_llegada',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>

            <?php echo $form->textFieldGroup($model,'monto_presupuesto',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>38)))); ?>

            <?php echo $form->textFieldGroup($model,'tipo',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>100)))); ?>

            <?php echo $form->textFieldGroup($model,'monto_ejecutado',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>38)))); ?>

            <?php echo $form->textFieldGroup($model,'divisa_id',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>

        <div class="form-actions">
        <?php echo TbHtml::submitButton('Buscar',  array('color' => TbHtml::BUTTON_COLOR_PRIMARY,));?>
    </div>

    <?php $this->endWidget(); ?>

</div><!-- search-form -->