<?php $form=$this->beginWidget('booster.widgets.TbActiveForm',array(
	'id'=>'facturas-productos-form',
	'enableAjaxValidation'=>false,
)); ?>

<p class="help-block">Fields with <span class="required">*</span> are required.</p>

<?php echo $form->errorSummary($model); ?>

	<?php //echo $form->textFieldGroup($model,'factura_id',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>

	<div class="form-group">
	<?php 	
		$list = CHtml::listData(Facturas::model()->findAll(), 'id', 'num_factura');

		echo CHtml::label('Seleccionar Factura', 'Factura');
		echo "<br>";
		$this->widget(
		    'booster.widgets.TbSelect2',
		    array(
		        'asDropDownList' => true,
		        'model' => $model,
		        
		        'attribute' => 'factura_id',
		        //'name' => 'factura_id',
		        'data' => $list,
		        'htmlOptions'=>array('id'=>'Factura',),
		        'options' => array(
		            //'tags' => array('proveedores'),
		            'placeholder' => 'Factura',
		            'width' => '40%',
		            'tokenSeparators' => array(',', ' ')
		        )
		    )
		);
	?>


		<?php /*echo $form->dropDownListGroup(
			$model,
			'proveedor_id',
			array(
				'wrapperHtmlOptions' => array(
					'class' => 'col-sm-5',
				),
				'widgetOptions' => array(
					'data' => $list,
					'htmlOptions' => array(),
				)
			)
		);*/ ?>
	<?php //echo $form->textFieldGroup($model,'proveedor_id',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>
	</div>

	<?php //echo $form->textFieldGroup($model,'presupuesto_partida_id',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>

	<div class="form-group">
	<?php 	
		$list = CHtml::listData(Facturas::model()->findAll(), 'id', 'num_factura');

		echo CHtml::label('Seleccionar Partida', 'Partida');
		echo "<br>";
		$this->widget(
		    'booster.widgets.TbSelect2',
		    array(
		        'asDropDownList' => true,
		        'model' => $model,
		        
		        'attribute' => 'presupuesto_partida_id',
		        //'name' => 'factura_id',
		        'data' => $list,
		        'htmlOptions'=>array('id'=>'Partida',),
		        'options' => array(
		            //'tags' => array('proveedores'),
		            'placeholder' => 'Partida',
		            'width' => '40%',
		            'tokenSeparators' => array(',', ' ')
		        )
		    )
		);
	?>


		<?php /*echo $form->dropDownListGroup(
			$model,
			'proveedor_id',
			array(
				'wrapperHtmlOptions' => array(
					'class' => 'col-sm-5',
				),
				'widgetOptions' => array(
					'data' => $list,
					'htmlOptions' => array(),
				)
			)
		);*/ ?>
	<?php //echo $form->textFieldGroup($model,'proveedor_id',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>
	</div>

	<?php //echo $form->textFieldGroup($model,'producto_id',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>


	<div class="form-group">
	<?php 	
		$list = CHtml::listData(Facturas::model()->findAll(), 'id', 'num_factura');

		echo CHtml::label('Seleccionar Producto', 'Producto');
		echo "<br>";
		$this->widget(
		    'booster.widgets.TbSelect2',
		    array(
		        'asDropDownList' => true,
		        'model' => $model,
		        
		        'attribute' => 'producto_id',
		        //'name' => 'factura_id',
		        'data' => $list,
		        'htmlOptions'=>array('id'=>'Producto',),
		        'options' => array(
		            //'tags' => array('proveedores'),
		            'placeholder' => 'Producto',
		            'width' => '40%',
		            'tokenSeparators' => array(',', ' ')
		        )
		    )
		);
	?>


		<?php /*echo $form->dropDownListGroup(
			$model,
			'proveedor_id',
			array(
				'wrapperHtmlOptions' => array(
					'class' => 'col-sm-5',
				),
				'widgetOptions' => array(
					'data' => $list,
					'htmlOptions' => array(),
				)
			)
		);*/ ?>
	<?php //echo $form->textFieldGroup($model,'proveedor_id',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>
	</div>


	<?php echo $form->textFieldGroup($model,'costo_unitario',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5','maxlength'=>38)))); ?>

	<?php echo $form->textFieldGroup($model,'cantidad_adquirida',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>

	<?php echo $form->textFieldGroup($model,'iva_id',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>

	<?php //echo $form->textFieldGroup($model,'fecha',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span5')))); ?>

<div class="form-actions">
	<?php $this->widget('booster.widgets.TbButton', array(
			'buttonType'=>'submit',
			'context'=>'primary',
			'label'=>$model->isNewRecord ? 'Añadir producto a factura' : 'Save',
		)); ?>
</div>

<table data-toggle="table" data-url="data1.json" data-cache="false" data-height="">
		    <thead>
		        <tr class="principaltr">
		            <th data-field="conapre">Producto</th>
		            <th data-field="nombreoue">Costo unitario</th>
		            <th data-field="tipo">Cantidad adquirida</th>
		            <th data-field="oadscripcion">iva</th>
		        </tr>
		    </thead>
		    <tbody>
		    	<tr class="principaltr">
		    		<td>53.10.16.02 - Camisas de hombre</td>
		    		<td>350</td>
		    		<td>20</td>
		    		<td>12</td>
		    	</tr>
		    </tbody>
		</table>

<div class="form-actions">
	<?php $this->widget('booster.widgets.TbButton', array(
			'buttonType'=>'submit',
			'context'=>'primary',
			'label'=>$model->isNewRecord ? 'Guardar' : 'Save',
		)); ?>
</div>
<?php $this->endWidget(); ?>
