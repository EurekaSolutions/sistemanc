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
      1339 => 
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
    'children' => 
    array (
      0 => 'uel',
    ),
  ),
  'uel' => 
  array (
    'type' => 2,
    'description' => 'Unidad Ejecutora Local. Acceso básico al sistema.',
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
