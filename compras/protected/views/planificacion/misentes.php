<style>
tr.principaltr td {
    /*border: 1px solid black;*/
    text-align:center; 
    vertical-align:middle;
}

tr.principaltr th {
    /*border: 1px solid black;*/
    text-align:center; 
    vertical-align:middle;
}
</style>

<h4 style="text-align: center;">ENTES HIJOS</h4><br>
		<table data-toggle="table" data-url="data1.json" data-cache="false" data-height="">
		    <thead>
		        <tr class="principaltr">
		            <th data-field="conapre">NOMBRE</th>
		            <th data-field="nombreoue">CODIGO ONAPRE</th>
		            <th data-field="nombreoue">RIF</th>
		        </tr>
		    </thead>
		    <tbody>
					
						<?php
							foreach ($model as $key => $value) {
						?>	
							<tr class="principaltr">
								<td><?php echo $value->enteOrgano->nombre?></td>
								<td><?php echo $value->enteOrgano->codigo_onapre?></td>
								<td><?php echo $value->enteOrgano->rif?></td>
							</tr>
						<?php
							}
						?>
					
		    </tbody>
		</table>