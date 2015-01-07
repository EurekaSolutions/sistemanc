<div class="view">

		<b><?php echo CHtml::encode($data->getAttributeLabel('partida_producto_id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->partida_producto_id),array('view','id'=>$data->partida_producto_id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('partida_id')); ?>:</b>
	<?php echo CHtml::encode($data->partida_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('producto_id')); ?>:</b>
	<?php echo CHtml::encode($data->producto_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('tipo_operacion')); ?>:</b>
	<?php echo CHtml::encode($data->tipo_operacion); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fecha_desde')); ?>:</b>
	<?php echo CHtml::encode($data->fecha_desde); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fecha_hasta')); ?>:</b>
	<?php echo CHtml::encode($data->fecha_hasta); ?>
	<br />


</div>