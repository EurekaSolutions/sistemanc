<?php

class m141122_200458_agregar_columnas_tabla_usuarios extends CDbMigration
{
	public function safeUp()
	{
		$this->addColumn('usuarios','esta_activo', 'boolean DEFAULT true');
		$this->addColumn('usuarios','esta_deshabilitado', 'boolean DEFAULT false');
	}

	public function safeDown()
	{
		/*echo "m141122_200458_agregar_columnas_tabla_usuarios does not support migration down.\n";
		return false;*/
		$this->dropColumn('usuarios','esta_activo');
		$this->dropColumn('usuarios','esta_deshabilitado');
	}

}