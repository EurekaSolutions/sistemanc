<p>
	Este mensaje contiene instrucciones para verificar este correo electronico. La solicitud fue realizada a través de la página web <?php echo CHtml::link(Yii::app()->name, $siteUrl); ?>.
    Si usted no realizo esta solicitud, por favor ignore este correo o pongase en contacto<?php echo CHtml::link('rnce@snc.gob.ve', 'rnce@snc.gob.ve'); ?> (rnce@snc.gob.ve) con el administrador del sitio.
</p>
Tu nombre de usuario es <?php echo $usuario; ?>
<p>haz clic aquí para cambiar tu contraseña:</p>
<p>
<?php echo CHtml::link($actionUrl, $actionUrl); ?>
</p>
<p>
Si el link no abre correctamente, copie y pegue en la barra de direcciones de su navegador preferido.
</p>

