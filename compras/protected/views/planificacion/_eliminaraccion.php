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

			array('name'=>'accion_id', 'header'=>'Nombre','value'=>array($this,'obtenerNombreAccion')),
			array('name'=>'codigo_accion', 'header'=>'Código'),
			
			array(
				'htmlOptions' => array('nowrap'=>'nowrap'),
	
				'class'=>'booster.widgets.TbButtonColumn',
				'template'=>'{delete}', // {view} {update}
				'deleteButtonOptions'=>array('confirm'=>'¿Está seguro que desea eliminar esta acción centralizada? Recuerde que al eliminarla, todas las partidas y productos asociados se eliminaran.',
					'ajax'=>array(
								'type' => 'GET',											
								'url'=>'js:$(this).attr("href")',
								'update'=>'#listaAccionesEliminar',
								
						),
					),
				'deleteButtonUrl'=>'Yii::app()->createUrl("/planificacion/eliminaAccion", array("id"=>$data->accion_id))',
			)
		);

		
		$gridDataProvider = new CArrayDataProvider($acciones,array(
											    'keyField' => false,		  		         
											/*    'sort'=>array(
												        'attributes'=>array(
												             'producto_id','unidad_id','costo_unidad','cantidad'
												        ),
												    ),*/
												'pagination'=>false,
											));
		$this->widget('booster.widgets.TbExtendedGridView', array(
		        'type' => 'striped bordered condensed',
		        'id'=>'listaAcciones',
		        'updateSelector'=>'custom-page-selector', //update selector
		        'dataProvider' => $gridDataProvider,
		        'template' => "{pager}{items}{pager}",
		        //'filter' => new PresupuestoProductos(),
		        'columns' => $gridColumns, 

		    ));

?>