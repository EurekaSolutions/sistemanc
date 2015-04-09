<?php
class MiCliente extends CApplicationComponent{
        private $client = null;
        public $ws_url;
        private function getClienteInt() {
                if($this->client == null)
                {
                        // para que reconozca nuevas funciones del WS 
                        ini_set (  'soap.wsdl_cache_enable'  ,  0  );
                        ini_set (  'soap.wsdl_cache_ttl'  ,  0  );
                        $this->client = new SoapClient($this->ws_url);
                }
                return $this->client;
        }
         
      
        public function obtenerregistro($datos) {
                return $this->getClienteInt()->getObtenerRegistro($datos);
        }
        public function obtenerlogin($datos) {
                return $this->getClienteInt()->login($datos);
        }
       
        
     
}