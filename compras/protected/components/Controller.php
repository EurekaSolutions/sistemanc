<?php
/**
 * Controller is the customized base controller class.
 * All controller classes for this application should extend from this base class.
 */
class Controller extends CController
{
	/**
	 * @var string the default layout for the controller view. Defaults to '//layouts/column1',
	 * meaning using a single column layout. See 'protected/views/layouts/column1.php'.
	 */
	public $layout='//layouts/column1';
	/**
	 * @var array context menu items. This property will be assigned to {@link CMenu::items}.
	 */
	public $menu=array();
	/**
	 * @var array the breadcrumbs of the current page. The value of this property will
	 * be assigned to {@link CBreadcrumbs::links}. Please refer to {@link CBreadcrumbs::links}
	 * for more details on how to specify this property.
	 */
	public $breadcrumbs=array();

	public function beforeAction($action){
		
		$fechaActual = new DateTime();

		$fechaActFor = $fechaActual->format("Y-m-d");



		foreach (Yii::app()->params['trimestresFechas'] as $key => $value) {
		 	if($fechaActFor >= $value['c'] && $fechaActFor <= $value['f']) 
		 	{
				$trimestres[$key] = Yii::app()->params['etiquetasTrimestres'][$key].' '.$value['anho'];
/*				if(!isset(Yii::app()->session['trimestreSeleccionado']))
				 	Yii::app()->session['trimestreSeleccionado'] = $key;
				 elseif(!array_key_exists(Yii::app()->session['trimestreSeleccionado'],$trimestres))*/
			}
		}

		if(!array_key_exists(Yii::app()->session['trimestreSeleccionado'],$trimestres))
			Yii::app()->session['trimestreSeleccionado'] = current(array_keys($trimestres));

		 Yii::app()->session['trimestresDisponibles'] = $trimestres;	


		return parent::beforeAction($action);
	}

	public function M_compras()
	{
		
		return Usuarios::model()->findByPk(Yii::app()->user->getId())->enteOrgano->compra;
	}

	public function M_rendicion()
	{
		return Usuarios::model()->findByPk(Yii::app()->user->getId())->enteOrgano->rendicion;
	}
}