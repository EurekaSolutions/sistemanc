<?php 
/**
 * 
 * presuPro
 *   
 * productosPartidas
 * 
 * 
 * */

		//$presuProducto = ;
		// $gridColumns
		$gridColumns = array(

			array('name'=>'partida_id', 'header'=>'Partida','value'=>array($this,'obtenerNombrePartida')),
			array('name'=>'monto_presupuestado', 'header'=>'Monto Bs.','value'=>array($this,'totalPartida')),
			
			array(
				'htmlOptions' => array('nowrap'=>'nowrap'),
	
				'class'=>'booster.widgets.TbButtonColumn',
				'template'=>'{delete}', // {view} {update}
				'deleteButtonOptions'=>array('confirm'=>'¿Está seguro que desea eliminar esta partida? Recuerde que al eliminarla, todos los productos asociados se eliminaran.',
					'ajax'=>array(
								'type' => 'GET',											
								'url'=>'js:$(this).attr("href")',
								'update'=>'#listaPartidasEliminar',
								
						),
					),
				'deleteButtonUrl'=>'Yii::app()->createUrl("/planificacion/eliminaPartida", array("id"=>$data->presupuesto_partida_id))',
			)
		);

		
		$gridDataProvider = new CArrayDataProvider($presupuestoPartidas,array(
											    'keyField' => 'presupuesto_partida_id',		  		         
											/*    'sort'=>array(
												        'attributes'=>array(
												             'producto_id','unidad_id','costo_unidad','cantidad'
												        ),
												    ),*/
												'pagination'=>false,
											));
		$this->widget('booster.widgets.TbExtendedGridView', array(
		        'type' => 'striped bordered condensed',
		        'id'=>'listaPartidas',
		        'updateSelector'=>'custom-page-selector', //update selector
		        'dataProvider' => $gridDataProvider,
		        'template' => "{pager}{items}{pager}",
		        //'filter' => new PresupuestoProductos(),
		        'columns' => $gridColumns, 

		    ));

?>