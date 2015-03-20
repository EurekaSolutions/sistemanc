<?php
$this->breadcrumbs=array(
	'Presupuesto Partidases'=>array('index'),
	'Manage',
);

$this->menu=array(
array('label'=>'List PresupuestoPartidas','url'=>array('index')),
array('label'=>'Create PresupuestoPartidas','url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
$('.search-form').toggle();
return false;
});
$('.search-form form').submit(function(){
$.fn.yiiGridView.update('presupuesto-partidas-grid', {
data: $(this).serialize()
});
return false;
});
");
?>

<h1>Manage Presupuesto Partidases</h1>

<p>
	You may optionally enter a comparison operator (<b>&lt;</b>, <b>&lt;=</b>, <b>&gt;</b>, <b>&gt;=</b>, <b>
		&lt;&gt;</b>
	or <b>=</b>) at the beginning of each of your search values to specify how the comparison should be done.
</p>

<?php echo CHtml::link('Advanced Search','#',array('class'=>'search-button btn')); ?>
<div class="search-form" style="display:none">
	<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?>
</div><!-- search-form -->

<?php $this->widget('booster.widgets.TbGridView',array(
'id'=>'presupuesto-partidas-grid',
'dataProvider'=>$model->search(),
'filter'=>$model,
'columns'=>array(
		'presupuesto_partida_id',
		'partida_id',
		'monto_presupuestado',
		'fecha_desde',
		'fecha_hasta',
		'tipo',
		/*
		'anho',
		'ente_organo_id',
		'presupuesto_id',
		*/
array(
'class'=>'booster.widgets.TbButtonColumn',
),
),
)); ?>
