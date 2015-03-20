<div class="view">

		<b><?php echo CHtml::encode($data->getAttributeLabel('presupuesto_partida_id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->presupuesto_partida_id),array('view','id'=>$data->presupuesto_partida_id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('partida_id')); ?>:</b>
	<?php echo CHtml::encode($data->partida_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('monto_presupuestado')); ?>:</b>
	<?php echo CHtml::encode($data->monto_presupuestado); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fecha_desde')); ?>:</b>
	<?php echo CHtml::encode($data->fecha_desde); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fecha_hasta')); ?>:</b>
	<?php echo CHtml::encode($data->fecha_hasta); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('tipo')); ?>:</b>
	<?php echo CHtml::encode($data->tipo); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('anho')); ?>:</b>
	<?php echo CHtml::encode($data->anho); ?>
	<br />

	<?php /*
	<b><?php echo CHtml::encode($data->getAttributeLabel('ente_organo_id')); ?>:</b>
	<?php echo CHtml::encode($data->ente_organo_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('presupuesto_id')); ?>:</b>
	<?php echo CHtml::encode($data->presupuesto_id); ?>
	<br />

	*/ ?>

</div>