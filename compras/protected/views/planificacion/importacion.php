<?php
//if(PresupuestoPartidas::model()->findByPk(112835)->delete())
	if(PresupuestoPartidaAcciones::model()->findByAttributes(array('presupuesto_partida_id'=>112835))->delete())
					{
						echo "si";
					}else
					{
						echo "No";
					}
?>