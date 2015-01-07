		<script type="text/javascript">
			$( document ).ready(function() {
				//alert("ready!");
				$( "#Acciones_nombre" ).change(function() {
					$('#general').html("");
					$( "#general" ).append( '<option value="">Seleccionar partida general</option>' );
					$('#especifica').html("");
					$( "#especifica" ).append( '<option value="">Seleccionar partida especifica</option>' );
					$('#subespecifica').html("");
					$( "#subespecifica" ).append( '<option value="">Seleccionar partida subespecifica</option>' );
				});

				$( "#partida" ).change(function() {
					$('#especifica').html("");
					$( "#especifica" ).append( '<option value="">Seleccionar partida especifica</option>' );
					$('#subespecifica').html("");
					$( "#subespecifica" ).append( '<option value="">Seleccionar partida subespecifica</option>' );
				});
			});
		</script>

		<div>
			<h4 style="text-align: center;">AGREGAR ACCIONES CENTRALIZADAS</h4><br>				
				  	

			   <?php 


					    foreach(Yii::app()->user->getFlashes() as $key => $message) {
					        echo '<div class="flash-' . $key . '">' . $message . "</div>\n";
					    }

				    			$lista_acciones = CHtml::listData($accionestodas, 'codigo', 'nombre');

				    			
								/*$partidas_principal = CHtml::listData($partidas, function($partidas) {
																return CHtml::encode($partidas->partida_id);
															}, function($partidas) {
																return CHtml::encode($partidas->p1.'-'. $partidas->nombre);
															});*/

								$fuentes = CHtml::listData($fuentes, 'fuente_financiamiento_id', 'nombre');

								/** @var TbActiveForm $form */
								$form = $this->beginWidget('booster.widgets.TbActiveForm',
								    array(
								        'id' => 'agregarcentralizada-form',
								        'htmlOptions' => array('class' => 'well'), // for inset effect
								    )
								);

								echo $form->errorSummary($acciones);

								 echo $form->dropDownListGroup($acciones , 'nombre',
										array(
											'wrapperHtmlOptions' => array(
												'class' => 'col-sm-2',
											),
											'label'=>'Seleccione Acción Centralizada a cargar',
											'widgetOptions' => array(

												'data' => $lista_acciones,
												//'options'=>array($model->proyecto_id => array('selected'=>true)),
												'htmlOptions' => array('prompt' => 'Seleccione Acción centralizada', 'ajax' => array(
													'type'=>'POST', //request type
													'url'=>CController::createUrl('planificacion/buscarpartida'), //url to call.
													//Style: CController::createUrl('currentController/methodToCall')
													'update'=>'#partida', //selector to update
													//'data'=>'js:javascript statement' 
													//leave out the data key to pass all form values through
											  )),
											)
										)
									); 

								// echo CHtml::dropDownList('partida','', array());

								 
								 echo $form->dropDownListGroup($acciones , 'partida',
										array(
											'wrapperHtmlOptions' => array(
												'class' => 'col-sm-2',
											),
											'label'=>'Seleccione la partida',
											'widgetOptions' => array(

												'data' => empty($partidas_principal)? array() : $partidas_principal ,
												//'options'=>array($model->proyecto_id => array('selected'=>true)),
												'htmlOptions' => array('prompt' => 'Seleccionar partida', 'id' => 'partida', 'ajax' => array(
													'type'=>'POST', //request type
													'url'=>CController::createUrl('planificacion/buscargeneral'), //url to call.
													//Style: CController::createUrl('currentController/methodToCall')
													'update'=>'#general', //selector to update
													//'data'=>'js:javascript statement' 
													//leave out the data key to pass all form values through
											  )),
											)
										)
									);

								  echo $form->dropDownListGroup($acciones , 'general',
										array(
											'wrapperHtmlOptions' => array(
												'class' => 'col-sm-2',
											),
											'label'=>'Seleccione general',
											'widgetOptions' => array(

												'data' => empty($generales_todas)? array() : $generales_todas,
												
												//'options'=>array($model->proyecto_id => array('selected'=>true)),
												'htmlOptions' => array('prompt' => 'Seleccionar partida general', 'id' => 'general', 'ajax' => array(
													'type'=>'POST', //request type
													'url'=>CController::createUrl('planificacion/buscarespecfica'), //url to call.
													//Style: CController::createUrl('currentController/methodToCall')
													'update'=>'#especifica', //selector to update
													//'data'=>'js:javascript statement' 
													//leave out the data key to pass all form values through
											  )

												),
											),

										)
									);


								  echo $form->dropDownListGroup($acciones , 'especifica',
										array(
											'wrapperHtmlOptions' => array(
												'class' => 'col-sm-2',
											),
											'label'=>'Seleccione especifica',
											'widgetOptions' => array(

												'data' => empty($especificas_todas)? array() : $especificas_todas,
												
												//'options'=>array($model->proyecto_id => array('selected'=>true)),
												'htmlOptions' => array('prompt' => 'Seleccionar partida especifica', 'id' => 'especifica', 'ajax' => array(
													'type'=>'POST', //request type
													'url'=>CController::createUrl('planificacion/buscarsubespecfica'), //url to call.
													//Style: CController::createUrl('currentController/methodToCall')
													'update'=>'#subespecifica', //selector to update
													//'data'=>'js:javascript statement' 
													//leave out the data key to pass all form values through
											  )

												),
											),

										)
									);


								  echo $form->dropDownListGroup($acciones , 'subespecifica',
										array(
											'wrapperHtmlOptions' => array(
												'class' => 'col-sm-2',
											),
											'label'=>'Seleccione sub especifica',
											'hint' => '<b>Seleccione en caso de que aplique</b>',
											'widgetOptions' => array(

												'data' => array(),
												
												//'options'=>array($model->proyecto_id => array('selected'=>true)),
												'htmlOptions' => array('prompt' => 'Seleccionar partida subespecifica', 'id' => 'subespecifica'

												),
											),

										)
									);

									echo $form->dropDownListGroup($acciones , 'fuente',
										array(
											'wrapperHtmlOptions' => array(
												'class' => 'col-sm-2',
											),
											'label'=>'Fuente de financiamiento',
											'widgetOptions' => array(

												'data' => $fuentes,
												//'options'=>array($model->proyecto_id => array('selected'=>true)),
												'htmlOptions' => array('prompt' => 'Seleccionar la fuente de financiamiento'),
											)
										)
									); 


									echo $form->textFieldGroup($acciones,'monto',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span3','maxlength'=>20))));

								/*	$this->widget(
									    'booster.widgets.TbButton',
									    array('buttonType' => 'submit', 'label' => 'Seleccionar')
									); */
								 


						$this->widget('booster.widgets.TbButton', array(
			            	'buttonType'=>'submit',
			            	'context'=>'primary',
			            	'label'=>$acciones->isNewRecord ? 'Asignar dinero' : 'Agregar dinero',
			        	)); 



						$this->endWidget();
					unset($form);
			?>

		</div>