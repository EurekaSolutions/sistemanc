<?php 
		
		// $gridColumns
		$gridColumns = array(
			//array('name'=>'producto_id', 'header'=>'Producto Nacional','value'=>array($this,'obtenerProductoNombre'),/*'filter'=>'',*/ 'htmlOptions'=>array('style'=>'width: 100px')),
			array('name'=>'nombre', 'header'=>'Nombre',/*'value'=>array($this,'obtenerCodigoNcmNombre')*/),
			array('name'=>'codigo', 'header'=>'Código',/*'value'=>array($this,'obtenerDivisa')*/),
			/*array('name'=>'tipo', 'header'=>'Tipo Importación','value'=>array($this,'obtenerTipoImportacion')),
			array('name'=>'fecha_llegada', 'header'=>'Fecha estimada importación',),
			array('name'=>'monto_presupuesto', 'header'=>'Costo unitario en divisa','value'=>array($this,'obtenerCostoUnitarioDivisa')),
			array('name'=>'cantidad', 'header'=>'Cantidad'),
			array('name'=>'descripcion', 'header'=>'Descripción'),
			array('header'=>'Total Bs.', 'value'=>array($this,'obtenerTotalProducto')),*/

			array(
				'htmlOptions' => array('nowrap'=>'nowrap'),
				'class'=>'booster.widgets.TbButtonColumn',
				'template'=>'{delete}',
				/*'buttons'=>array(
					'delete'=>array(
						'url'=>'Yii::app()->createUrl("/planificacion/eliminarProductoImportado", array("ppid"=>$data->presupuesto_partida_id,"pid"=>$data->producto_id,"cn"=>$data->codigo_ncm_id))',
						'options' => array(
							'confirm'=>"js:'¿El producto con codigo arancelario '+$(this).parent().parent().children(':first-child').text()+' será borrado! ¿Continuar?'",
							'ajax' => array(
											'type' => 'GET',											
											'url'=>'js:$(this).attr("href")',
											'update'=>'#listaProductosImportados',
											'success' => 'js:function(data) { $.fn.yiiGridView.update("my-grid")}')
						),
					),
				),*/
				'deleteButtonOptions'=>array(
							'confirm' => '¿Está seguro que desea eliminar este proyecto? Recuerde que al eliminarlo, todas las partidas y productos asociados se eliminaran.',
							'ajax' => array(
											'type' => 'GET',											
											'url'=>'js:$(this).attr("href")',
											'update'=>'#listaProyectosEliminar',
											//'success' => 'js:function(data) { $.fn.yiiGridView.update("my-grid")}'
											)
						),
				'deleteConfirmation'=>"js:'¿El proyecto con codigo '+$(this).parent().parent().children(':nth-child(2)').text()+' será borrado! ¿Continuar?'",
				//'viewButtonUrl'=>null,
				//'updateButtonUrl'=>null,
				'deleteButtonUrl'=>'Yii::app()->createUrl("/planificacion/eliminaProyecto", array("id"=>$data->proyecto_id,))',
			)
		);
	
		$gridDataProvider = new CArrayDataProvider($proyectos,array(
											    'keyField' => 'proyecto_id',
											   /*     'sort'=>array(
												        'attributes'=>array(
												             'producto_id',
												        ),
												    ),*/
												'pagination'=>false,/*array(
												        'pageSize'=>15,
												        'pageVar'=>'custom-page-selector', //page selector
												    ),*/
											));

		$this->widget('booster.widgets.TbExtendedGridView', array(
		        'type' => 'striped bordered condensed',
		        'id'=>'listaProyectos',
		        'updateSelector'=>'custom-page-selector', //update selector
		        'dataProvider' => $gridDataProvider,
		        'template' => "{pager}{items}{pager}",
		        'pager'=>array('class'=>'CLinkPager'),
		        //'filter' => $presuImps[0],
		        'columns' => $gridColumns,
		    ));	
?>