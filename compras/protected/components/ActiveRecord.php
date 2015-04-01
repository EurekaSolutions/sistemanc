<?php

class ActiveRecord extends CActiveRecord{
		

		public function obtenerSchema($rendicion = false){
			if($rendicion)
				return Yii::app()->params['trimestresEsquemasRendicion'][Yii::app()->session['trimestreSeleccionado']];
			if(Yii::app()->session['trimestreSeleccionado'])
				return Yii::app()->params['trimestresEsquemas'][Yii::app()->session['trimestreSeleccionado']];
			else
				return 'public';
			

	}

}