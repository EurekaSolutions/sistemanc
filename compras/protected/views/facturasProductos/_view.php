<div class="view">

		<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id),array('view','id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('factura_id')); ?>:</b>
	<?php echo CHtml::encode($data->factura_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('producto_id')); ?>:</b>
	<?php echo CHtml::encode($data->producto_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('costo_unitario')); ?>:</b>
	<?php echo CHtml::encode($data->costo_unitario); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('cantidad_adquirida')); ?>:</b>
	<?php echo CHtml::encode($data->cantidad_adquirida); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('iva_id')); ?>:</b>
	<?php echo CHtml::encode($data->iva_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fecha')); ?>:</b>
	<?php echo CHtml::encode($data->fecha); ?>
	<br />

	<?php /*
	<b><?php echo CHtml::encode($data->getAttributeLabel('presupuesto_partida_id')); ?>:</b>
	<?php echo CHtml::encode($data->presupuesto_partida_id); ?>
	<br />

	*/ ?>

</div>