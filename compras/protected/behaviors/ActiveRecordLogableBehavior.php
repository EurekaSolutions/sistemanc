<?php

class ActiveRecordLogableBehavior extends CActiveRecordBehavior
{
    private $_oldattributes = array();
 
    public function afterSave($event)
    {
        if (!$this->Owner->isNewRecord) {
 
            // new attributes
            $newattributes = $this->Owner->getAttributes();
            $oldattributes = $this->getOldAttributes();
 
            // compare old and new
            foreach ($newattributes as $name => $value) {
                if (!empty($oldattributes)) {
                    $old = $oldattributes[$name];
                } else {
                    $old = '';
                }
 
                if ($value != $old) {
                    //$changes = $name . ' ('.$old.') => ('.$value.'), ';
 
                    $log = new Activerecordlog;
                    $log->descripcion=  'User ' . Yii::app()->user->Name 
                                            . ' changed ' . $name . ' for ' 
                                            . get_class($this->Owner) 
                                            . '[' . $this->Owner->getPrimaryKey() .'].';
                    $log->accion =       'CHANGE';
                    $log->model =        get_class($this->Owner);
                    $log->idmodel =      $this->Owner->getPrimaryKey();
                    $log->field =        $name;
                    $log->creationdate = new CDbExpression('NOW()');
                    $log->userid =       Yii::app()->user->id;
                    $log->save();
                }
            }
        } else {
            
            $log = new Activerecordlog;

            $log->descripcion =  'User ' . Yii::app()->user->Name 
                                    . ' created ' . get_class($this->Owner) 
                                    . '[' . $this->Owner->getPrimaryKey() .'].';
            $log->accion =       'CREATE';
            $log->model =        get_class($this->Owner);
            $log->idmodel =      $this->Owner->getPrimaryKey();
            $log->field =        '';
            $log->creationdate = new CDbExpression('NOW()');
            $log->userid =       Yii::app()->user->id;
            $log->save();

          /*  $pro = new Unidades;

            $pro->nombre = 'unidades';
            $pro->save();*/

            return false;
        }
    }
 
    public function afterDelete($event)
    {
        $log= new Activerecordlog;
        $log->descripcion=  'User ' . Yii::app()->user->Name . ' deleted ' 
                                . get_class($this->Owner) 
                                . '[' . $this->Owner->getPrimaryKey() .'].';
        $log->accion =       'DELETE';
        $log->model =        get_class($this->Owner);
        $log->idmodel =      $this->Owner->getPrimaryKey();
        $log->field =        '';
        $log->creationdate = new CDbExpression('NOW()');
        $log->userid =       Yii::app()->user->id;
        $log->save();
    }
 
    public function afterFind($event)
    {
        // Save old values
        $this->setOldAttributes($this->Owner->getAttributes());
    }
 
    public function getOldAttributes()
    {
        return $this->_oldattributes;
    }
 
    public function setOldAttributes($value)
    {
        $this->_oldattributes=$value;
    }
}
?>