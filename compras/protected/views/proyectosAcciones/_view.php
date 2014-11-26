<?php
/* @var $this ProyectosAccionesController */
/* @var $data ProyectosAcciones */
?>

<div class="view">

    	<b><?php echo CHtml::encode($data->getAttributeLabel('proyecto_id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->proyecto_id),array('view','id'=>$data->proyecto_id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('nombre')); ?>:</b>
	<?php echo CHtml::encode($data->nombre); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('monto')); ?>:</b>
	<?php echo CHtml::encode($data->monto); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('codigo')); ?>:</b>
	<?php echo CHtml::encode($data->codigo); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('ente_organo_id')); ?>:</b>
	<?php echo CHtml::encode($data->ente_organo_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('tipo')); ?>:</b>
	<?php echo CHtml::encode($data->tipo); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fecha')); ?>:</b>
	<?php echo CHtml::encode($data->fecha); ?>
	<br />


</div>