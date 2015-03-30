<?php echo CHtml::ajaxLink('Añadir proveedor',$this->createUrl('proveedores/anadir'),array(
        'onclick'=>'$("#jobDialog").dialog("open"); return false;',
        'update'=>'#jobDialog'
        ),array('id'=>'showJobDialog'));?>

<div id="jobDialog"></div>