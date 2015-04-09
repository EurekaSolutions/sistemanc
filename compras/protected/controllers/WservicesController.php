<?php
class WservicesController extends Controller
{
public function actions()
    {
        return array(
            'ws'=>array('class'=>'CWebServiceAction',),
        );
    }
    /**
      * @param array the datos
      * @return string
      * @soap
    */
    public function login($datos)
    {
         if(isset($datos['usuario']) ){
             
              if(isset($datos['clave']) ){
                  $usuario=UsuariosWs::model()->findByAttributes(array('usuario'=>$datos['usuario']));
                    if(isset($usuario)){
                        if($usuario->validatePassword($datos['clave'])){
        
 
                                $sessionKey = sha1(mt_rand());
                                $usuario->token= $sessionKey;
                   
                                 $usuario->save();
                                return $sessionKey;
           
                        }else{
                            
                                return "4";
                        
                                
                        }
                    }else{
                        
                        return "3";
                        
                    }
                  
                  
               }else{
                  return "2";
               }
             
         }else{
             return "1";
         }
         
    }
    /**
      * @param array the datos
      * @param string the fecha
      * @return string
      * @soap
    */   
    public function getObtenerRegistro($datos)
    {
        if(isset($datos['token']) && $datos['token']!='1' && $datos['token']!='2' && $datos['token']!='3' && $datos['token']!='4' ){
            $data = UsuariosWs::model()->findByAttributes(array('token'=>$datos['token']));
            if(count($data)>=1){
                if(isset($datos['fecha'])){
                    if($this->validarfecha($datos['fecha'])){
                        $sql="SELECT * FROM presupuesto_importacion Where fecha_llegada <= '".$datos['fecha']."' order by fecha_llegada desc";
                        if(isset($datos['orden'])){
                            if($datos['orden']){
                                 $sql="SELECT * FROM presupuesto_importacion Where fecha_llegada >= '".$datos['fecha']."' order by fecha_llegada desc";
                            }else{
                                return "Valor del campo orden invalido";
                            }
                            
                        }
                        
                  
                        $sqlpresupuesto = Yii::app()->db->createCommand($sql)->queryAll();
                        if(count($sqlpresupuesto)>=1){
                        return CJSON::encode( $sqlpresupuesto);
                        }else{
                            return "Sin resultados";
                        }
                    }else{
                        return "formato de fecha invalido";
                    } 
                }else{
                    return "campo de fecha vacio";
                }
               
               
            }else{
              return "Token invalido";
            }
        }
        return "Usuario no autenticado";
          
          
         
    }
    public function validarfecha($fecha)
    {
      $patron='/^[2][0-9]{3}[\-](0?[1-9]|1[012])[\-](0?[1-9]|[12][0-9]|3[01])$/';
		if(preg_match($patron,$fecha)){
		return true;
		}else{

		return false;
		}
        
          
         
    }
    
  
}