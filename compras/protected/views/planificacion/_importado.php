<?php 
/**
 * 
 * presuPro
 *   
 * productosPartidas
 * 
 * 
 * */

		echo '<h3>Lista de productos importados</h3>';

?>

<?php //print_r($presuImps);



				
if(isset($presuImps[0])){
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
		    	# code...
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
 ?>