<?php

class ActiveRecord extends CActiveRecord{
		

		public function obtenerSchema(){

			if(Yii::app()->session['trimestreSeleccionado'])
				return Yii::app()->params['trimestresEsquemas'][Yii::app()->session['trimestreSeleccionado']];
			else
				return 'public';
			

	}

}