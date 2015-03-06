<div class="view">

		<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id),array('view','id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('num_contrato')); ?>:</b>
	<?php echo CHtml::encode($data->num_contrato); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('anho')); ?>:</b>
	<?php echo CHtml::encode($data->anho); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fecha')); ?>:</b>
	<?php echo CHtml::encode($data->fecha); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('tipo')); ?>:</b>
	<?php echo CHtml::encode($data->tipo); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('ente_organo_id')); ?>:</b>
	<?php echo CHtml::encode($data->ente_organo_id); ?>
	<br />


</div>