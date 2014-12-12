<?php
/* @var $this PlanificacionController */

$this->breadcrumbs=array(
	'Planificacion'=>array('/planificacion'),
	'Estado de carga',
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
<?php $mfinal = 0; ?>
<!--<h1><?php echo $this->id . '/' . $this->action->id; ?></h1>-->
		
		<h4 style="text-align: center;">ESTADO DE CARGA</h4><br>


		<h3 style="text-align: center;">ACCIONES CENTRALIZADAS</h3><br>

		<table data-toggle="table" data-url="data1.json" data-cache="false" data-height="">
		    <thead>
		        <tr class="principaltr">
		            <th data-field="conapre">Código</th>
		            <th data-field="nombreoue">Denominación</th>
		            <th data-field="tipo">Bs. Solicitados</th>
		            <th data-field="tipo">Bs. Comprometidos</th>
		            <th data-field="tipo">Bs.Solicitados - Bs.Comprometidos</th>
		        </tr>
		    </thead>
		    <tbody>
			 <?php   foreach ($acciones as $key => $value) { 
			 				$monto = $this->montoAccion($value);
			 ?>
		
		    	<tr class="principaltr">
		    		<td><?php echo $value->codigo_accion; ?></td>
		    		<td><?php echo $value->accion->nombre; ?></td>
		    		<td><?php echo number_format($monto,2,',','.'); ?></td>
		    		<td><?php echo number_format($valor = rand(0,0),2,',','.'); ?></td>
		    		<td><strong><?php echo number_format($monto - $valor,2,',','.');?></strong></td>
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
		            <th data-field="tipo">Bs. Solicitados</th>
		            <th data-field="tipo">Bs. Comprometidos</th>
		            <th data-field="tipo">Bs.Solicitados - Bs.Comprometidos</th>
		        </tr>
		    </thead>
		    <tbody>

			<?php  foreach ($proyectos as $key => $value){ 
						$monto = $this->montoProyecto($value);?> 
		    	<tr class="principaltr">
		    		<td><?php echo $value->codigo; ?></td>
		    		<td><?php echo $value->nombre; ?></td>
		    		<td><?php echo number_format($monto,2,',','.'); ?></td>
		    		<td><?php echo number_format($valor = rand(0,0),2,',','.'); ?></td>
		    		<td><strong><?php echo number_format($monto - $valor,2,',','.');?></strong></td>
		    	</tr>
		     <?php $mfinal += $monto;
				} ?>
		    </tbody>
		</table>