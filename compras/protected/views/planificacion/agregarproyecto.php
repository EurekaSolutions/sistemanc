<?php
/* @var $this EntesOrganosController */
/* @var $model EntesOrganos */
/* @var $form CActiveForm */
$this->breadcrumbs=array(
    'Proyectos'=>array('agregarproyecto'),
);

?>

<div class="form">
<?php $form=$this->beginWidget('booster.widgets.TbActiveForm',array(
    'id'=>'agregarproyecto-crearente-form',
    // Please note: When you enable ajax validation, make sure the corresponding
    // controller action is handling ajax validation correctly.
    // See class documentation of CActiveForm for details on this,
    // you need to use the performAjaxValidation()-method described there.
    'enableAjaxValidation'=>false,
)); ?>

    <h4 style="text-align: center;">AGREGAR PROYECTOS</h4>

     <?php
        foreach(Yii::app()->user->getFlashes() as $key => $message) {
            echo '<div class="flash-' . $key . '">' . $message . "</div>\n";
        }
    ?>

    <br>

    <p class="help-block">Campos marcados con <span class="required">*</span> son obligatorios.</p>

    <?php //echo $form->errorSummary($model); ?>

    <?php echo $form->textFieldGroup($model,'nombre',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span3')))); ?>

    <?php echo $form->textFieldGroup($model,'codigo',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span3','maxlength'=>20)))); ?>


    <div class="well">

    <?php $this->widget('booster.widgets.TbButton', array(
            'buttonType'=>'submit',
            'context'=>'primary',
            'label'=>$model->isNewRecord ? 'Agregar proyecto' : 'Guardar proyecto',
        )); ?>
    </div>
    
    <?php $this->endWidget(); ?>

</div><!-- form -->