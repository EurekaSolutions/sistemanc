<?php
/* @var $this PlanificacionController */

$this->breadcrumbs=array(
	'Planificacion'=>array('/planificacion'),
	'Partidas',
);
?>
<h1><?php echo $this->id . '/' . $this->action->id; ?></h1>

<?php
$tabs = array();
$this->widget(
    'booster.widgets.TbTabs',
    array(
        'type' => 'pills', // 'tabs' or 'pills'
        'placement'=>'top',
        'tabs' => array(
            array('label' => '401','content' => 'Partida 401', 'active' => true, 'items' => array(
                    array('label' => '401.06', 'content' => 'Carga de partidas especificas y sub especificas de la partida 401.06'),
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