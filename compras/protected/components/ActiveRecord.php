<?php

class ActiveRecord extends CActiveRecord{
		

		public function obtenerSchema($rendicion = false){

            $scheme = '';
			if(Yii::app()->session['trimestreSeleccionado'])
				$scheme =  Yii::app()->params['trimestresEsquemas'][Yii::app()->session['trimestreSeleccionado']];
			else
				$scheme =   'public';
			
            if($rendicion)
       			if($scheme == 'public')
                	throw new CHttpException(404,'No se encuentra en un periodo para la realización de rendición.');
            
            return $scheme;
	}

}