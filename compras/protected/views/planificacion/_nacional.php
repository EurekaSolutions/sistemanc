<?php 
/**
 * 
 * presuPro
 *   
 * productosPartidas
 * 
 * 
 * */

		echo '<h3>Lista de productos nacionales por partida seleccionada: </h3>';
		//$presuProducto = ;
		// $gridColumns
		$gridColumns = array(
			//array('name'=>'id', 'header'=>'#', 'htmlOptions'=>array('style'=>'width: 60px')),
			array('name'=>'producto_id', 'header'=>'Producto','value'=>array($this,'obtenerProductoNombre')),
			array('name'=>'unidad_id', 'header'=>'Unidad','value'=>array($this,'obtenerUnidadNombre')),
			array('name'=>'costo_unidad', 'header'=>'Costo Unidad', 'value'=>array($this,'obtenerCostoUnidadNombre')),
			array('name'=>'cantidad', 'header'=>'Cantidad', /*'footer'=>'Total Hours'*/),
			array(/*'name'=>'cantidad',*/ 'header'=>'Total Bs.', 'value'=>array($this,'totalProducto'),/*'class'=>'booster.widgets.TbTotalSumColumn'*/),
			//array('name'=>'tipo', 'header'=>'Tipo de Compra'),			    

			array(
				'htmlOptions' => array('nowrap'=>'nowrap'),
	
				'class'=>'booster.widgets.TbButtonColumn',
				'template'=>'{delete}', // {view} {update}
				'deleteConfirmation'=>"js:'El producto '+$(this).parent().parent().children(':first-child').text()+' será borrado! Continuar?'",
				//'viewButtonUrl'=>null,
				//'updateButtonUrl'=>null,
				'deleteButtonUrl'=>'Yii::app()->createUrl("/planificacion/eliminarProducto", array("id"=>$data->presupuesto_id))',
			)
		);

		
		$gridDataProvider = new CArrayDataProvider($presuPros,array(
											    'keyField' => 'presupuesto_id',		  		         
											/*    'sort'=>array(
												        'attributes'=>array(
												             'producto_id','unidad_id','costo_unidad','cantidad'
												        ),
												    ),
												'pagination'=>array(
												        'pageSize'=>2,
												        'pageVar'=>'custom-page-selector', //page selector
												    ),*/
											));
		$this->widget('booster.widgets.TbExtendedGridView', array(
		        'type' => 'striped bordered condensed',
		        'id'=>'listaProductos',
		        'updateSelector'=>'custom-page-selector', //update selector
		        'dataProvider' => $gridDataProvider,
		        'template' => "{pager}{items}{pager}",
		        //'filter' => new PresupuestoProductos(),
		        'columns' => $gridColumns, 

		    ));

?>
	<!-- <?php if(isset($presuPros[0])){ 
		echo '<h3>Lista de productos nacionales por partida seleccionada: </h3>';
	?>
	
		<table data-toggle="table" data-url="data1.json" data-cache="false" data-height="">
		    <thead>
		        <tr class="principaltr">
		            <th data-field="producto">Producto</th>
		            <th data-field="unidad">Unidad</th>
		            <th data-field="costo Unidad">Costo Unidad</th>
		            <th data-field="cantidad">Cantidad</th>
		            <th data-field="total">Total</th>
		           <th data-field="total">Acción</th>
		        </tr>
		    </thead>
		    <tbody>
		    <?php foreach ($presuPros as $key => $presuPro) {
		    ?>
		    	<tr class="principaltr">
	
		    		<td><?php echo $presuPro->producto->nombre;?></td>
		    		<td><?php echo $presuPro->unidad->nombre;?></td>
		    		<td><?php echo number_format($presuPro->costo_unidad,2,',','.').' Bs.';?></td>
		    		<td><?php echo $presuPro->cantidad;?></td>
		    		<td><?php echo number_format($presuPro->costo_unidad*$presuPro->cantidad,2,',','.').' Bs.';?></td>
		    		<td><?php //echo CHtml::link('Eliminar',Yii::app()->createAbsoluteUrl('/planificacion/eliminarProducto',array('id'=>$presuPro->presupuesto_id)));?></td>
	
		    	</tr>
		    <?php }?>
		    </tbody>
		</table>
		<?php } ?> -->