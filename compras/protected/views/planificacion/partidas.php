<?php
/* @var $this PlanificacionController */

$this->breadcrumbs=array(
	'Planificacion'=>array('/planificacion'),
	'Partidas',
);
?>


<?php 

	
	/** @var TbActiveForm $form */
	$form = $this->beginWidget('booster.widgets.TbActiveForm',
	    array(
	        'id' => 'proyecto-form',
	        'htmlOptions' => array('class' => 'well'), // for inset effect
	    )
	);
	

	$lista_acciones = CHtml::listData($usuario->codigoOnapre->acciones, 'proyecto_id', 'nombre');
	$lista_proyectos = CHtml::listData($usuario->codigoOnapre->proyectos, 'proyecto_id', 'nombre');
	 
	$listas = array(!empty($lista_acciones)?'Acciones Centralizadas':null=>$lista_acciones,
	 				!empty($lista_proyectos)?'Proyectos':null =>$lista_proyectos);

	//echo $form->listBoxGroup($model, 'nombre',$proyectos);
	//echo $form->dropDownListGroup($model, 'nombre',$proyectos, array('prompt'=>'Seleccionar proyecto','multiple' => 'multiple'));
	//echo $form->dropDownList($model,'category_id',  array('prompt'=>'Select category','multiple' => 'multiple'));

	 echo $form->dropDownListGroup( $proyectoSel,	'proyecto_id',
			array(
				'wrapperHtmlOptions' => array(
					'class' => 'col-sm-2',
				),
				'label'=>'Seleccione Proyecto o Acción Centralizada a cargar',
				'widgetOptions' => array(

					'data' => $listas,
					//'options'=>array($model->proyecto_id => array('selected'=>true)),
					'htmlOptions' => array(/*'prompt' => 'Seleccionar proyecto',*/'multiple' => false, ),
				)
			)
		); 
         
		//echo $form->checkboxGroup($model, 'checkbox');
		$this->widget(
		    'booster.widgets.TbButton',
		    array('buttonType' => 'submit', 'label' => 'Cargar')
		);
	 
	$this->endWidget();
	unset($form);
?>

<?php 

	
	/** @var TbActiveForm $form */
	$form = $this->beginWidget('booster.widgets.TbActiveForm',
	    array(
	        'id' => 'proyecto-form',
	        'htmlOptions' => array('class' => 'well'), // for inset effect
	    )
	);
	
	 echo $form->dropDownListGroup( $partida,	'proyecto_id',
			array(
				'wrapperHtmlOptions' => array(
					'class' => 'col-sm-5',
				),
				'label'=>'Seleccione Proyecto o Acción Centralizada a cargar',
				'widgetOptions' => array(

					'data' => $listas,
					//'options'=>array($model->proyecto_id => array('selected'=>true)),
					'htmlOptions' => array(/*'prompt' => 'Seleccionar proyecto',*/'multiple' => false, ),
				)
			)
		); 
         
		//echo $form->checkboxGroup($model, 'checkbox');
		$this->widget(
		    'booster.widgets.TbButton',
		    array('buttonType' => 'submit', 'label' => 'Cargar')
		);
	 
	$this->endWidget();
	unset($form);
?>


