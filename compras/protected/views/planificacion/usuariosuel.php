<?php
/* @var $this UsuariosController */
/* @var $model Usuarios */
/* @var $form CActiveForm */
?>
<div class="form">
<?php $form=$this->beginWidget('booster.widgets.TbActiveForm',array(
    'id'=>'usuarios-usuariosentes-form',
    // Please note: When you enable ajax validation, make sure the corresponding
    // controller action is handling ajax validation correctly.
    // See class documentation of CActiveForm for details on this,
    // you need to use the performAjaxValidation()-method described there.
    'enableAjaxValidation'=>false,
)); ?>

    <h4 style="text-align: center;">CREAR USUARIOS PARA MIS UNIDADES EJECCUTORAS LOCALES</h4>


    
     <?php
        foreach(Yii::app()->user->getFlashes() as $key => $message) {
            echo '<div class="flash-' . $key . '">' . $message . "</div>\n";
        }
    ?>
    <br>
    <p class="help-block">Campos marcados con <span class="required">*</span> son obligatorios.</p>

    <?php echo $form->errorSummary($model); ?>


    <?php 
        $listaUELs = CHtml::listData($this->listaUELs(),'ente_organo_id', 'nombre');

/*        echo  $form->dropDownListGroup( $model, 'ente_organo_id',
            array(
                'wrapperHtmlOptions' => array(
                    'class' => 'col-sm-5',
                ),
                'label'=>'Seleccione el ente',
                'widgetOptions' => array(

                    'data' => $listaEntes,// CHtml::listData($productosPartidas, 'producto_id',function($producto){ return CHtml::encode($this->numeroProducto($producto).' - '.$producto->nombre);}),
                    //'options'=>array($model->proyecto_id => array('selected'=>true)),
                    'htmlOptions' => array('id'=>'producto','prompt' => 'Seleccionar ente', ),
                ),
                'hint' => 'Ente hijo sin usuario.'
            )
        );*/
        echo $form->select2Group($model, 'ente_organo_id',
                        array(
                            'wrapperHtmlOptions' => array(
                                'class' => 'col-sm-5',
                            ),
                            'label'=>'Seleccione la UEL',
                            'widgetOptions' => array(
                                'asDropDownList' => true,
                                'data' => $listaUELs,
                                'htmlOptions'=>array('id'=>'uel',),
                                'options' => array(
                                    //'tags' => array('clever', 'is', 'better', 'clevertech'),
                                    'placeholder' => 'Seleccionar UEL',
                                    // 'width' => '40%', 
                                    'tokenSeparators' => array(',', ' ')
                                )
                            )
                        )
                    );

         ?>

    <?php echo $form->textFieldGroup($model,'nombre',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>20)))); ?>

     <?php echo $form->textFieldGroup($model,'cedula',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>100)))); ?>

    <?php echo $form->textFieldGroup($model,'correo',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>100)))); ?>

    <?php echo $form->textFieldGroup($model,'cargo',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>100)))); ?>


   


    <?php //echo $form->textFieldGroup($model,'correo',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>100)))); ?>
    


    <?php //echo $form->textFieldGroup($model,'creado_por',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>100)))); ?>
    
    <div class="form-actions">

    <?php $this->widget('booster.widgets.TbButton', array(
            'buttonType'=>'submit',
            'context'=>'primary',
            'label'=>$model->isNewRecord ? 'Crear usuario' : 'Guardar usuario',
        )); ?>
    </div>

<?php $this->endWidget(); ?>

</div><!-- form -->