<?php
$this->breadcrumbs=array(
	'Usuarios'=>array('index'),
	'Administrar',
);

$this->menu=array(
array('label'=>'List Usuarios','url'=>array('index')),
array('label'=>'Create Usuarios','url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
$('.search-form').toggle();
return false;
});
$('.search-form form').submit(function(){
$.fn.yiiGridView.update('usuarios-grid', {
data: $(this).serialize()
});
return false;
});
");
?>

<h1>Administrar Usuarios</h1>

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
'id'=>'usuarios-grid',
'dataProvider'=>$model->search(),
'filter'=>$model,
'columns'=>array(
		'usuario_id',
		'codigo_onapre',
		'usuario',
		'contrasena',
		'correo',
		'creado_el',
		/*
		'actualizado_el',
		'esta_activo',
		'esta_deshabilitado',
		'correo_verificado',
		'llave_activacion',
		'ultima_visita_el',
		*/
array(
'class'=>'booster.widgets.TbButtonColumn',
),
),
)); ?>
