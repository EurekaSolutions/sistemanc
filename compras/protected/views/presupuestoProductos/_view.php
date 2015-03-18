<div class="view">

		<b><?php echo CHtml::encode($data->getAttributeLabel('presupuesto_id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->presupuesto_id),array('view','id'=>$data->presupuesto_id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('producto_id')); ?>:</b>
	<?php echo CHtml::encode($data->producto_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('unidad_id')); ?>:</b>
	<?php echo CHtml::encode($data->unidad_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('costo_unidad')); ?>:</b>
	<?php echo CHtml::encode($data->costo_unidad); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('cantidad')); ?>:</b>
	<?php echo CHtml::encode($data->cantidad); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('monto_presupuesto')); ?>:</b>
	<?php echo CHtml::encode($data->monto_presupuesto); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('tipo')); ?>:</b>
	<?php echo CHtml::encode($data->tipo); ?>
	<br />

	<?php /*
	<b><?php echo CHtml::encode($data->getAttributeLabel('monto_ejecutado')); ?>:</b>
	<?php echo CHtml::encode($data->monto_ejecutado); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('proyecto_partida_id')); ?>:</b>
	<?php echo CHtml::encode($data->proyecto_partida_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fecha_estimada')); ?>:</b>
	<?php echo CHtml::encode($data->fecha_estimada); ?>
	<br />

	*/ ?>

</div>