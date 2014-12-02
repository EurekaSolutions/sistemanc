<?php
/* @var $this PlanificacionController */

$this->breadcrumbs=array(
	'Planificacion'=>array('/planificacion'),
	'Vistaparcial',
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
		
		<h3 style="text-align: center;">ESTADO DE CARGA</h3><br>


		<h4 style="text-align: center;">ACCIONES CENTRALIZADAS</h4><br>

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
			 <?php   foreach ($acciones as $key => $value) { ?>
		
		    	<tr class="principaltr">
		    		<td><?php echo $value->codigo; ?></td>
		    		<td><?php echo $value->nombre; ?></td>
		    		<td><?php echo $value->monto; ?></td>
		    		<td><?php echo $valor = rand(0,$value->monto); ?></td>
		    		<td><strong><?php echo $value->monto - $valor;?></strong></td>
		    	</tr>

		    <?php $mfinal += $value->monto;
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

			<?php  foreach ($proyectos as $key => $value){ ?> 
		    	<tr class="principaltr">
		    		<td><?php echo $value->codigo; ?></td>
		    		<td><?php echo $value->nombre; ?></td>
		    		<td><?php echo $value->monto; ?></td>
		    		<td><?php echo $valor = rand(0,$value->monto); ?></td>
		    		<td><strong><?php echo $value->monto - $valor;?></strong></td>
		    	</tr>
		     <?php $mfinal += $value->monto;
				} ?>
		    </tbody>
		</table>