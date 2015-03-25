<h4 style="text-align: center;">REPORTE PRODUCTOS CARGADOS</h4>
<h4 style="text-align: center;">NACIONALES</h4>
<h4 style="text-align: center;"> <?php if ($nombre) echo 'Ente: '.$nombre; ?></h4><br>

<table data-toggle="table" data-url="" data-cache="false" data-height="" width="100%">
					    <thead>
					        <tr class="principaltr">
					            <th data-field="conapre">Producto</th>
					            <th data-field="nombreoue">Unidad</th>
					            <th data-field="tipo">Costo unitario</th>
					            <th data-field="tipo">Cantidad</th>
					            <th data-field="tipo">Monto</th>
					            <th data-field="tipo">Partida</th>
					            <th data-field="tipo">Acción/Proyecto</th>
					        </tr>
					    	</thead>
						    <tbody>
				    		
					    		<?php
									foreach ($proyectos as $key => $value) {
										
										foreach ($value->presupuestoPartidas as $key => $value1) {
											foreach ($value1->presupuestoProductos as $key => $value2) {
												echo '<tr>';
												echo '<td>'.$value2->producto['nombre'].'</td>';
												echo '<td>'.$value2->unidad['nombre'].'</td>';
												echo '<td>'.number_format($value2['costo_unidad'],2,',','.').'</td>';
												echo '<td>'.number_format($value2['cantidad'],2,',','.').'</td>';
												echo '<td>'.number_format($value2['monto_presupuesto'],2,',','.').'</td>';
												echo '<td>'.$value2->proyectoPartida->partida['nombre'].'</td>';
												echo '<td>'.$value['nombre'].'</td>';
												echo '</tr>';
											}
										}
									}
								?>	

								<?php
									foreach ($acciones as $key => $value) {
										
										foreach ($value->presupuestoPartidas as $key => $value1) {
											foreach ($value1->presupuestoProductos as $key => $value2) {
												echo '<tr>';
												echo '<td>'.$value2->producto['nombre'].'</td>';
												echo '<td>'.$value2->unidad['nombre'].'</td>';
												echo '<td>'.number_format($value2['costo_unidad'],2,',','.').'</td>';
												echo '<td>'.number_format($value2['cantidad'],2,',','.').'</td>';
												echo '<td>'.number_format($value2['monto_presupuesto'],2,',','.').'</td>';
												echo '<td>'.$value2->proyectoPartida->partida['nombre'].'</td>';
												echo '<td>'.$value->accion['nombre'].'</td>';
												echo '</tr>';
											}
										}
									}
								?>	
			    			
			    			</tbody>
			  </table><br><br>
		<h4 style="text-align: center;">IMPORTADOS</h4><br>

<table data-toggle="table" data-url="" data-cache="false" data-height="" width="100%">
					    <thead>
					        <tr class="principaltr">
					            <th data-field="conapre">Producto</th>
					            <th data-field="tipo">Costo unitario</th>
					            <th data-field="tipo">Cantidad</th>
					            <th data-field="tipo">Monto</th>
					            <th data-field="tipo">Divisa</th>
					            <th data-field="tipo">Tasa cambio</th>
					            <th data-field="tipo">Partida</th>
					            <th data-field="tipo">Acción/Proyecto</th>
					        </tr>
					    	</thead>
						    <tbody>
				    		<?php

									foreach ($proyectos as $key => $value) {
										
										foreach ($value->presupuestoPartidas as $key => $value1) {
											foreach ($value1->presupuestoImportacion as $key => $value2) {
												echo '<tr>';
												echo '<td>'.$value2->producto['nombre'].'</td>';
												echo '<td>'.number_format($value2['monto_presupuesto'],2,',','.').'</td>';
												echo '<td>'.number_format($value2['cantidad'],2,',','.').'</td>';
												$monto = $value2['monto_presupuesto']*$value2['cantidad'];
												echo '<td>'.number_format($monto,2,',','.').'</td>';
												echo '<td>'.$value2->divisa['abreviatura'].'</td>';
												echo '<td>'.number_format($value2->divisa->tasa['tasa'],2,',','.').'</td>';
												echo '<td>'.$value2->presupuestoPartida->partida['nombre'].'</td>';
												echo '<td>'.$value['nombre'].'</td>';
												//echo '<td>'.$value->unidad['nombre'].'</td>';
												//echo '<td>'.number_format($value['costo_unidad'],2,',','.').'</td>';

												echo '</tr>';

											}
										}
									}


									foreach ($acciones as $key => $value) {
										
										foreach ($value->presupuestoPartidas as $key => $value1) {
											foreach ($value1->presupuestoImportacion as $key => $value2) {
												echo '<tr>';
												echo '<td>'.$value2->producto['nombre'].'</td>';
												echo '<td>'.number_format($value2['monto_presupuesto'],2,',','.').'</td>';
												echo '<td>'.number_format($value2['cantidad'],2,',','.').'</td>';
												$monto = $value2['monto_presupuesto']*$value2['cantidad'];
												echo '<td>'.number_format($monto,2,',','.').'</td>';
												echo '<td>'.$value2->divisa['abreviatura'].'</td>';
												echo '<td>'.number_format($value2->divisa->tasa['tasa'],2,',','.').'</td>';
												echo '<td>'.$value2->presupuestoPartida->partida['nombre'].'</td>';
												echo '<td>'.$value->accion['nombre'].'</td>';
												//echo '<td>'.$value->unidad['nombre'].'</td>';
												//echo '<td>'.number_format($value['costo_unidad'],2,',','.').'</td>';

												echo '</tr>';

											}
										}
									}

								?>	
			    			</tbody>
			  </table>