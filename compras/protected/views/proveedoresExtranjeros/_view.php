<div class="view">

		<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id),array('view','id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('proveedor_id')); ?>:</b>
	<?php echo CHtml::encode($data->proveedor_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('num_identificacion')); ?>:</b>
	<?php echo CHtml::encode($data->num_identificacion); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('pais_id')); ?>:</b>
	<?php echo CHtml::encode($data->pais_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('codigo_postal')); ?>:</b>
	<?php echo CHtml::encode($data->codigo_postal); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('calle')); ?>:</b>
	<?php echo CHtml::encode($data->calle); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('distrito')); ?>:</b>
	<?php echo CHtml::encode($data->distrito); ?>
	<br />

	<?php /*
	<b><?php echo CHtml::encode($data->getAttributeLabel('poblacion')); ?>:</b>
	<?php echo CHtml::encode($data->poblacion); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('tlf_fijo')); ?>:</b>
	<?php echo CHtml::encode($data->tlf_fijo); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('pagina_web')); ?>:</b>
	<?php echo CHtml::encode($data->pagina_web); ?>
	<br />

	*/ ?>

</div>