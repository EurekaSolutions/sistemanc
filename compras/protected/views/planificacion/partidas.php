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
	

	$lista_acciones = CHtml::listData($usuario->enteOrgano->acciones, function($accion) {
																return CHtml::encode('a'.$accion->accion->accion_id);
															}, function($accion) {
																return CHtml::encode($accion->codigo_accion.' - '.$accion->accion->nombre);
															});
	$lista_proyectos = CHtml::listData($usuario->enteOrgano->proyectos, 'proyecto_id', function($proyecto) {
																return CHtml::encode($proyecto->codigo.' - '.$proyecto->nombre);
															},'Proyectos');
	 
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

	 	 echo $form->dropDownListGroup( $partidaSel, 'partida_id',
			array(
				'wrapperHtmlOptions' => array(
					'class' => 'col-sm-5',
				),
				'label'=>'Seleccione Partida para cargar sus productos',
				'widgetOptions' => array(

					'data' => CHtml::listData($partidas,'partida_id','nombre' ),
					//'options'=>array($model->proyecto_id => array('selected'=>true)),
					'htmlOptions' => array('multiple' => false, ),
				)
			)
		); 

		//echo $form->checkboxGroup($model, 'checkbox');
		$this->widget(
		    'booster.widgets.TbButton',
		    array('buttonType' => 'submit', 'label' => 'Seleccionar')
		);
	 
	$this->endWidget();
	unset($form);
?>

<?php 

	//print_r($partidas);
	/* @var TbActiveForm $form */
	/*$form = $this->beginWidget('booster.widgets.TbActiveForm',
	    array(
	        'id' => 'partida-form',
	        'htmlOptions' => array('class' => 'well'), // for inset effect
	    )
	);
	
	 echo $form->dropDownListGroup( $partidaSel, 'partida_id',
			array(
				'wrapperHtmlOptions' => array(
					'class' => 'col-sm-5',
				),
				'label'=>'Seleccione Partida para cargar sus productos',
				'widgetOptions' => array(

					'data' => CHtml::listData($partidas,'partida_id','nombre' ),
					//'options'=>array($model->proyecto_id => array('selected'=>true)),
					'htmlOptions' => array('multiple' => false, ),
				)
			)
		); 
         
		//echo $form->checkboxGroup($model, 'checkbox');
		$this->widget(
		    'booster.widgets.TbButton',
		    array('buttonType' => 'submit', 'label' => 'Seleccionar')
		);
	 
	$this->endWidget();
	unset($form);*/
?>


<?php
$tabs = array();

$partidas = array();
	/*if($proyectoSel)
		$partidas = $proyectoSel->presupuestoPartidas->partidas;
	elseif($accionSel)
		$partidas = $accionSel->presupuestoPartidaAcciones->presupuestoPartida->partidas;*/


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
}/*
print_r($pestanas['401']['items']);
$this->widget(
    'booster.widgets.TbTabs',
    array(
        'type' => 'pills', // 'tabs' or 'pills'
        'placement'=>'top',
        'justified'=>'true',
        'tabs' => $pestanas,
      )
);*/


?>