<?php

class ReportesRendicionController extends Controller
{
	
	//public $layout='//layouts/column2';

		/**
		* @return array action filters
		*/
	public function filters()
	{
		return array(
		'accessControl', // perform access control for CRUD operations
		);
	}

	/**
	* Specifies the access control rules.
	* This method is used by the 'accessControl' filter.
	* @return array access control rules
	*/
	public function accessRules()
	{
		return array(
			array('allow',  // allow all users to perform 'index' and 'view' actions
				'actions'=>array('index'),
				'users'=>array('@'),
				'roles'=>array('producto'),
			),
			array('deny',  // deny all users
				'users'=>array('*'),
			),
		);
	}



	public function actionIndex()
	{
		$usuario = Usuarios::model()->findByPk(Yii::app()->user->getId());

		$proyectos = $usuario->enteOrgano->proyectos;

		//$acciones = $usuario->enteOrgano->acciones;

		$criteria = new CDbCriteria();
		$criteria->distinct=true;
		$criteria->condition = "ente_organo_id=".$usuario->ente_organo_id ;      
		$criteria->select = 'codigo_accion, accion_id, ente_organo_id ';
		$acciones=PresupuestoPartidaAcciones::model()->findAll($criteria);

        $nombre = "";
		$this->render('index', array('proyectos' => $proyectos, 'acciones' => $acciones, 'nombre' => $nombre));
	}


	public function usuario(){
		return Usuarios::model()->findByPk(Yii::app()->user->getId());
	}


	public function montoCargadoPartida(PresupuestoPartidas $presuPartida){
			// Validando la suma de los productos de la partida
 		$total = 0;
 		//Nacionales
			if($presuPartida->presupuestoProductos)
				foreach ($presuPartida->presupuestoProductos as $key => $presupuestoProducto) {
					$total += $presupuestoProducto->monto_presupuesto;	
				}
		//Importados
			if($presuPartida->presupuestoImportacion)
				foreach ($presuPartida->presupuestoImportacion as $key => $presupuestoImportacion) {
					$total += ($presupuestoImportacion->cantidad*$presupuestoImportacion->monto_presupuesto*$presupuestoImportacion->divisa->tasa->tasa);
				}
 		return $total;
 	}


	public function montoAccion(PresupuestoPartidaAcciones $accion){

			$monto = 0;
			
			$usuario = Usuarios::model()->findByPk(Yii::app()->user->getId());

			$partidasAcciones = PresupuestoPartidaAcciones::model()->findAllByAttributes(array('accion_id'=>$accion->accion_id,'ente_organo_id'=>$usuario->enteOrgano->ente_organo_id));
			foreach ($partidasAcciones as $key => $partidaAcciones) {

					$monto += $partidaAcciones->presupuestoPartida->monto_presupuestado;
			}

			return $monto;

	}

	public function montoProyecto(Proyectos $proyecto){

			$monto = 0;
			foreach ($proyecto->presupuestoPartidas as $key => $presupuestoPartida) {
				$monto += $presupuestoPartida->monto_presupuestado;
			}
			return $monto;

	}

}