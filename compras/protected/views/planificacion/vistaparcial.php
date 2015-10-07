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
		<?php foreach ($acciones as $key => $accion) { 
			 		$monto = $this->montoAccion($accion);

			 		$accionOrgano = PresupuestoPartidaAcciones::model()->findAllByAttributes(array('accion_id'=>$accion->accion_id, 'ente_organo_id'=>$this->usuario()->ente_organo_id, 'anho'=>Yii::app()->params['trimestresFechas'][Yii::app()->session['trimestreSeleccionado']]['anho']));

			 		//print_r($accionOrgano);
			 		//echo count($accionOrgano);
			 		//echo count($accionOrgano);
					$valor = 0;

					foreach ($accionOrgano as $key => $presupuestoPartidaAccion) 
						foreach ($presupuestoPartidaAccion->presupuestoPartidas as $key => $presupuestoPartida) 
							$valor += $this->montoCargadoPartida($presupuestoPartida);

		 ?>
		
		    	<tr class="principaltr">
		    		<td><?php echo $accion->codigo_accion; ?></td>
		    		<td><?php echo $accion->accion->nombre; ?></td>
		    		<td><?php echo number_format($monto,2,',','.'); ?></td>
		    		<td><?php echo number_format($valor,2,',','.'); ?></td>
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
						$monto = $this->montoProyecto($value);


					$valor = 0;

					foreach ($value->presupuestoPartidas as $key => $proyectomonto) {
						$valor += $this->montoCargadoPartida($proyectomonto);
					}

			?> 
		    	<tr class="principaltr">
		    		<td><?php echo $value->codigo; ?></td>
		    		<td><?php echo $value->nombre; ?></td>
		    		<td><?php echo number_format($monto,2,',','.'); ?></td>
		    		<td><?php echo number_format($valor,2,',','.'); ?></td>
		    		<td><strong><?php echo number_format($monto - $valor,2,',','.');?></strong></td>
		    	</tr>
		     <?php $mfinal += $monto;
				} ?>
		    </tbody>
		</table>