<?php

// uncomment the following to define a path alias
// Yii::setPathOfAlias('local','path/to/local-folder');

// This is the main Web application configuration. Any writable
// CWebApplication properties can be configured here.
return array(
	'basePath'=>dirname(__FILE__).DIRECTORY_SEPARATOR.'..',
	'name'=>'PLAN DE COMPRAS DEL ESTADO',
	'sourceLanguage'=>'es',
	'language'=>'es',

	// preloading 'log' component
	'preload'=>array('log'),

	// path aliases
    'aliases' => array(
        'bootstrap' => realpath(__DIR__ . '/../extensions/bootstrap'), // change this if necessary
    ),

	// autoloading model and component classes
	'import'=>array(
		'application.models.*',
		'application.components.*',
		'bootstrap.helpers.*',
		'bootstrap.widgets.*',
		'bootstrap.behaviors.TbWidget',
		'application.behaviors.ActiveRecordLogableBehavior', 
	),

	'modules'=>array(
		// uncomment the following to enable the Gii tool
		
		'gii'=>array(
			'class'=>'system.gii.GiiModule',
			'password'=>'rnc',
			// If removed, Gii defaults to localhost only. Edit carefully to taste.
			'ipFilters'=>array('127.0.0.1','::1'),
			'generatorPaths' => array('bootstrap.gii'),
		),	
		'usr'=>array(
			'registrationEnabled'=>false,
            'userIdentityClass' => 'UserIdentity',
			'layout' => '//layouts/centered',
			'formClass'=>'bootstrap.widgets.TbActiveForm',
			'detailViewClass'=>'bootstrap.widgets.TbDetailView',
			'formCssClass'=>'form well',
			'alertCssClassPrefix'=>'alert alert-',
			'submitButtonCssClass'=>'btn btn-primary',
			'htmlCss' => array(
				'errorSummaryCss' => 'alert alert-error',
				'errorMessageCss' => 'text-error',
			),
			'mailerConfig'=>array(
				'SetLanguage' => array('es'),
				'SetFrom' => array('marcospha@gmail.com', 'Administrator'),
				'AddReplyTo' => array('eurekasolutionsca@gmail.com','Administrator'),
				'IsMail' => array(),
				// SMTP options
				'IsSMTP' => array(),
				'Host' => 'smtp.gmail.com',
				'Port' => 465,
				'Username' => 'eurekasolutionsca@gmail.com',
				'Password' => '3ur3k4123',
				'FromName' => 'SNC Compras',
				'CharSet' => 'UTF-8',
				),
        ),
	),

	// application components
	'components'=>array(
		'user'=>array(
			// enable cookie-based authentication
			'allowAutoLogin'=>true,
			'loginUrl' => array('usr/login'),

		),

 		'bootstrap' => array(
            'class' => 'bootstrap.components.TbApi',   
        ),
		// uncomment the following to enable URLs in path-format
		/*
		'urlManager'=>array(
			'urlFormat'=>'path',
			'showScriptName'=>false,
			'rules'=>array(
				'<controller:\w+>/<id:\d+>'=>'<controller>/view',
				'<controller:\w+>/<action:\w+>/<id:\d+>'=>'<controller>/<action>',
				'<controller:\w+>/<action:\w+>'=>'<controller>/<action>',
			),
		),
		*/
		/*'db'=>array(
			'connectionString' => 'sqlite:'.dirname(__FILE__).'/../data/testdrive.db',
		),*/
		// uncomment the following to use a MySQL database
		
		'db'=>array(
			'connectionString' => 'pgsql:host=localhost;dbname=sistemanc',
			'emulatePrepare' => true,
			'username' => 'compras',
			'password' => 'compras',
			'charset' => 'utf8',
		),
		
		'errorHandler'=>array(
			// use 'site/error' action to display errors
			'errorAction'=>'site/error',
		),
		'log'=>array(
			'class'=>'CLogRouter',
			'routes'=>array(
				array(
					'class'=>'CFileLogRoute',
					'levels'=>'error, warning',
				),
				// uncomment the following to show log messages on web pages
				/*
				array(
					'class'=>'CWebLogRoute',
				),
				*/
			),
		),
	),

	// application-level parameters that can be accessed
	// using Yii::app()->params['paramName']
	'params'=>array(
		// this is used in contact page
		'adminEmail'=>'webmaster@example.com',
	),
);