<?php
$tabs = array();
echo $partidas;
$partidas = ProyectoPartidas::model()->findAllByAttributes(array('proyecto_id'=>$proyectoSel->proyecto_id));
$pestanas = array();
foreach ($partidas as $key => $partida) {

			$partida = $partida->partida;

			$numPartida = $this->numeroPartida($partida);
			//echo 'ENTRE ';
			//$pestanas[$numPartida] = array('label' => $this->numeroPartida($partida).' - '.$partida->nombre, 'content' => 'Partida '.$numPartida);
			//$pestanas[$partida->p1][$partida->p2][$partida->p3][$partida->p4] = array('label' => $this->numeroPartida($partida).' - '.$partida->nombre, 'content' => 'Partida '.$numPartida);

				if(!isset($pestanas[$partida->p1]))
					$pestanas[$partida->p1] =  array('label' => $partida->p1.' - ', 'content' => 'Partida '.$partida->nombre, 'items' => array( ));
				
				if(!isset($pestanas[$partida->p1]['items'][$partida->p2]))
					$pestanas[$partida->p1]['items'][$partida->p2] = array('label' => $this->numeroPartida($partida).' - ', 'content' => 'Carga de partidas especificas y sub especificas de la partida 402.01');

				/*if($this->nivelPartida($partida) == 4)
				{
					$nivel4 = array('label' => $this->numeroPartida($partida), 'content' => 'Carga de partidas especificas y sub especificas de la partida 403.07.XX.XX');
				}*/

				/*if(!isset($pestanas[$partida->p1]['items'][$partida->p2]['items'][$partida->p3]))
						$pestanas[$partida->p1]['items'][$partida->p2]['content'] = array('label' => $this->numeroPartida($partida), 
						'content' => $this->widget(
													    'booster.widgets.TbTabs',
													    array(
													        'type' => 'tabs', // 'tabs' or 'pills'
													        'placement'=>'top',
													        'tabs' =>array())
									);
						);*/
						
			switch ($this->nivelPartida($partida)) {
				case 1:
					# code...
					break;
				case 2:
					# code...
					break;
				case 3:
					# code...
					break;
				case 4:
					# code...
					break;
				default:
					# code...
					break;
			}

			if($partida->p2==0) //Partida
			{	

				//$pestanas[$partida->p1]['items'][] = array('label' => $this->numeroPartida($partida).' - '.$partida->nombre, 'content' => 'Partida '.$numPartida);
				//$partidass.= '<h2>Partida '.$numPartida.': '.$partida->nombre.'</h2>';
				//$this->productosPartidas($partida);

			}elseif($partida->p3==0) //General
			{

				//$pestanas[$partida->p1]['items'][$partida->p2] = array('label' => $this->numeroPartida($partida), 'content' => 'Carga de partidas especificas y sub especificas de la partida 402.01');
				//$partidass.= '<h3>General '.$numPartida.': '.$partida->nombre.'</h3>';
				//$this->productosPartidas($partida);

			}elseif($partida->p4==0)//Especifica
			{
				//$partidass .= '<h4>Específica '.$numPartida.': '.$partida->nombre.'id: '.$partida->partida_id.'</h4>';
				//$partidass .= $this->productosPartidas($partida);

			}else//Sub Especifica
			{	
				//$partidass .= '<h5>Sub-Específica '.$numPartida.': <b>'.$partida->nombre.' </b></h5>';
				//$partidass .= $this->productosPartidas($partida);
			}
	          /*$taiarray('label' => '402', 'content' => 'Partida 402')l = array('label' => '401','content' => 'Partida 401', 'active' => empty($tabs) ? true : false, 'items' => array(
	                    array('label' => '401.06', 'content'=>$this->widget(
									    'booster.widgets.TbTabs',
									    array(
									        'type' => 'tabs', // 'tabs' or 'pills'
									        'placement'=>'top',
									        'tabs' => array(
									            array('label' => '401.06.02', 'content' => 'Lista de Partidas sub especificas 401.35.04', 'active' => true, ),
									            array('label' => '401.35.04', 'content' => 'Lista de Partidas sub especificas 401.35.04',),
									            array('label' => '401.35.04', 'content' => 'Lista de Partidas sub especificas 401.35.04',),
									            array('label' => '401.35.04', 'content' => 'Lista de Partidas sub especificas 401.35.04', ),
									        ),
									    ),true),
									     'view'=>'_especificos'),
	                    array('label' => '401.35', 'content' => 'Carga de partidas especificas y sub especificas de la partida 401.35')),
	            ),
	            array('label' => '402', 'content' => 'Partida 402', 'items' => array(
	                    array('label' => '402.01', 'content' => 'Carga de partidas especificas y sub especificas de la partida 402.01'),
	                    array('label' => '402.04', 'content' => 'Carga de partidas especificas y sub especificas de la partida 402.04')),
	            )*/

	         
	        
	//$tabs=array_merge($tabs,)
}
print_r($pestanas['401']['items']);
$this->widget(
    'booster.widgets.TbTabs',
    array(
        'type' => 'pills', // 'tabs' or 'pills'
        'placement'=>'top',
        'justified'=>'true',
        'tabs' => $pestanas,
      )
);

