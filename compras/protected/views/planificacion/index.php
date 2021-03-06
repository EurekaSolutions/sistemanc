<?php
/* @var $this PlanificacionController */
//echo $this->montoAccionProyectoBsf('P',5570,3049);
//echo $this->montoAccionProyectoDivisa('A',5570,3049,'1900-01-01','2199-01-01');
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
<?php $mfinal = 0;
 if(isset($usuario->enteOrgano->padre))
 	$padre = $usuario->enteOrgano->padre->padre;
?>
<!--<h1><?php echo $this->id . '/' . $this->action->id; ?></h1>-->
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

		    		<td><?php echo $usuario->enteOrgano->codigo_onapre;?></td>
		    		<td><?php echo $usuario->enteOrgano->nombre;?></td>
		    		<td><?php echo $usuario->enteOrgano->tipo == 'E' ? 'ENTE' : 'ORGANO';?></td>
		    		<td><?php echo isset($padre)? $padre->nombre:'NO APLICA';?></td>
		    		<td><?php echo isset($padre)? $padre->codigo_onapre:'NO APLICA'; ?></td>
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
			 
			 <?php   foreach ($acciones as $key => $value) { 
			 				$monto = $this->montoAccion($value);?>
		
		    	<tr class="principaltr">
		    		<td><?php echo $value->codigo_accion; ?></td>
		    		<td><?php echo $value->accion->nombre; ?></td>
		    		<td><?php echo number_format($monto,2,',','.'); ?></td>
		    	</tr>

		    <?php $mfinal += $monto;
			} ?>
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

			<?php  foreach ($proyectos as $key => $value){
						$monto = $this->montoProyecto($value); 
			?> 
		    	<tr class="principaltr">
		    		<td><?php echo $value->codigo; ?></td>
		    		<td><?php echo $value->nombre; ?></td>
		    		<td><?php echo number_format($monto,2,',','.'); ?></td>
		    	</tr>
		     <?php $mfinal += $monto;
				} ?>
		    </tbody>
		</table>	

		<BR><BR>
				<p class="text-right"><STRONG>TOTAL COMPRAS</STRONG>: <?php echo number_format($mfinal,2,',','.'); ?> <STRONG>(Bs. F)</STRONG></p>
