<?php
$this->breadcrumbs=array(
	'Usuarios Ws'=>array('index'),
	'Manejar',
);

$this->menu=array(
//array('label'=>'List UsuariosWs','url'=>array('index')),
array('label'=>'Crear UsuariosWs','url'=>array('create')),
array('label'=>'Obtener WSDL','url'=>array('#'), 'linkOptions'=> array('target'=>'_blank')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
$('.search-form').toggle();
return false;
});
$('.search-form form').submit(function(){
$.fn.yiiGridView.update('usuarios-ws-grid', {
data: $(this).serialize()
});
return false;
});
");
?>

<h1>Manejar Usuarios Ws</h1>

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
'id'=>'usuarios-ws-grid',
'dataProvider'=>$model->search(),
'filter'=>$model,
'columns'=>array(
		//'id',
		'institucion',
		'correo',
		'usuario',
		/*'clave',
		'session',
		'token',
		'fecha_creacion',
		'fecha_actualizacion',
		*/
array(
'class'=>'booster.widgets.TbButtonColumn', 'template' => '{delete}',
),
),
)); ?>
