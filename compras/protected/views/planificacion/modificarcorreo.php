<div>
			<h4 style="text-align: center;">MODIFICAR CORREO A USUARIOS</h4><br>				
				  	

			   <?php 


					    foreach(Yii::app()->user->getFlashes() as $key => $message) {
					        echo '<div class="flash-' . $key . '">' . $message . "</div>\n";
					    }

								/** @var TbActiveForm $form */
								$form = $this->beginWidget('booster.widgets.TbActiveForm',
								    array(
								        'id' => 'usuarios-form',
								        'htmlOptions' => array('class' => 'well'), // for inset effect
								    )
								);

								//echo $form->errorSummary($usuario);
/*
								 echo $form->dropDownListGroup($usuario , 'usuario_id',
										array(
											'wrapperHtmlOptions' => array(
												'class' => 'col-sm-2',
											),
											'label'=>'Seleccione Ente u Organo',
											'widgetOptions' => array(

												'data' => $lista_usuarios,
												//'options'=>array($model->proyecto_id => array('selected'=>true)),
												//'htmlOptions' => array('prompt' => 'Seleccione'),
											)
										)
									); */
							    echo $form->select2Group($usuario, 'usuario_id',
							                        array(
							                            'wrapperHtmlOptions' => array(
							                                'class' => 'col-sm-5',
							                            ),
							                            'label'=>'Seleccione Ente u Organo',
							                            'widgetOptions' => array(
							                                'asDropDownList' => true,
							                                'data' => $lista_usuarios,
							                                'htmlOptions'=>array(),
							                                'options' => array(
							                                    //'tags' => array('clever', 'is', 'better', 'clevertech'),
							                                    'placeholder' => 'Seleccionar Ente u Organo',
							                                    // 'width' => '40%', 
							                                    'tokenSeparators' => array(',', ' ')
							                                )
							                            )
							                        )
							                    );
								 echo $form->textFieldGroup($usuario,'correo',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span3'))));

								// echo CHtml::dropDownList('partida','', array());

								 
								 

								/*	$this->widget(
									    'booster.widgets.TbButton',
									    array('buttonType' => 'submit', 'label' => 'Seleccionar')
									); */
								 


						$this->widget('booster.widgets.TbButton', array(
			            	'buttonType'=>'submit',
			            	'context'=>'primary',
			            	'label'=>$usuario->isNewRecord ? 'Cambiar correo' : 'Cambiar correo',
			        	)); 



						$this->endWidget();
					unset($form);
			?>

		</div>