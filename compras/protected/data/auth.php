<?php
return array (
  'superadmin' => 
  array (
    'type' => 2,
    'description' => 'Acceso a todo el sistema',
    'bizRule' => '',
    'data' => '',
  ),
  'admin' => 
  array (
    'type' => 2,
    'description' => 'Funciones básicas de crud de admin',
    'bizRule' => '',
    'data' => '',
  ),
  'organo' => 
  array (
    'type' => 2,
    'description' => 'Acceso  a las funciones de un organo, como crear ente.',
    'bizRule' => '',
    'data' => '',
    'assignments' => 
    array (
      1234 => 
      array (
        'bizRule' => NULL,
        'data' => NULL,
      ),
    ),
  ),
  'ente' => 
  array (
    'type' => 2,
    'description' => 'Acceso básico al sistema.',
    'bizRule' => '',
    'data' => '',
  ),
);
