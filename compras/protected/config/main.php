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
	'preload'=>array('log','booster'),

	// path aliases
    'aliases' => array(
        'booster' => realpath(__DIR__ . '/../extensions/booster'), // change this if necessary
    ),

	// autoloading model and component classes
	'import'=>array(
		'application.models.*',
		'application.components.*',
		'application.behaviors.ActiveRecordLogableBehavior',
	),

	'modules'=>array(
		// uncomment the following to enable the Gii tool
		
		'gii'=>array(
			'class'=>'system.gii.GiiModule',
			'password'=>'rnc',
			// If removed, Gii defaults to localhost only. Edit carefully to taste.
			'ipFilters'=>array('127.0.0.1','::1'),
			'generatorPaths' => array('booster.gii'),
		),	
		'usr'=>array(
			'registrationEnabled'=>false,
			'captcha'=>true,
			'requireVerifiedEmail'=>true,
            'userIdentityClass' => 'UserIdentity',
			'layout' => '//layouts/centered',
			'formClass'=>'booster.widgets.TbActiveForm',
			'detailViewClass'=>'booster.widgets.TbDetailView',
			'formCssClass'=>'form well',
			'alertCssClassPrefix'=>'alert alert-',
			'submitButtonCssClass'=>'btn btn-primary',
			'htmlCss' => array(
				'errorSummaryCss' => 'alert alert-error',
				'errorMessageCss' => 'text-error',
			),
			'mailerConfig'=>array(
				'SetLanguage' => array('es'),
				'SetFrom' => array('admin_rnce@snc.gob.ve', 'RNCE Sistema Automatizado'),
				'AddReplyTo' => array('rnce@snc.gob.ve','Registro Nacional De Contrataciones del Estado'),
				'IsMail' => array(),
				// SMTP options
				'IsSMTP' => array(),
				'Host' => 'correo.snc.gob.ve',
				'Port' => 465,
				'SMTPSecure' => 'ssl',
				//'SMTPDebug' => 2,
				'SMTPAuth' => true,
				'Username' => 'admin_rnce',
				'Password' => 'GikforewnEd3',
				'FromName' => 'RNCE Sistema Automatizado',
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
		'authManager'=>array(
            'class'=>'CPhpAuthManager',
			//          'authFile' => 'path'                  // only if necessary
        ),
        'booster' => array(
		    'class' => 'ext.booster.components.Booster',
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
			'username' => 'eureka',
			'password' => 'eureka',
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
		'minimoContrasena'=>6,
	),
);
