<?php /* @var $this Controller */ ?>
<?php $this->beginContent('//layouts/main'); ?>
		<h3 style="text-align: center;">PLAN DE COMPRAS DEL ESTADO <span class="label label-default"><?php echo Yii::app()->params['trimestresFechas'][Yii::app()->session['trimestreSeleccionado']]['anho'];//echo intval(date("Y")+1);?></span></h3>
		<br>
	    <div class="row show-grid">
			<?php echo $content; ?>
		</div>
<?php $this->endContent(); ?>