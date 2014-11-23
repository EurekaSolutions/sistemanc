<?php
/* @var $this UsuariosController */
/* @var $data Usuarios */
?>

<div class="view">

    	<b><?php echo CHtml::encode($data->getAttributeLabel('usuario_id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->usuario_id),array('view','id'=>$data->usuario_id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('codigo_onapre')); ?>:</b>
	<?php echo CHtml::encode($data->codigo_onapre); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('usuario')); ?>:</b>
	<?php echo CHtml::encode($data->usuario); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('contrasena')); ?>:</b>
	<?php echo CHtml::encode($data->contrasena); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('correo')); ?>:</b>
	<?php echo CHtml::encode($data->correo); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('creado_el')); ?>:</b>
	<?php echo CHtml::encode($data->creado_el); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('actualizado_el')); ?>:</b>
	<?php echo CHtml::encode($data->actualizado_el); ?>
	<br />


</div>