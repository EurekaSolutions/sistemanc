<?php
/* @var $this PresupuestoImportacionController */
/* @var $data PresupuestoImportacion */
?>

<div class="view">

    	<b><?php echo CHtml::encode($data->getAttributeLabel('presupuesto_id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->presupuesto_id),array('view','id'=>$data->presupuesto_id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('codigo_ncm_id')); ?>:</b>
	<?php echo CHtml::encode($data->codigo_ncm_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('cantidad')); ?>:</b>
	<?php echo CHtml::encode($data->cantidad); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fecha_llegada')); ?>:</b>
	<?php echo CHtml::encode($data->fecha_llegada); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('monto_presupuesto')); ?>:</b>
	<?php echo CHtml::encode($data->monto_presupuesto); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('tipo')); ?>:</b>
	<?php echo CHtml::encode($data->tipo); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('monto_ejecutado')); ?>:</b>
	<?php echo CHtml::encode($data->monto_ejecutado); ?>
	<br />

	<?php /*
	<b><?php echo CHtml::encode($data->getAttributeLabel('divisa_id')); ?>:</b>
	<?php echo CHtml::encode($data->divisa_id); ?>
	<br />

	*/ ?>

</div>