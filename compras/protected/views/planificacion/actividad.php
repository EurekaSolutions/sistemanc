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

<h4 style="text-align: center;">Actividades recientes</h4>
<h4 style="text-align: center;"> <?php if ($nombre) echo 'Ente: '.$nombre; ?></h4><br>

<?php

if($mensaje=="" and count($todos_log)!=0)
{
?>

<table data-toggle="table" data-url="data1.json" data-cache="false" data-height="">
		    <thead>
		        <tr class="principaltr">
		            <th data-field="conapre">Descripción</th>
		            <th data-field="nombreoue">Acción</th>
		            <th data-field="tipo">Campo</th>
		            <th data-field="tipo">Día</th>
		        </tr>
		    </thead>
		    <tbody>
<?php
	//print_r($misentes);
	foreach ($todos_log as $key => $value){
		$string = preg_replace(array('/\d/'), '',$value['descripcion'], -1);
					$string = explode('[]', $string);
		echo '<tr class="principaltr">';
			echo '<td>'.$string[0].'</td>';
			echo '<td>'.$value['accion'].'</td>';
			echo '<td>'.$value['field'].'</td>';
			echo '<td>'.substr($value['creationdate'], 0, 10).'</td>';
			echo '<td>';
			echo '</tr>';
	}
?>
</tbody>
</table>
<?php
	}else
	{
		echo '<h4 style="text-align: center;">'.$mensaje.'</h4><br>';
	}
?>