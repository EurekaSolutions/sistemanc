<?php
/* @var $this PresupuestoImportacionController */
/* @var $model PresupuestoImportacion */
/* @var $form CActiveForm */
?>

<div class="wide form">

    <?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

                    <?php echo $form->textFieldControlGroup($model,'codigo_ncm_id',array('span'=>5)); ?>

                    <?php echo $form->textFieldControlGroup($model,'presupuesto_id',array('span'=>5)); ?>

                    <?php echo $form->textFieldControlGroup($model,'cantidad',array('span'=>5)); ?>

                    <?php echo $form->textFieldControlGroup($model,'fecha_llegada',array('span'=>5)); ?>

                    <?php echo $form->textFieldControlGroup($model,'monto_presupuesto',array('span'=>5,'maxlength'=>38)); ?>

                    <?php echo $form->textFieldControlGroup($model,'tipo',array('span'=>5,'maxlength'=>100)); ?>

                    <?php echo $form->textFieldControlGroup($model,'monto_ejecutado',array('span'=>5,'maxlength'=>38)); ?>

                    <?php echo $form->textFieldControlGroup($model,'divisa_id',array('span'=>5)); ?>

        <div class="form-actions">
        <?php echo TbHtml::submitButton('Search',  array('color' => TbHtml::BUTTON_COLOR_PRIMARY,));?>
    </div>

    <?php $this->endWidget(); ?>

</div><!-- search-form -->