<?php

class m141122_220151_crear_tabla_user_login_attempts extends CDbMigration
{
    public function safeUp()
    {
        $this->createTable('user_login_attempts', array(
            'id' => 'pk',
            'username' => 'string NOT NULL',
            'user_id' => 'integer REFERENCES usuarios (usuario_id) ON UPDATE CASCADE ON DELETE CASCADE',
            'performed_on' => 'timestamp NOT NULL',
            'is_successful' => 'boolean NOT NULL DEFAULT false',
            'session_id' => 'string',
            'ipv4' => 'integer',
            'user_agent' => 'string',
        ));

        $this->createIndex('user_login_attempts_user_id_idx', 'user_login_attempts', 'user_id');
    }

    public function safeDown()
    {
        $this->dropTable('user_login_attempts');
    }
}