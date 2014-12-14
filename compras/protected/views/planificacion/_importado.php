<?php 
/**
 * 
 * presuPro
 *   
 * productosPartidas
 * 
 * 
 * */

		
			echo '<h3>Lista de productos importados </h3>';
		
		// $gridColumns
		$gridColumns = array(
			array('name'=>'producto_id', 'header'=>'Producto Nacional','value'=>array($this,'obtenerProductoNombre'),/*'filter'=>'',*/ 'htmlOptions'=>array('style'=>'width: 100px')),
			array('name'=>'codigo_ncm_id', 'header'=>'Producto Importado','value'=>array($this,'obtenerCodigoNcmNombre')),
			array('name'=>'divisa_id', 'header'=>'Divisa','value'=>array($this,'obtenerDivisa')),
			array('name'=>'tipo', 'header'=>'Tipo Importación','value'=>array($this,'obtenerTipoImportacion')),
			array('name'=>'fecha_llegada', 'header'=>'Fecha estimada importación',),
			array('name'=>'monto_presupuesto', 'header'=>'Costo unitario de la divisa','value'=>array($this,'obtenerCostoUnitarioDivisa')),
			array('name'=>'cantidad', 'header'=>'Cantidad'),
			array('name'=>'descripcion', 'header'=>'Descripción'),
			array('header'=>'Total Bs.', 'value'=>array($this,'obtenerTotalProducto')),

			//array('name'=>'cantidad', 'header'=>'Cantidad'),
			//array('name'=>'tipo', 'header'=>'Tipo de Compra'),
			array(
				'htmlOptions' => array('nowrap'=>'nowrap'),
				'class'=>'booster.widgets.TbButtonColumn',
				'template'=>'{delete}',
				'deleteConfirmation'=>"js:'El producto con codigo arancelario '+$(this).parent().parent().children(':first-child').text()+' será borrado! Continuar?'",
				'viewButtonUrl'=>null,
				'updateButtonUrl'=>null,
				'deleteButtonUrl'=>'Yii::app()->createUrl("/planificacion/eliminarProductoImportado", array("ppid"=>$data->presupuesto_partida_id,"pid"=>$data->producto_id,"cn"=>$data->codigo_ncm_id))',
			)
		);

		$gridDataProvider = new CArrayDataProvider($presuImps,array(
											    'keyField' => 'presupuesto_partida_id',
											   /*     'sort'=>array(
												        'attributes'=>array(
												             'producto_id',
												        ),
												    ),
												'pagination'=>array(
												        'pageSize'=>3,
												        'pageVar'=>'custom-page-selector', //page selector
												    ),*/
											));
		$this->widget('booster.widgets.TbExtendedGridView', array(
		        'type' => 'striped bordered condensed',
		        'id'=>'listaProductosImportados',
		        'updateSelector'=>'custom-page-selector', //update selector
		        'dataProvider' => $gridDataProvider,
		        'template' => "{pager}{items}{pager}",
		        //'class'=>'CLinkPager',
		        //'filter' => $presuImps[0],
		        'columns' => $gridColumns,
		    ));	

?>
<!-- 
<?php //print_r($presuImps);



				
if(isset($presuImps[0])){
			echo '<h3>Lista de productos importados</h3>';
				$criteria = new CDbCriteria();
				$criteria->distinct=true;
				//$criteria->group= 't.producto_id, t.presupuesto_partida_id'; 		//Tambien sirve
				$criteria->condition = "presupuesto_partida_id=".$presuImps[0]->presupuesto_partida_id;
				$criteria->select = 'producto_id, presupuesto_partida_id';
				
				//print_r($presuImps[0]::model()->findAll($criteria));
			$presuIm = PresupuestoImportacion::model()->findAll($criteria);
			//print_r($presuIm);
		foreach ($presuIm as $key => $presuImp){

			echo 'Lista de codigos arancelarios asociados al producto: '.$this->obtenerProductoNombre($presuImp);
	?>
		
		<table data-toggle="table" data-url="data1.json" data-cache="false" data-height="">
		    <thead>
		        <tr class="principaltr">
		            <th data-field="Producto">Producto Importado</th>
		            <th data-field="Divisa">Divisa</th>
		            <th data-field="tipoimportacion">Tipo Importación</th>
		            <th data-field="fechallegada">Fecha estimada de la importación</th>
		            <th data-field="unidad">Costo unitario en divisa </th>
		            <th data-field="cantidad">Cantidad</th>
		            <th data-field="descripcion">Descripción</th>
		            <th data-field="totalbs">Total Bs.</th>
		        </tr>
		    </thead>
		    <tbody>
		    <?php 

		    	foreach (PresupuestoImportacion::model()->findAllByAttributes(array('producto_id'=>$presuImp->producto_id,'presupuesto_partida_id'=>$presuImp->presupuesto_partida_id)) as $key => $presIm) {
		    		
		    ?>
		    	<tr class="principaltr">

		    		<td><?php echo $this->obtenerCodigoNcmNombre($presIm->codigosNcms);?></td>
		    		<td><?php echo $presIm->divisa->abreviatura; ?></td>
					<td><?php echo $presIm->tipo =='corpovex' ? 'Corpovex' : 'Licitacion Internacional'; ?></td>
					<td><?php echo $presIm->fecha_llegada; ?></td>
					<td><?php echo number_format($presIm->monto_presupuesto,2,',','.'); ?></td>
					<td><?php echo $presIm->cantidad; ?></td>
					<td><?php echo $presIm->descripcion; ?></td>
		    		<td><?php echo number_format($presIm->monto_presupuesto*$presIm->cantidad*$presIm->divisa->tasa->tasa,2,',','.');?></td>
		    		

		    	</tr>
		    <?php }?>
		    </tbody>
		</table>

		<?php 
	}
}
 ?> -->