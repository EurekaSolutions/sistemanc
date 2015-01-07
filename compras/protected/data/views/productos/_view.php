<div class="view">

		<b><?php echo CHtml::encode($data->getAttributeLabel('producto_id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->producto_id),array('view','id'=>$data->producto_id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('cod_segmento')); ?>:</b>
	<?php echo CHtml::encode($data->cod_segmento); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('cod_familia')); ?>:</b>
	<?php echo CHtml::encode($data->cod_familia); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('cod_clase')); ?>:</b>
	<?php echo CHtml::encode($data->cod_clase); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('cod_producto')); ?>:</b>
	<?php echo CHtml::encode($data->cod_producto); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('nombre')); ?>:</b>
	<?php echo CHtml::encode($data->nombre); ?>
	<br />


</div>