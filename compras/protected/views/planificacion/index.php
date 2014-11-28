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
	<h3 style="text-align: center;">PLAN DE COMPRAS DEL ESTADO <span class="label label-default"><?php echo intval(date("Y")+1);?></span></h3>
		<br>
	    <div class="row show-grid">
		 <table data-toggle="table" data-url="data1.json" data-cache="false" data-height="299">
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
		    		<td>A0908</td>
		    		<td>SERVICIO NACIONAL DE CONTRATACIONES</td>
		    		<td>ENTE</td>
		    		<td>Vicepresidencia de la República</td>
		    		<td>33</td>
		    	</tr>
		    </tbody>
		</table>
	</div>