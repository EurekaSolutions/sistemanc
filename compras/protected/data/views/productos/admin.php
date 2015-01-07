<?php
$this->breadcrumbs=array(
	'Productos'=>array('index'),
	'Administrar',
);

$this->menu=array(
array('label'=>'Lista de Productos','url'=>array('index')),
array('label'=>'Crear Productos','url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
$('.search-form').toggle();
return false;
});
$('.search-form form').submit(function(){
$.fn.yiiGridView.update('productos-grid', {
data: $(this).serialize()
});
return false;
});
");
?>

<h1>Administrar Productos</h1>

 <p>
	Puedes opcinalmente ingresar un operador de comparación (<b>&lt;</b>, <b>&lt;=</b>, <b>&gt;</b>, <b>&gt;=</b>, <b>
		&lt;&gt;</b>
	o <b>=</b>) al inicio de cada uno de los valores de búsqueda para especificar cómo se debe hacer la comparación.
</p> 

<?php echo CHtml::link('Busqueda Avanzada','#',array('class'=>'search-button btn')); ?>
<div class="search-form" style="display:none">
	<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?>
</div><!-- search-form -->

<?php $this->widget('booster.widgets.TbGridView',array(
'id'=>'productos-grid',
'dataProvider'=>$model->search(),
'filter'=>$model,
'columns'=>array(
		'producto_id',
		'cod_segmento',
		'cod_familia',
		'cod_clase',
		'cod_producto',
		'nombre',
array(
'class'=>'booster.widgets.TbButtonColumn',
),
),
)); ?>
