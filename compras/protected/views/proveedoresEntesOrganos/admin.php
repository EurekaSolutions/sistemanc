<?php
$this->breadcrumbs=array(
	'Proveedores Entes Organoses'=>array('index'),
	'Manage',
);

/*$this->menu=array(
array('label'=>'List ProveedoresEntesOrganos','url'=>array('index')),
array('label'=>'Create ProveedoresEntesOrganos','url'=>array('create')),
);*/

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
$('.search-form').toggle();
return false;
});
$('.search-form form').submit(function(){
$.fn.yiiGridView.update('proveedores-entes-organos-grid', {
data: $(this).serialize()
});
return false;
});
");
?>

<h1>Mis Proveedores</h1>
<!-- 
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
</div> --><!-- search-form -->

<?php $this->widget('booster.widgets.TbGridView',array(
'id'=>'proveedores-entes-organos-grid',
'dataProvider'=>$model->search(),
'filter'=>$model,
'summaryText'=>'',
'columns'=>array(
		//'id',
		array('name'=>'proveedor_id', 'value'=>'$data->proveedor->razon_social'),
		//array('name'=>'ente_organo_id', 'value'=>'$data->enteOrgano->nombre'),
		'anho',
array(
'class'=>'booster.widgets.TbButtonColumn','template'=>'{delete}'
),
),
)); ?>
