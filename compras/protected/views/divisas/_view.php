<?php
/* @var $this DivisasController */
/* @var $data Divisas */
?>

<div class="view">

    	<b><?php echo CHtml::encode($data->getAttributeLabel('divisa_id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->divisa_id),array('view','id'=>$data->divisa_id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('abreviatura')); ?>:</b>
	<?php echo CHtml::encode($data->abreviatura); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('simbolo')); ?>:</b>
	<?php echo CHtml::encode($data->simbolo); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('nombre')); ?>:</b>
	<?php echo CHtml::encode($data->nombre); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('tasa')); ?>:</b>
	<?php echo CHtml::encode($data->tasa); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fecha_desde')); ?>:</b>
	<?php echo CHtml::encode($data->fecha_desde); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fecha_hasta')); ?>:</b>
	<?php echo CHtml::encode($data->fecha_hasta); ?>
	<br />


</div>