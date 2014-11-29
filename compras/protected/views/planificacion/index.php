<?php
/* @var $this PlanificacionController */

$this->breadcrumbs=array(
	'Planificacion',
);
?>
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
<!--<h1><?php echo $this->id . '/' . $this->action->id; ?></h1>-->
<?php
	//echo print_r($proyectos);


	foreach ($proyectos as $key => $value) {
		# code...
		echo $value->tipo;


	}


	foreach ($acciones as $key => $value) {
		# code...
		echo $value->tipo;


	}
?>
		
		<table data-toggle="table" data-url="data1.json" data-cache="false" data-height="">
		    <thead>
		        <tr class="principaltr">
		            <th data-field="conapre">Mi código Onapre</th>
		            <th data-field="nombreoue">Nombre Organo u Ente</th>
		            <th data-field="tipo">Tipo</th>
		            <th data-field="oadscripcion">Órgano de adscripción</th>
		            <th data-field="conaprepadre">Código Onapre</th>
		        </tr>
		    </thead>
		    <tbody>
		    	<tr class="principaltr">

		    		<td><?php echo $usuario->codigo_onapre;?></td>
		    		<td><?php echo $usuario->codigoOnapre->nombre;?></td>
		    		<td><?php echo $usuario->codigoOnapre->tipo;?></td>
		    		<td><?php echo $usuario->codigoOnapre->enteAdscrito->padre->nombre;?></td>
		    		<td><?php echo $usuario->codigoOnapre->enteAdscrito->padre->codigo_onapre; ?></td>
		    	</tr>
		    </tbody>
		</table>
	
		
		<h4 style="text-align: center;">ACCIONES CENTRALIZADAS</h4><br>

		<table data-toggle="table" data-url="data1.json" data-cache="false" data-height="">
		    <thead>
		        <tr class="principaltr">
		            <th data-field="conapre">Código</th>
		            <th data-field="nombreoue">Denominación</th>
		            <th data-field="tipo">Bs.</th>
		        </tr>
		    </thead>
		    <tbody>
		    	<tr class="principaltr">
		    		<td>xx0001000</td>
		    		<td>Dirección y coordinación de los gastos de los trabajadores y trabajadoras</td>
		    		<td>0.00</td>
		    	</tr>
		    	<tr class="principaltr">
		    		<td>xx0001000</td>
		    		<td>Dirección y coordinación de los gastos de los trabajadores y trabajadoras</td>
		    		<td>0.00</td>
		    	</tr>
		    	<tr class="principaltr">
		    		<td>xx0001000</td>
		    		<td>Dirección y coordinación de los gastos de los trabajadores y trabajadoras</td>
		    		<td>0.00</td>
		    	</tr>
		    </tbody>
		</table>	


		<h4 style="text-align: center;">PROYECTOS</h4><br>

		<table data-toggle="table" data-url="data1.json" data-cache="false" data-height="">
		    <thead>
		        <tr class="principaltr">
		            <th data-field="conapre">Código</th>
		            <th data-field="nombreoue">Denominación</th>
		            <th data-field="tipo">Bs.</th>
		        </tr>
		    </thead>
		    <tbody>
		    	<tr class="principaltr">
		    		<td>xx0001000</td>
		    		<td>Dirección y coordinación de los gastos de los trabajadores y trabajadoras</td>
		    		<td>0.00</td>
		    	</tr>
		    	<tr class="principaltr">
		    		<td>xx0001000</td>
		    		<td>Dirección y coordinación de los gastos de los trabajadores y trabajadoras</td>
		    		<td>0.00</td>
		    	</tr>
		    	<tr class="principaltr">
		    		<td>xx0001000</td>
		    		<td>Dirección y coordinación de los gastos de los trabajadores y trabajadoras</td>
		    		<td>0.00</td>
		    	</tr>
		    </tbody>
		</table>	

		<BR><BR>
				<p class="text-right"><STRONG>TOTAL COMPRAS</STRONG>: 213213213213213123213 <STRONG>(Bs.)</STRONG></p>
