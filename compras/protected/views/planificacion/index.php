<?php
/* @var $this PlanificacionController */

$this->breadcrumbs=array(
	'Planificacion',
);
?>
<h1><?php echo $this->id . '/' . $this->action->id; ?></h1>

<?php $this->widget("bootstrap.widgets.TbTabs", array(
    "id" => "tabs",
    "type" => "tabs",
    "tabs" => array(
        array("label" => "Books", "content" => "Some content", "active" => true),
        array("label" => "Authors", "content" => "Some content"),
    ),
 
)); ?>