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
    'assignments' => 
    array (
      4491 => 
      array (
        'bizRule' => NULL,
        'data' => NULL,
      ),
      1258 => 
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
    'children' => 
    array (
      0 => 'presupuesto',
      1 => 'producto',
    ),
  ),
  'presupuesto' => 
  array (
    'type' => 2,
    'description' => 'Puede cargar el presupuesto a las partidas. Es el unico con permisos para agregar y quitar partidas y asignar dinero a las mismas.',
    'bizRule' => '',
    'data' => '',
  ),
  'producto' => 
  array (
    'type' => 2,
    'description' => 'Puede asociar productos al presupuesto cargado, eliminar productos.',
    'bizRule' => '',
    'data' => '',
  ),
);
