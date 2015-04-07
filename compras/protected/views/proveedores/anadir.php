<?php 
$this->beginWidget('zii.widgets.jui.CJuiDialog',array(
                'id'=>'jobDialog',
                'options'=>array(
                    'title'=>'Crear proveedor',
                    'autoOpen'=>true,
                    'modal'=>'true',
                    'width'=>'600',
                    'height'=>'350',
                    'top' =>'auto',
                    'left' =>'auto',

                ),
));

echo $this->renderPartial('_form', array('model'=>$model)); ?>
<?php $this->endWidget('zii.widgets.jui.CJuiDialog');?>