$this->widget(
    'booster.widgets.TbTabs',
    array(
        'type' => 'pills', // 'tabs' or 'pills'
        'placement'=>'top',
        'justified'=>'true',
        'tabs' => array(
				            array('label' => '401','content' => 'Partida 401', 'active' => true, 'items' => array(
				                    array('label' => '401.06', 'content'=>$this->widget(
												    'booster.widgets.TbTabs',
												    array(
												        'type' => 'tabs', // 'tabs' or 'pills'
												        'placement'=>'top',
												        'tabs' => array(
												            array('label' => '401.06.02', 'content' => '<table data-toggle="table" data-url="data1.json" data-cache="false" data-height="">
																	    <thead>
																	        <tr class="principaltr">
																	        	 <th data-field="nombreoue">Denominación</th>
																	            <th data-field="nombreoue">Código</th>
																	            <th data-field="tipo">Costo unidad</th>
																	            <th data-field="conaprepadre">Cantidad</th>
																	            <th data-field="oadscripcion">Unidad de medida</th>
																	            <th data-field="conaprepadre">Bs.</th>
																	            <th data-field="conaprepadre">Total Bs.</th>
																	        </tr>
																	    </thead>
																	    <tbody>
																	    	<tr class="principaltr">

																	    		<td> 
																	    			Verduras frescas	
																				</td>


																				<td> 	
																					27112703	
																				</td>

																	    		<td>
																	    			 <div class="form-group">
																				    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Costo unidad">
																				  	</div>
																	    		</td>

																	    		<td>
																	    			<div class="form-group">
																				    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Cantidad">
																				  	</div>
																	    		</td>

																	    		<td>
																	    			<div class="form-group">
																				    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Unidad de medida">
																				  	</div>
																	    		</td>
																	    		<td><div class="form-group">
																				    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Bs">
																				  	</div></td>
																	    	</tr>

																	    	<tr class="principaltr">

																	    		<td> 
																	    			Harina verdura	
																				</td>


																				<td> 27112703
																				</td>

																	    		<td>
																	    			 <div class="form-group">
																				    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Costo unidad">
																				  	</div>
																	    		</td>

																	    		<td>
																	    			<div class="form-group">
																				    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Cantidad">
																				  	</div>
																	    		</td>

																	    		<td>
																	    			<div class="form-group">
																				    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Unidad de medida">
																				  	</div>
																	    		</td>
																	    		<td><div class="form-group">
																				    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Bs">
																				  	</div></td>
																	    	</tr>
																	    </tbody>
																	</table>', 'active' => true, ),
																							            array('label' => '401.06.06', 'content' => ' <div style="max-width:300px">
															 <div class="form-group">
																<select class="form-control">
																  <option value="">Código NCM</option>
																  <option value="corpovex">3815.19.00.90</option>
																</select>
															</div>

															 <div class="form-group">
																<input type="email" class="form-control" id="exampleInputEmail1" placeholder="cantidad">
															</div>

															 <div class="form-group">
																<input type="email" class="form-control" id="exampleInputEmail1" placeholder="monto">
															</div>

															<div class="form-group">
																<input type="email" class="form-control" id="exampleInputEmail1" placeholder="Fecha">
															</div>


															<div class="form-group">
																<select class="form-control">
																  <option value="">Tipo</option>
																  <option value="corpovex">Corpovex</option>
																  <option>Licitación internacion</option>
																</select>
															</div>

															<div class="form-group">
																<select class="form-control">
																  <option value="">Divisa</option>
																  <option value="corpovex">Dolar</option>
																  <option>Euro</option>
																</select>
															</div>
															</div>',),
												            array('label' => '401.06.28', 'content' => 'Lista de Partidas sub especificas 401.35.04',),
												            array('label' => '401.06.39', 'content' => 'Lista de Partidas sub especificas 401.35.04', ),
												        ),
												    ),true),
												     'view'=>'_especificos'),
				                    array('label' => '401.35', 'content' => 'Carga de partidas especificas y sub especificas de la partida 401.35')),
				            ),
				            array('label' => '402', 'content' => 'Partida 402', 'items' => array('01'=>
				                    array('label' => '402.01', 'content' => 'Carga de partidas especificas y sub especificas de la partida 402.01'),
				                    '04'=>array('label' => '402.04', 'content' => 'Carga de partidas especificas y sub especificas de la partida 402.04')),
				            ),
				            array('label' => '403', 'content' => 'Partida 403', 'items' => array(
				                    array('label' => '403.07', 'content' => 'Carga de partidas especificas y sub especificas de la partida 403.07'),
				                    array('label' => '403.51', 'content' => 'Carga de partidas especificas y sub especificas de la partida 403.51')),
				            ),
				            array('label' => '404', 'content' => 'Partida 404', 'items' => array(
				                    array('label' => '404.09', 'content' => 'Carga de partidas especificas y sub especificas de la partida 404.09'),
				                    array('label' => '404.15', 'content' => 'Carga de partidas especificas y sub especificas de la partida 404.15')),
				            ),
        				),
    )
);

?>