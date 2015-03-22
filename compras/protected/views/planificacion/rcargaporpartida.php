<h4 style="text-align: center;">REPORTE CARGA POR PARTIDAS</h4><br>


		<h4 style="text-align: center;">ACCIONES CENTRALIZADAS</h4><br>

		
			    	<?php

			    	//echo 'acciones';print_r($acciones);

			    		$tiene_acciones = false;
			    		foreach ($acciones as $key => $accion) 
			    		{
			    			$tiene_acciones = true;
							$monto = $this->montoAccion($accion);

			    		?>
			    		<table data-toggle="table" data-url="" data-cache="false" data-height="" width="100%">
					    <thead>
					        <tr class="principaltr">
					            <th data-field="conapre">Código</th>
					            <th data-field="nombreoue">Denominación</th>
					            <th data-field="tipo">Bs. Solicitados</th>
					            <th data-field="tipo"></th>
					            <th data-field="tipo"></th>
					            <th data-field="tipo"></th>
					        </tr>
					    	</thead>
						    <tbody>
				    		<tr>
					    		<td><?php echo $accion->codigo_accion; ?></td>
				    			<td><?php echo $accion->accion->nombre; ?></td>
				    			<?php
				    				$accionOrgano = PresupuestoPartidaAcciones::model()->findAllByAttributes(array('accion_id'=>$accion->accion_id, 'ente_organo_id'=>$this->usuario()->ente_organo_id));
									$valor = 0;
				    			?>
				    			<td><?php echo number_format($monto,2,',','.') ?></td>
				    			<td></td>
			    			</tr>
			    			<tr>
			    			
			    			<div>
							        <tr class="principaltr">
							            <th data-field="conapre">Nombre</th>
							            <th data-field="nombreoue">Número de partida</th>
							            <th data-field="tipo">Monto asignado</th>
							            <th data-field="tipo">Monto cargado</th>
							            <th data-field="tipo">% Carga</th>

							        </tr>
							    
							    	<?php

								    	$contador = 0;
			    						$porcentajePartida = 0;

							    		foreach ($accionOrgano as $key => $presupuestoPartidaAccion) 
											foreach ($presupuestoPartidaAccion->presupuestoPartidas as $key => $proyectomonto) 
									 		{
									 			$contador++;
			    								

									 			$valor += $this->montoCargadoPartida($proyectomonto);
							    			//echo '<tr><td>'.$presupuestoPartida['presupuesto_partida_id'].'<t/d></tr>';
								    			echo '<tr>';
												echo '<td>'.$proyectomonto->partida['nombre'].'</td>';
												echo '<td>'.$proyectomonto->partida['p1'].'.'.$proyectomonto->partida['p2'].'.'.$proyectomonto->partida['p3'].'.'.$proyectomonto->partida['p4'].'</td>';
												echo '<td>'.number_format($proyectomonto->monto_presupuestado,2,',','.').'</td>';
												echo '<td>'.number_format($valor,2,',','.').'</td>';
												$porcentajePartida += $valor*100/$proyectomonto->monto_presupuestado;
												echo '<td>'.number_format($valor*100/$proyectomonto->monto_presupuestado,2,',','.').'</td>';
												echo '</tr>';
							    			}
							    	?>
							</div>
			    			</tr>
			    			<tr>
			    			
		    					<td colspan="8" align="right" style="text-align:right !important">Porcentaje total de carga acción: <strong><?php echo number_format(($porcentajePartida/$contador),2,',','.').' %'; ?></strong></td>
		    				
		    				</tr>
				    	
	 			</tbody>
			</table>
			
			<?php
				   }

				if(!$tiene_acciones)
				{
					echo '<h4 style="text-align: center;">El ente no tiene acciones cargadas</h4><br>';
				}
			?>

			
			<h4 style="text-align: center;">PROYECTOS</h4><br>

			

			<?php 

			//echo 'proyectos'; print_r($proyectos);
				$tiene_proyecto = false;

			foreach ($proyectos as $key => $value){ 
				$tiene_proyecto = true;
						$monto = $this->montoProyecto($value);
					$valor = 0;
			?> 

			<table data-toggle="table" data-url="" data-cache="false" data-height="" width="100%">
		    <thead>
		        <tr class="principaltr">
		            <th data-field="conapre">Código</th>
		            <th data-field="nombreoue">Denominación</th>
		            <th data-field="tipo">Bs. Solicitados</th>
		            <th data-field="tipo"></th>
					<th data-field="tipo"></th>
					<th data-field="tipo"></th>

		        </tr>
		    </thead>
		    <tbody>

		    	<tr class="principaltr">
		    		<td><?php echo $value->codigo; ?></td>
		    		<td><?php echo $value->nombre; ?></td>
		    		<td><?php echo number_format($monto,2,',','.'); ?></td>
		    	</tr>
		    	<tr>
		    		<div>
				        <tr class="principaltr">
				            <th data-field="conapre">Nombre</th>
				            <th data-field="nombreoue">Número de partida</th>
				            <th data-field="tipo">Monto asignado</th>
				            <th data-field="tipo">Monto cargado</th>
				            <th data-field="tipo">% Carga</th>
				        </tr>

		    		<?php
		    			$contador = 0;
		    			$porcentajePartida = 0;
			    		foreach ($value->presupuestoPartidas as $key => $proyectomonto) {

			    				echo '<tr>';
									echo '<td>'.$proyectomonto->partida['nombre'].'</td>';
									echo '<td>'.$proyectomonto->partida['p1'].'.'.$proyectomonto->partida['p2'].'.'.$proyectomonto->partida['p3'].'.'.$proyectomonto->partida['p4'].'</td>';
									echo '<td>'.number_format($proyectomonto->monto_presupuestado,2,',','.').'</td>';
									$partida_dinero_nacional = 0;
									foreach ($proyectomonto->presupuestoProductos as $key => $value) {
											$partida_dinero_nacional += $value['monto_presupuesto'];
									}
									$partida_dinero_importado = 0;
									foreach ($proyectomonto->presupuestoImportacion as $key => $value) {
											$partida_dinero_importado += $value['monto_presupuesto']*$value['cantidad']*$value->divisa->tasa['tasa'];
											//echo $value['monto_presupuesto'];
									}
									$total_cargado = $partida_dinero_nacional + $partida_dinero_importado;
									$porcentaje = $total_cargado*100/$proyectomonto->monto_presupuestado;
									echo '<td>'.number_format($total_cargado,2,',','.').'</td>';
									echo '<td> '.number_format($porcentaje,2,',','.').'% </td>';
								echo '</tr>';
							$contador++;
							$porcentajePartida += $porcentaje;		
							//$valor += $this->montoCargadoPartida($proyectomonto);

							//print_r($value->presupuestoPartidas);
						}
						
		    		?>
					</div>
		    	</tr>
		    		<tr>
		    			<td colspan="8" align="right" style="text-align:right !important">Porcentaje total de carga proyecto: <strong><?php echo number_format(($porcentajePartida/$contador),2,',','.').' %'; ?></strong></td>
		    		</tr>
		     
		    </tbody>
		</table>
		<?php //$mfinal += $monto;
				}

				if(!$tiene_proyecto)
				{
					echo '<h4 style="text-align: center;">El ente no tiene proyectos cargados</h4><br>';
				}

			/// no tiene proyectos ?>