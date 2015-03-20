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

<h4 style="text-align: center;">REPORTES DE MIS ENTES</h4><br>

<h4 style="text-align: center;"></h4><br>


<table data-toggle="table" data-url="data1.json" data-cache="false" data-height="">
		    <thead>
		        <tr class="principaltr">
		            <th data-field="conapre">Código onapre</th>
		            <th data-field="nombreoue">Nombre</th>
		            <th data-field="tipo">Rif</th>
		            <th data-field="tipo">Carga por partidas</th>
		            <th data-field="tipo">Productos</th>
		        </tr>
		    </thead>
		    <tbody>
<?php
	//print_r($misentes);
	foreach ($misentes as $key => $value) {
		echo '<tr class="principaltr">';
			echo '<td>'.$value['codigo_onapre'].'</td>';
			echo '<td>'.$value['nombre'].'</td>';
			echo '<td>'.$value['rif'].'</td>';
			echo '<td><a href="">Descargar</a></td>';
			echo '<td><a href="">Descargar</a></td>';
		echo '</tr>';
	}

?>
</tbody>
</table>