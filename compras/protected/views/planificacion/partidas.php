<?php
/* @var $this PlanificacionController */

$this->breadcrumbs=array(
	'Planificacion'=>array('/planificacion'),
	'Partidas',
);
?>


<?php 
$model = new ProyectosAcciones();

	/** @var TbActiveForm $form */
	$form = $this->beginWidget(
	    'booster.widgets.TbActiveForm',
	    array(
	        'id' => 'proyecto-form',
	        'htmlOptions' => array('class' => 'well'), // for inset effect
	    )
	);

	 $proyectos = CHtml::listData($usuario->codigoOnapre->proyectosAcciones, 'proyecto_id', 'nombre');
	//echo $form->listBoxGroup($model, 'nombre',$proyectos);
	//echo $form->dropDownListGroup($model, 'nombre',$proyectos, array('prompt'=>'Seleccionar proyecto','multiple' => 'multiple'));
	//echo $form->dropDownList($model,'category_id',  array('prompt'=>'Select category','multiple' => 'multiple'));

	 echo $form->dropDownListGroup(
			$model,
			'proyecto_id',
			array(
				'wrapperHtmlOptions' => array(
					'class' => 'col-sm-5',
				),
				'widgetOptions' => array(
					'data' => $proyectos,
					'htmlOptions' => array(/*'prompt' => 'Seleccionar proyecto',*/'multiple' => false),
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
								            array('label' => '401.06.02', 'content' => 'Lista de Partidas sub especificas 401.35.04', 'active' => true, ),
								            array('label' => '401.35.04', 'content' => 'Lista de Partidas sub especificas 401.35.04',),
								            array('label' => '401.35.04', 'content' => 'Lista de Partidas sub especificas 401.35.04',),
								            array('label' => '401.35.04', 'content' => 'Lista de Partidas sub especificas 401.35.04', ),
								        ),
								    ),true
								), 'view'=>'_especificos'),
                    array('label' => '401.35', 'content' => 'Carga de partidas especificas y sub especificas de la partida 401.35')),
            ),
            array('label' => '402', 'content' => 'Partida 402', 'items' => array(
                    array('label' => '402.01', 'content' => 'Carga de partidas especificas y sub especificas de la partida 402.01'),
                    array('label' => '402.04', 'content' => 'Carga de partidas especificas y sub especificas de la partida 402.04')),
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