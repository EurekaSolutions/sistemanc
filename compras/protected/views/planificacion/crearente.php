<?php
/* @var $this EntesOrganosController */
/* @var $model EntesOrganos */
/* @var $form CActiveForm */
?>
<div class="form">
<?php $form=$this->beginWidget('booster.widgets.TbActiveForm',array(
    'id'=>'entes-organos-crearente-form',
    // Please note: When you enable ajax validation, make sure the corresponding
    // controller action is handling ajax validation correctly.
    // See class documentation of CActiveForm for details on this,
    // you need to use the performAjaxValidation()-method described there.
    'enableAjaxValidation'=>false,
)); ?>

    <h4 style="">CREAR ENTES</h4>

     <?php
        foreach(Yii::app()->user->getFlashes() as $key => $message) {
            echo '<div class="flash-' . $key . '">' . $message . "</div>\n";
        }
    ?>
    <br>
    <p class="help-block">Campos marcados con <span class="required">*</span> son obligatorios.</p>

    <?php //echo $form->errorSummary($model); ?>

    <?php echo $form->textFieldGroup($model,'codigo_onapre',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>20)))); ?>

    <?php echo $form->textFieldGroup($model,'nombre',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>100)))); ?>

    <?php //echo $form->textFieldGroup($model,'tipo',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>100)))); ?>


    <?php echo $form->textFieldGroup($model,'rif',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>100, 'value' =>"")))); ?>
    


    <?php //echo $form->textFieldGroup($model,'creado_por',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>100)))); ?>
    
    <div class="form-actions">

    <?php $this->widget('booster.widgets.TbButton', array(
            'buttonType'=>'submit',
            'context'=>'primary',
            'label'=>$model->isNewRecord ? 'Crear ente' : 'Guardar ente',
        )); ?>
    </div>

<?php $this->endWidget(); ?>

</div><!-- form -->