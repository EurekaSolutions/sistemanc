<?php 
/**
 * 
 * presuPro
 *   
 * productosPartidas
 * 
 * 
 * */

		
?>
	<?php if(isset($presuPros[0])){ 
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
		           <!--  <th data-field="total">Acción</th> -->
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
		    		<!-- <td><?php //echo CHtml::link('Eliminar',Yii::app()->createAbsoluteUrl('/planificacion/eliminarProducto',array('id'=>$presuPro->presupuesto_id)));?></td> -->

		    	</tr>
		    <?php }?>
		    </tbody>
		</table>
		<?php } ?>