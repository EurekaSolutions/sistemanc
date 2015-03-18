<h4 style="text-align: center;">REPORTE PRODUCTOS CARGADOS</h4><br>


		<h4 style="text-align: center;">NACIONALES</h4><br>

<table data-toggle="table" data-url="" data-cache="false" data-height="" width="100%">
					    <thead>
					        <tr class="principaltr">
					            <th data-field="conapre">Producto</th>
					            <th data-field="nombreoue">Unidad</th>
					            <th data-field="tipo">Costo unitario</th>
					            <th data-field="tipo">Cantidad</th>
					            <th data-field="tipo">Monto</th>
					            <th data-field="tipo">Partida</th>
					        </tr>
					    	</thead>
						    <tbody>
				    		
					    		<?php
									foreach ($proyectos as $key => $value) {
										
										foreach ($value->presupuestoPartidas as $key => $value) {
											foreach ($value->presupuestoProductos as $key => $value) {
												echo '<tr>';
												echo '<td>'.$value->producto['nombre'].'</td>';
												echo '<td>'.$value->unidad['nombre'].'</td>';
												echo '<td>'.number_format($value['costo_unidad'],2,',','.').'</td>';
												echo '<td>'.number_format($value['cantidad'],2,',','.').'</td>';
												echo '<td>'.number_format($value['monto_presupuesto'],2,',','.').'</td>';
												echo '<td>'.$value->proyectoPartida->partida['nombre'].'</td>';
												
												echo '</tr>';
											}
										}
									}
								?>	

								<?php
									foreach ($acciones as $key => $value) {
										
										foreach ($value->presupuestoPartidas as $key => $value) {
											foreach ($value->presupuestoProductos as $key => $value) {
												echo '<tr>';
												echo '<td>'.$value->producto['nombre'].'</td>';
												echo '<td>'.$value->unidad['nombre'].'</td>';
												echo '<td>'.number_format($value['costo_unidad'],2,',','.').'</td>';
												echo '<td>'.number_format($value['cantidad'],2,',','.').'</td>';
												echo '<td>'.number_format($value['monto_presupuesto'],2,',','.').'</td>';
												echo '<td>'.$value->proyectoPartida->partida['nombre'].'</td>';
												
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
					        </tr>
					    	</thead>
						    <tbody>
				    		<?php

									foreach ($proyectos as $key => $value) {
										
										foreach ($value->presupuestoPartidas as $key => $value) {
											foreach ($value->presupuestoImportacion as $key => $value) {
												echo '<tr>';
												echo '<td>'.$value->producto['nombre'].'</td>';
												echo '<td>'.number_format($value['monto_presupuesto'],2,',','.').'</td>';
												echo '<td>'.number_format($value['cantidad'],2,',','.').'</td>';
												$monto = $value['monto_presupuesto']*$value['cantidad'];
												echo '<td>'.number_format($monto,2,',','.').'</td>';
												echo '<td>'.$value->divisa['abreviatura'].'</td>';
												echo '<td>'.number_format($value->divisa->tasa['tasa'],2,',','.').'</td>';
												echo '<td>'.$value->presupuestoPartida->partida['nombre'].'</td>';
												//echo '<td>'.$value->unidad['nombre'].'</td>';
												//echo '<td>'.number_format($value['costo_unidad'],2,',','.').'</td>';

												echo '</tr>';

											}
										}
									}


									foreach ($acciones as $key => $value) {
										
										foreach ($value->presupuestoPartidas as $key => $value) {
											foreach ($value->presupuestoImportacion as $key => $value) {
												echo '<tr>';
												echo '<td>'.$value->producto['nombre'].'</td>';
												echo '<td>'.number_format($value['monto_presupuesto'],2,',','.').'</td>';
												echo '<td>'.number_format($value['cantidad'],2,',','.').'</td>';
												$monto = $value['monto_presupuesto']*$value['cantidad'];
												echo '<td>'.number_format($monto,2,',','.').'</td>';
												echo '<td>'.$value->divisa['abreviatura'].'</td>';
												echo '<td>'.number_format($value->divisa->tasa['tasa'],2,',','.').'</td>';
												echo '<td>'.$value->presupuestoPartida->partida['nombre'].'</td>';
												//echo '<td>'.$value->unidad['nombre'].'</td>';
												//echo '<td>'.number_format($value['costo_unidad'],2,',','.').'</td>';

												echo '</tr>';

											}
										}
									}

								?>	
			    			</tbody>
			  </table>