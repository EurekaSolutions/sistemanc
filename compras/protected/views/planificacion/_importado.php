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

<?php foreach ($presuImps as $key => $value) 
		foreach (PresupuestoImportacion::model()->findAllByAttributes(array('presupuesto_partida_id'=>$value->presupuesto_partida_id,'producto_id'=>$value->producto_id)) as $key => $presuImp){

			echo 'Lista de productos importados asociados al producto nacional: '.$this->obtenerProductoNombre($presuImp);
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
		            <th data-field="descripcion">Descripcion</th>
		            <th data-field="totalbs">Total Bs.</th>
		        </tr>
		    </thead>
		    <tbody>
		    <?php foreach ($presuImp as $key => $presIm) {
		    	# code...
		    ?>
		    	<tr class="principaltr">

		    		<td><?php echo $this->obtenerCodigoNcmNombre($presIm->codigosNcms);?></td>
		    		<td><?php echo $presIm->divisa->abreviatura; ?></td>
					<td><?php echo $presIm->tipo =='corpovex' ? 'Corpovex' : 'Licitacion Internacional'; ?></td>
					<td><?php echo $presIm->fecha_llegada; ?></td>
					<td><?php echo $presIm->monto_presupuesto; ?></td>
					<td><?php echo $presIm->cantidad; ?></td>
					<td><?php echo $presIm->descripcion; ?></td>
		    		<td><?php echo number_format($presIm->monto_presupuesto*$presIm->cantidad*$presIm->divisa->tasa->tasa,2,',','.');?></td>
		    		

		    	</tr>
		    <?php }?>
		    </tbody>
		</table>

<?php 
} ?>