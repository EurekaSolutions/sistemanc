<div class="view">

		<b><?php echo CHtml::encode($data->getAttributeLabel('ente_organo_id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->ente_organo_id),array('view','id'=>$data->ente_organo_id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('codigo_onapre')); ?>:</b>
	<?php echo CHtml::encode($data->codigo_onapre); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('nombre')); ?>:</b>
	<?php echo CHtml::encode($data->nombre); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('tipo')); ?>:</b>
	<?php echo CHtml::encode($data->tipo); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('rif')); ?>:</b>
	<?php echo CHtml::encode($data->rif); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('creado_por')); ?>:</b>
	<?php echo CHtml::encode($data->creado_por); ?>
	<br />

</div>