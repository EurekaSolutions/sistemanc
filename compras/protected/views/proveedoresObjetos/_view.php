<div class="view">

		<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id),array('view','id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('proveedor_id')); ?>:</b>
	<?php echo CHtml::encode($data->proveedor_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('ente_organo_id')); ?>:</b>
	<?php echo CHtml::encode($data->ente_organo_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('rama_producto_id')); ?>:</b>
	<?php echo CHtml::encode($data->rama_producto_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('descripcion')); ?>:</b>
	<?php echo CHtml::encode($data->descripcion); ?>
	<br />


</div>