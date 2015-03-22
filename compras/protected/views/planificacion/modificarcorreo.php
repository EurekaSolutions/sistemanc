<div>
			<h4 style="text-align: center;">MODIFICAR CORREO A USUARIOS ORGANOS</h4><br>				
				  	

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


							    echo $form->select2Group($usuario, 'usuario_id',
							                        array(
							                            'wrapperHtmlOptions' => array(
							                                'class' => 'col-sm-5',
							                            ),
							                            'label'=>'Seleccione Ente u Organo',
							                            'widgetOptions' => array(
							                                'asDropDownList' => true,
							                                'data' => $lista_usuarios,
							                                'htmlOptions'=>array('id'=>'usuarios',
							                                	'ajax' => array(
																'type'=>'POST', //request type
																'url'=>CController::createUrl('planificacion/correoactual'), //url to call.
																//Style: CController::createUrl('currentController/methodToCall')
																//'update'=>'#disponible', //selector to update
																'success' => 'function($data){ 
								
																		$("#correo_actual").html("Correo actual: "+$data);
											
																}',
																//'data'=>'js:javascript statement' 
																//leave out the data key to pass all form values through
														 		 )),

							                                'options' => array(
							                                    //'tags' => array('clever', 'is', 'better', 'clevertech'),
							                                    'placeholder' => 'Seleccionar Ente u Organo',
							                                    // 'width' => '40%', 
							                                    'tokenSeparators' => array(',', ' ')
							                                )
							                            )
							                        )
							                    );
								
								if($correo_actual)
								{	
									echo CHtml::label('Correo actual: '.$correo_actual , 'correo_actual', array('id'=>'correo_actual'));
								}else
								{
									echo CHtml::label('Correo actual:', 'correo_actual', array('id'=>'correo_actual'));
								}
							    echo '<br/><br/>';
								echo $form->textFieldGroup($usuario,'correo',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span3'))));
								 


						$this->widget('booster.widgets.TbButton', array(
			            	'buttonType'=>'submit',
			            	'context'=>'primary',
			            	'label'=>$usuario->isNewRecord ? 'Cambiar correo' : 'Cambiar correo',
			        	)); 

						$this->endWidget();
					unset($form);
			?>

		</div>