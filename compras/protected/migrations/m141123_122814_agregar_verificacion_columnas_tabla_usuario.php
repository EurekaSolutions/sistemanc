<?php

class m141123_122814_agregar_verificacion_columnas_tabla_usuario extends CDbMigration
{
	public function safeUp()
	{
		$this->addColumn('usuarios','correo_verificado', 'boolean DEFAULT false');
		$this->addColumn('usuarios','llave_activacion', 'string');
		$this->addColumn('usuarios','ultima_visita_el', 'timestamp');
	}

	public function safeDown()
	{
		$this->dropColumn('usuarios','correo_verificado');
		$this->dropColumn('usuarios','llave_activacion');
		$this->dropColumn('usuarios','ultima_visita_el');
	}
}