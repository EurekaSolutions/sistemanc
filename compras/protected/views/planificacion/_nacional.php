<?php 
/**
 * 
 * presuPro
 *   
 * productosPartidas
 * 
 * 
 * */

		 echo $form->dropDownListGroup( $presuPro, 'producto_id',
			array(
				'wrapperHtmlOptions' => array(
					'class' => 'col-sm-5',
				),
				'label'=>'Seleccione el producto',
				'widgetOptions' => array(

					'data' => CHtml::listData($productosPartidas,'producto_id', 
							function($producto){ return CHtml::encode($this->numeroProducto($producto).' - '.$producto->nombre);}),
					//'options'=>array($model->proyecto_id => array('selected'=>true)),
					'htmlOptions' => array('prompt' => 'Seleccionar producto', /*'multiple' => false,*/ ),
				),
				'hint' => 'Selecciona el producto para añadir.'
			)
		); 

		
		echo $form->dropDownListGroup( $presuPro, 'unidad_id',
			array(
				'wrapperHtmlOptions' => array(
					'class' => 'col-sm-5',
				),
				'label'=>'Unidad',
				'widgetOptions' => array(

					'data' => CHtml::listData(Unidades::model()->findAll(),'unidad_id', 'nombre'),
					//'options'=>array($model->proyecto_id => array('selected'=>true)),
					'htmlOptions' => array('prompt' => 'Seleccionar Unidad', /*'multiple' => false,*/ ),
				),
				'hint' => 'Selecciona la unidad del producto.'
			)
		); 
		echo  $form->textFieldGroup($presuPro, 'costo_unidad',array('prepend'=>'Bs'));
		echo  $form->textFieldGroup($presuPro, 'cantidad');


?>