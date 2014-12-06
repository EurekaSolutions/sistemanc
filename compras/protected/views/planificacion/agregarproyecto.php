<?php
/* @var $this EntesOrganosController */
/* @var $model EntesOrganos */
/* @var $form CActiveForm */
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

    <h4 style="text-align: center;">CREAR PROYECTOS</h4>

     <?php
        foreach(Yii::app()->user->getFlashes() as $key => $message) {
            echo '<div class="flash-' . $key . '">' . $message . "</div>\n";
        }
    ?>

    <br>

    <p class="help-block">Campos marcados con <span class="required">*</span> son obligatorios.</p>

    <?php //echo $form->errorSummary($model); ?>

    <?php echo $form->textFieldGroup($model,'nombre',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span3','maxlength'=>20)))); ?>

    <?php echo $form->textFieldGroup($model,'codigo',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span3','maxlength'=>100)))); ?>


    <div class="well">

    <?php $this->widget('booster.widgets.TbButton', array(
            'buttonType'=>'submit',
            'context'=>'primary',
            'label'=>$model->isNewRecord ? 'Crear proyecto' : 'Guardar proyecto',
        )); ?>
    </div>



    <div class="well">
                <label>
                   Mis proyectos
                    <select class="form-control">
                      <option value="">Proyectos creados</option>
                      <option value="corpovex">Proyecto 1</option>
                      <option>Proyecto 2</option>
                    </select>
                </label>
    </div>

        <div class="well">
                <label>
                    Seleccione la Partida
                <select class="form-control">
                  <option value="">Partidas</option>
                  <option value="corpovex">401 GASTOS DE PERSONAL</option>
                  <option>402 MATERIALES Y SUMINISTRO</option>
                  <option>403 GASTOS NO PERSONALES</option>
                  <option>404 BIENES</option>
                </select>
                </label>
            </div>


            <div class="well">
                <label>
                    Seleccione la partida general
                    <select class="form-control">
                      <option value="">Generales</option>
                      <option value="corpovex">401.07.00.00</option>
                    </select>
                </label>
            </div>


           <!-- <div class="well">
                <label>
                    Seleccione la partida especifica
                    <select class="form-control">
                      <option value="">Especifica</option>
                      <option value="corpovex">Corpovex</option>
                      <option>Licitación internacion</option>
                    </select>
                </label>
            </div>

            <div class="well">
                <label>
                    Seleccione la partida Sub-especifica (* SI APLICA)
                    <select class="form-control">
                      <option value="">Subespecifica</option>
                      <option value="corpovex">Corpovex</option>
                      <option>Licitación internacion</option>
                    </select>
                </label>
            </div>-->
            
            <div class="well">
                <label>
                    Dinero asignado
                    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Dinero asignado">
                </label>
            </div>


            <?php

            $this->widget('booster.widgets.TbButton', array(
                'buttonType'=>'submit',
                'context'=>'primary',
                'label'=>$model->isNewRecord ? 'Asignar dinero' : 'Agregar dinero',
            )); 

     $this->endWidget(); ?>

</div><!-- form -->