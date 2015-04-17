<?php

			 $this->widget('booster.widgets.TbExtendedGridView',array(
									'id'=>'facturas-productos-grid'.time(),
									'dataProvider'=>$dataProvider,
									//'filter'=>$model,
									'summaryText'=>'',
									'ajaxUpdate'=>true, 
									'columns'=>array(
											//'id',
											//'factura_id',
											array('name'=>'producto_id', 'value'=>'$data->producto->etiquetaProducto()'),
											array('name' => 'costo_unitario', 'value'=>'number_format($data->costo_unitario,2)'),
											'cantidad_adquirida',
											array('name'=>'iva_id','value'=>'$data->iva->etiquetaPorcentaje()'),
											array('name'=>'unidad_id','value'=>'$data->unidad->nombre'),
											/*
											'fecha',
											'presupuesto_partida_id',
											*/
										array(
										'class'=>'booster.widgets.TbButtonColumn',
											'template'=>'{delete}',
										),
									),
							));
