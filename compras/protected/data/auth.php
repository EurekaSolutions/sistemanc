<?php
return array (
  'superadmin' => 
  array (
    'type' => 2,
    'description' => 'Acceso a todo el sistema',
    'bizRule' => '',
    'data' => '',
    'children' => 
    array (
      0 => 'admin',
    ),
  ),
  'admin' => 
  array (
    'type' => 2,
    'description' => 'Funciones básicas de crud de admin',
    'bizRule' => '',
    'data' => '',
    'children' => 
    array (
      0 => 'organo',
    ),
    'assignments' => 
    array (
      1234 => 
      array (
        'bizRule' => NULL,
        'data' => NULL,
      ),
    ),
  ),
  'organo' => 
  array (
    'type' => 2,
    'description' => 'Acceso  a las funciones de un organo, como crear ente.',
    'bizRule' => '',
    'data' => '',
    'children' => 
    array (
      0 => 'ente',
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
