<?php
$this->breadcrumbs=array(
	'Facturas'=>array('index'),
	'Administrar',
);

$this->menu=array(
//array('label'=>'Lista de Facturas','url'=>array('index')),
array('label'=>'Registrar Factura','url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
$('.search-form').toggle();
return false;
});
$('.search-form form').submit(function(){
$.fn.yiiGridView.update('facturas-grid', {
data: $(this).serialize()
});
return false;
});
");
?>

<h1>Administrar Facturas</h1>

<!-- <p>
	You may optionally enter a comparison operator (<b>&lt;</b>, <b>&lt;=</b>, <b>&gt;</b>, <b>&gt;=</b>, <b>
		&lt;&gt;</b>
	or <b>=</b>) at the beginning of each of your search values to specify how the comparison should be done.
</p>-->

<?php //echo CHtml::link('Advanced Search','#',array('class'=>'search-button btn')); ?>
<div class="search-form" style="display:none">
	<!-- <?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?> -->
</div><!-- search-form -->

<?php $this->widget('booster.widgets.TbGridView',array(
'id'=>'facturas-grid',
'dataProvider'=>$model->search(),
'filter'=>$model,
'columns'=>array(
		//'id',
		'num_factura',
		'anho',
		array('name'=>'proveedor_id', 'value'=>'$data->proveedor->rif." - ".$data->proveedor->razon_social'),
		array('name'=>'procedimiento_id', 'value'=>'$data->procedimiento->tipo." Número: ".$data->procedimiento->num_contrato'),
		array('name'=>'cierre_carga', 'value'=>'$data->cierre_carga?"Cerrada":"Abierta"'),
		array('name'=>'fecha', 'value'=>'date("Y-m-d H:i:s",strtotime($data->fecha))'),
		/*
		'fecha_factura',
		'ente_organo_id',
		*/
array(
'class'=>'booster.widgets.TbButtonColumn','template'=>'{update} {delete}'
),
),
)); ?>
