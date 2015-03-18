<?php
$this->breadcrumbs=array(
	'Partida Productoses'=>array('index'),
	'Manage',
);

$this->menu=array(
array('label'=>'List PartidaProductos','url'=>array('index')),
array('label'=>'Create PartidaProductos','url'=>array('create')),
);

/*Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
$('.search-form').toggle();
return false;
});
$('.search-form form').submit(function(){
$.fn.yiiGridView.update('partida-productos-grid', {
data: $(this).serialize()
});
return false;
});
");*/
?>

<h1>Eliminar Productos asociados a Partidas</h1>

<!-- <p>
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


<?php $form=$this->beginWidget('booster.widgets.TbActiveForm',array(
	'id'=>'partida-productos-form',
	'enableAjaxValidation'=>false,
)); ?>

<?php
    foreach(Yii::app()->user->getFlashes() as $key => $message) {
        echo '<div class="flash-' . $key . '">' . $message . "</div>\n";
    }
?>

<?php 	
		$criteria = new CDbCriteria();
		$criteria->condition = 'p3 <> 0';
		//$criteria->params = array(':p1'=>$general->p1, ':p2' => $general->p2);

		$especificas = new Partidas('search');
		$especificas = $especificas->findAll($criteria);

		$especificas_lista = CHtml::listData($especificas, function($especificas) {
																	return CHtml::encode($especificas->partida_id);
																}, function($especificas) {
																	return CHtml::encode($especificas->p1.'-'.$especificas->p2.'-'.$especificas->p3.'-'.$especificas->p4.' '.$especificas->nombre);
																});
echo $form->select2Group($model, 'partida_id',
							array(
							'wrapperHtmlOptions' => array(
								'class' => 'col-sm-5',
							),
							'widgetOptions' => array(
								'asDropDownList' => true,
								'data' => $especificas_lista,
						        'htmlOptions'=>array('id'=>'partida','ajax' => array(
													'type'=>'POST', //request type
													'url'=>CController::createUrl('partidaProductos/buscarGridProductosPartida'), //url to call.
													//Style: CController::createUrl('currentController/methodToCall')
													'update'=>'#partidaProductos', //selector to update
													//'data'=>'js:javascript statement' 
													//leave out the data key to pass all form values through
											  )),
								'options' => array(
									//'tags' => array('clever', 'is', 'better', 'clevertech'),
									'placeholder' => 'Seleccione partida especifica',
									// 'width' => '40%', 
									'tokenSeparators' => array(',', ' ')
								)
							)
						)
					);

echo $form->select2Group($model, 'partida_producto_id',
							array(
							'wrapperHtmlOptions' => array(
								'class' => 'col-sm-5',
							),
							'widgetOptions' => array(
								'asDropDownList' => true,
								'data' => $listaProductos,
						        'htmlOptions'=>array('id'=>'partidaProductos','multiple'=>true),
								'options' => array(
									//'tags' => array('clever', 'is', 'better', 'clevertech'),
									'placeholder' => 'Seleccione producto a eliminar asociación',
									// 'width' => '40%', 
									'tokenSeparators' => array(',', ' ')
								)
							)
						)
					);
?>

 <div class="form-actions">
	<?php $this->widget('booster.widgets.TbButton', array(
			'buttonType'=>'submit',
			'context'=>'primary',
			'label'=>$model->isNewRecord ? 'Eliminar' : 'Guardar',
		)); ?>
</div> 

<?php $this->endWidget(); ?>


<div id="gridProductosPartida"></div>


<?php /*$this->widget('booster.widgets.TbGridView',array(
'id'=>'partida-productos-grid',
'dataProvider'=>$model->search(),
'filter'=>$model,
'columns'=>array(
		'partida_id',
		'producto_id',
		'tipo_operacion',
		'fecha_desde',
		'fecha_hasta',
		'partida_producto_id',
array(
'class'=>'booster.widgets.TbButtonColumn','template'=>'{delete}'
),
),
));*/ ?>
