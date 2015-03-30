 <h4 style="text-align: center;">Eliminar partidas</h4>
 <?php

 	 $form = $this->beginWidget('booster.widgets.TbActiveForm',
                                    array(
                                        'id' => 'agregarcentralizada-form',
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


	 echo $form->dropDownListGroup( $proyectoSel,	'proyecto_id',
			array(
				'wrapperHtmlOptions' => array(
					'class' => 'col-sm-2',
				),
				'label'=>'Seleccione Acción Centralizada o Proyecto a cargar',
				'widgetOptions' => array(
					'data' => $listas,

					//'options'=>array($model->proyecto_id => array('selected'=>true)),
					'htmlOptions' => array(	'id'=>'proyecto', 'prompt' => 'Seleccionar proyecto', //'onChange'=>'submit','submit' => array('/planificacion/nacional','#'=>'proyecto')
					),
				),
				'hint' => 'Selecciona la Acción o Proyecto.'
			)
		); 

 	  $this->widget('booster.widgets.TbButton', array(
                            'buttonType'=>'submit',
                            'context'=>'primary',
                            'label'=>$proyectoSel->isNewRecord ? 'Eliminar Partida' : 'Eliminar Partida',
                        ));

 	    $this->endWidget();
                    unset($form);

 ?>
<div id="listaPartidasEliminar">
<?php
	if(!empty($proyectoSel->proyecto_id))
		$this->renderPartial('_eliminarpartida', array('presupuestoPartidas'=>$presupuestoPartidas));
?>
</div>