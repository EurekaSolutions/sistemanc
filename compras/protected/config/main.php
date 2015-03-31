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
		'session' => array (
		    'sessionName' => 'SNCAccess',
		    //'cookieMode' => 'only',
		    //'savePath' => '/path/to/new/directory',
		),
		 'format'=>array(
		        'class'=>'application.components.Formatter',
		        'numberFormat'=>array('decimals'=>2, 'decimalSeparator'=>',', 'thousandSeparator'=>'.'),
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
				
				array(
					'class'=>'CWebLogRoute',
				),
				
			),
		),
		
		'ePdf' => array(
			'class'         => 'ext.yii-pdf.EYiiPdf',
			'params'        => array(
				'mpdf'     => array(
					'librarySourcePath' => 'application.vendors.mpdf.*',
					'constants'         => array(
						'_MPDF_TEMP_PATH' => Yii::getPathOfAlias('application.runtime'),
					),
					'class'=>'mpdf', // the literal class filename to be loaded from the vendors folder
					/*'defaultParams'     => array( // More info: http://mpdf1.com/manual/index.php?tid=184
						'mode'              => '', //  This parameter specifies the mode of the new document.
						'format'            => 'A4', // format A4, A5, ...
						'default_font_size' => 0, // Sets the default document font size in points (pt)
						'default_font'      => '', // Sets the default font-family for the new document.
						'mgl'               => 15, // margin_left. Sets the page margins for the new document.
						'mgr'               => 15, // margin_right
						'mgt'               => 16, // margin_top
						'mgb'               => 16, // margin_bottom
						'mgh'               => 9, // margin_header
						'mgf'               => 9, // margin_footer
						'orientation'       => 'P', // landscape or portrait orientation
					)*/
				),
				'HTML2PDF' => array(
					'librarySourcePath' => 'application.vendors.html2pdf.*',
					'classFile'         => 'html2pdf.class.php', // For adding to Yii::$classMap
					/*'defaultParams'     => array( // More info: http://wiki.spipu.net/doku.php?id=html2pdf:en:v4:accueil
						'orientation' => 'P', // landscape or portrait orientation
						'format'      => 'A4', // format A4, A5, ...
						'language'    => 'en', // language: fr, en, it ...
						'unicode'     => true, // TRUE means clustering the input text IS unicode (default = true)
						'encoding'    => 'UTF-8', // charset encoding; Default is UTF-8
						'marges'      => array(5, 5, 5, 8), // margins by default, in order (left, top, right, bottom)
					)*/
				)
			),
		),
	
	),

	// application-level parameters that can be accessed
	// using Yii::app()->params['paramName']
	'params'=>array(
		// this is used in contact page
		'adminEmail'=>'webmaster@example.com',
		'minimoContrasena'=>6,
		'etiquetasTrimestres'=>array(
			'trimestre0'=>'Plan de compras original',
			'trimestre1'=>'Trimestre 1',
			'trimestre2'=>'Trimestre 2',
			'trimestre3'=>'Trimestre 3',
			'trimestre4'=>'Trimestre 4',),
		'trimestresFechas'=>array(
			'trimestre0'=>array('c'=>date('Y').'-07-01', 'f'=>date('Y').'-12-31', 'anho'=>date('Y')+1),
			'trimestre1'=>array('c'=>date('Y').'-01-16', 'f'=>date('Y').'-04-15', 'anho'=>date('Y')),
			'trimestre2'=>array('c'=>date('Y').'-04-16', 'f'=>date('Y').'-07-15', 'anho'=>date('Y')),
			'trimestre3'=>array('c'=>date('Y').'-07-16', 'f'=>date('Y').'-10-15', 'anho'=>date('Y')),
			'trimestre4'=>array('c'=>date('Y').'-10-16', 'f'=>date('Y').'-01-15', 'anho'=>date('Y'))),
		'trimestresEsquemas'=>array(
			'trimestre0'=>'public',
			'trimestre1'=>'trimestre1',
			'trimestre2'=>'trimestre2',
			'trimestre3'=>'trimestre3',
			'trimestre4'=>'trimestre4',),
		//Yii::app()->params['trimestreActual']
	),
);
