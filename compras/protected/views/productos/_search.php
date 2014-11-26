<?php
/* @var $this ProductosController */
/* @var $model Productos */
/* @var $form CActiveForm */
?>

<div class="wide form">

    <?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

                    <?php echo $form->textFieldControlGroup($model,'producto_id',array('span'=>5)); ?>

                    <?php echo $form->textFieldControlGroup($model,'cod_segmento',array('span'=>5)); ?>

                    <?php echo $form->textFieldControlGroup($model,'cod_familia',array('span'=>5)); ?>

                    <?php echo $form->textFieldControlGroup($model,'cod_clase',array('span'=>5)); ?>

                    <?php echo $form->textFieldControlGroup($model,'cod_producto',array('span'=>5)); ?>

                    <?php echo $form->textFieldControlGroup($model,'nombre',array('span'=>5,'maxlength'=>255)); ?>

        <div class="form-actions">
        <?php echo TbHtml::submitButton('Search',  array('color' => TbHtml::BUTTON_COLOR_PRIMARY,));?>
    </div>

    <?php $this->endWidget(); ?>

</div><!-- search-form -->