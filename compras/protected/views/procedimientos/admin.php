<?php
$this->breadcrumbs=array(
	'Procedimientos'=>array('index'),
	'Administrar',
);

$this->menu=array(
//array('label'=>'Lista de Procedimientos','url'=>array('index')),
array('label'=>'Registrar Procedimiento','url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
$('.search-form').toggle();
return false;
});
$('.search-form form').submit(function(){
$.fn.yiiGridView.update('procedimientos-grid', {
data: $(this).serialize()
});
return false;
});
");
?>

<h1>Administrar Procedimientos</h1>

<!-- <p>
	You may optionally enter a comparison operator (<b>&lt;</b>, <b>&lt;=</b>, <b>&gt;</b>, <b>&gt;=</b>, <b>
		&lt;&gt;</b>
	or <b>=</b>) at the beginning of each of your search values to specify how the comparison should be done.
</p>
-->
<?php //echo CHtml::link('Advanced Search','#',array('class'=>'search-button btn')); ?>
<!-- <div class="search-form" style="display:none">
	<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?> 
</div> --><!-- search-form -->

<?php $this->widget('booster.widgets.TbGridView',array(
'id'=>'procedimientos-grid',
'dataProvider'=>$model->search(),
'filter'=>$model,
'summaryText'=>'',
'columns'=>array(
		//'id',
		'num_contrato',
		'anho',
		//'fecha',
		'tipo',
		//'ente_organo_id',
array(
'class'=>'booster.widgets.TbButtonColumn','template'=>'{update}{delete}'
),
),
)); ?>
