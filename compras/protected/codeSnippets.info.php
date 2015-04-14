	echo $form->select2Group(
						$model,
						'presupuesto_partida_id',
						array(
							'wrapperHtmlOptions' => array(
								'class' => 'col-sm-5',
							),
							'widgetOptions' => array(
								'asDropDownList' => true,
								'data' => $list,
						        'htmlOptions'=>array('id'=>'partida',
											'ajax' => array(
													'type'=>'POST', //request type
													'url'=>CController::createUrl('facturasProductos/buscarProductosPartida'), //url to call.
													//Style: CController::createUrl('currentController/methodToCall')
													'update'=>'#producto', //selector to update
													//'data'=>'js:javascript statement' 
													//leave out the data key to pass all form values through
											  )),
								'options' => array(
									//'tags' => array('clever', 'is', 'better', 'clevertech'),
									'placeholder' => 'type clever, or is, or just type!',
									// 'width' => '40%', 
									'tokenSeparators' => array(',', ' ')
								)
							)
						)
					);


    echo $form->select2Group($model, 'ente_organo_id',
                        array(
                            'wrapperHtmlOptions' => array(
                                'class' => 'col-sm-5',
                            ),
                            'label'=>'Seleccione el ente',
                            'widgetOptions' => array(
                                'asDropDownList' => true,
                                'data' => $listaEntes,
                                'htmlOptions'=>array('id'=>'producto',),
                                'options' => array(
                                    //'tags' => array('clever', 'is', 'better', 'clevertech'),
                                    'placeholder' => 'Seleccionar ente',
                                    // 'width' => '40%', 
                                    'tokenSeparators' => array(',', ' ')
                                )
                            )
                        )
                    );