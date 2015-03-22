<?php

class ActiveRecord extends CActiveRecord{
		

		public function obtenerSchema(){
			switch (Yii::app()->params['trimestreActual']) {
				case 0:
					return 'public';
					break;
				case 1:
					return 'trimestre1';
					break;
				case 2:
					return 'trimestre2';
					break;
				case 3:
					return 'trimestre3';
					break;
				case 4:
					return 'trimestre4';
					break;
				default:
					//$tableName = 'public.proyectos';
					break;
			}	
	}

}