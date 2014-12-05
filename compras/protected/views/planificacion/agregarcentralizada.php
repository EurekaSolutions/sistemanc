		<h4 style="text-align: center;">AGREGAR ACCIONES CENTRALIZADAS</h4><br>
		<table data-toggle="table" data-url="data1.json" data-cache="false" data-height="">
		    <thead>
		        <tr class="principaltr">
		            <th data-field="conapre" colspan="2">Acciones</th>

		        </tr>
		    </thead>
		    <tbody>
		    	<tr class="principaltr">
		    	<table>
		    		<td>	
		    			<?php
		    				foreach ($acciones as $key => $value) {
		    			?>
		    			<div class="radio">
  						   <label>
		    				<input type="radio" name="accioneslist" id="accioneslist" value="<?php echo $value->accion_id; ?>">
		    				<?php
		    					echo $value->nombre;
		    				?>

		    				</label>
		    			</div>

		    			<?php
		    				}
		    			?>

		    		</td>
		    	 </table>	
		    	</tr>
		    </tbody>
		</table>