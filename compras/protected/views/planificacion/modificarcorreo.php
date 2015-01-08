<div>
			<h4 style="text-align: center;">MOFICIAR CORREO A USUARIOS</h4><br>				
				  	

			   <?php 


					    foreach(Yii::app()->user->getFlashes() as $key => $message) {
					        echo '<div class="flash-' . $key . '">' . $message . "</div>\n";
					    }

								/** @var TbActiveForm $form */
								$form = $this->beginWidget('booster.widgets.TbActiveForm',
								    array(
								        'id' => 'agregarcentralizada-form',
								        'htmlOptions' => array('class' => 'well'), // for inset effect
								    )
								);

								echo $form->errorSummary($usuarios);

								 echo $form->dropDownListGroup($usuarios , 'nombre',
										array(
											'wrapperHtmlOptions' => array(
												'class' => 'col-sm-2',
											),
											'label'=>'Seleccione',
											'widgetOptions' => array(

												'data' => $lista_usuarios,
												//'options'=>array($model->proyecto_id => array('selected'=>true)),
												'htmlOptions' => array('prompt' => 'Seleccione', 'ajax' => array(
													'type'=>'POST', //request type
													'url'=>CController::createUrl('planificacion/buscarcorreo'), //url to call.
													//Style: CController::createUrl('currentController/methodToCall')
													'update'=>'#partida', //selector to update
													//'data'=>'js:javascript statement' 
													//leave out the data key to pass all form values through
											  )),
											)
										)
									); 

								// echo CHtml::dropDownList('partida','', array());

								 
								 

								/*	$this->widget(
									    'booster.widgets.TbButton',
									    array('buttonType' => 'submit', 'label' => 'Seleccionar')
									); */
								 


						$this->widget('booster.widgets.TbButton', array(
			            	'buttonType'=>'submit',
			            	'context'=>'primary',
			            	'label'=>$usuarios->isNewRecord ? 'Cambiar correo' : 'Cambiar correo',
			        	)); 



						$this->endWidget();
					unset($form);
			?>

		</div>