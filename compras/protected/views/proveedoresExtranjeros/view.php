<?php
$this->breadcrumbs=array(
		'Proveedores Extranjeroses'=>array('index'),
		$model->proveedor->razon_social,
	);

$this->menu=array(
	array('label'=>'List ProveedoresExtranjeros','url'=>array('index')),
	array('label'=>'Create ProveedoresExtranjeros','url'=>array('create')),
	array('label'=>'Update ProveedoresExtranjeros','url'=>array('update','id'=>$model->id)),
	array('label'=>'Delete ProveedoresExtranjeros','url'=>'#','linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage ProveedoresExtranjeros','url'=>array('admin')),
	);
?>

<h3>Ver Proveedores Extranjeros <strong> <?php echo $model->proveedor->razon_social ?></strong></h3>
<h3>INFORMACIÓN BASICA DE LA EMPRESA</h3>
<?php 
	$this->widget('booster.widgets.TbDetailView',array(
	'data'=>$model,
	'attributes'=>array(
		'num_identificacion',
		array(
                   'label'=>'pais',
                   'name' => 'pais_id',
                   //'type'=>'html',   // here's a parameter that disable HTML escaping by Yii 
                   'value'=>$model->pais->nombre
                 ),
		'codigo_postal',
		'calle',
		'distrito',
		'poblacion',
		'tlf_fijo',
		'pagina_web',
),
)); 

?>

<h3>INFORMACIÓN DE CONTACTO</h3>
<?php


$this->widget('booster.widgets.TbDetailView',array(
	'data'=> $modelContacto,
	'attributes'=>array(
		//'id',
		'nombre',
		'documento_identidad',
		'tlf_fijo',
		'tlf_movil',
		'fax_telefax',
		'correo_electronico',
),
)); 

?>


<h3>INFORMACIÓN FINANCIERA</h3>
<table id="yw50" class="detail-view table table-striped table-condensed">
	<tbody>
	<?php
		if(!empty($modelCuentas))
		foreach ($modelCuentas as $key => $value) {
			# code...
	?>	
		<tr class="even">
			<th>Código swift</th>
			<td><?php echo $value->codigo_swift;?></td>
			<th>Número de cuenta</th>
			<td><?php echo $value->num_cuenta_bancaria;?></td>
		</tr>
	<?php
		}
	?>
	</tbody>
</table>

<h3>INFORMACIÓN DE TÉCNICA</h3>

<table id="yw51" class="detail-view table table-striped table-condensed">
	<tbody>
	<?php
		if(!empty($modelTecnica))
		foreach ($modelTecnica as $key => $value) {
	?>	
		<tr class="even">
			<th>Rama</th>
			<td><?php echo $value->rama;?></td>
			<th>Producto</th>
			<td><?php echo $value->rama_producto_id;?></td>
			<th>Descripción</th>
			<td><?php echo $value->descripcion;?></td>
		</tr>
	<?php
		}
	?>
	</tbody>
</table>