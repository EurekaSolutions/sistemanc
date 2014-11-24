<?php

class m141124_215117_activerecordlog extends CDbMigration
{
	public function up()
	{
		$this->createTable('activerecordlog', array(
            'id' => 'pk',
            'descripcion' => 'string',
			'accion' => 'string',
			'model' => 'string',
			'idmodel' => 'integer',
			'field' => 'string NOT NULL',
			'creationdate' => 'datetime NOT NULL',
			'userid' => 'string NOT NULL',
        ));
		
		
	}

	public function safeDown()
    {
        $this->dropTable('activerecordlog');
    }

	/*
	// Use safeUp/safeDown to do migration with transaction
	public function safeUp()
	{
	}

	public function safeDown()
	{
	}
	*/
}