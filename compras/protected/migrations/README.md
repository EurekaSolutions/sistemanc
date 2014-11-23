Source: http://www.yiiframework.com/forum/index.php/topic/2179-postgresql-schemas-not-possible/


Yii 1 no soporta el uso de multiples esquemas es por esto que necesitamos crear un usuario para cada esquema-proyecto quedando de la siguiente forma:

DB-esquema1-usuario1-proyecto1
DB-esquema2-usuario2-proyecto2

in protected/components/MydbConection.php
class MydbConection extends CDbConnection {
  protected function initConnection($pdo)
  {
    parent::initConnection($pdo);
    $stmt=$pdo->prepare("set search_path to yourschema, public");
    $stmt->execute();
  }
}


and 
'db'=>array(
                        'class'=> 'MydbConection',
                        'connectionString' => 'pgsql:host=localhost;port=5432;dbname=yourdb',
                        'username' => 'youruser',
                        'password' => 'yourpassd',
                       
        
                ),

in config/main.php