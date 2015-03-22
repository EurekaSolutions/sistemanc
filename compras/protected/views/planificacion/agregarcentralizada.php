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

                                   echo $form->select2Group($acciones, 'partida',
                                                        array(
                                                            'wrapperHtmlOptions' => array(
                                                                'class' => 'col-sm-5',
                                                            ),
                                                            'label'=>'Seleccione la partida',
                                                            'widgetOptions' => array(
                                                                'asDropDownList' => true,
                                                                'data' => empty($partidas_principal)? array() : $partidas_principal,
                                                                'htmlOptions'=>array('id'=>'partida', 'ajax' => array(
																		'type'=>'POST', //request type
																		'url'=>CController::createUrl('planificacion/buscargeneral'), //url to call.
																		//Style: CController::createUrl('currentController/methodToCall')
																		'update'=>'#general', //selector to update
																		//'data'=>'js:javascript statement' 
																		//leave out the data key to pass all form values through
																  )),
                                                                'options' => array(
                                                                    //'tags' => array('clever', 'is', 'better', 'clevertech'),
                                                                    'placeholder' => 'Seleccionar partida',
                                                                    // 'width' => '40%', 
                                                                    'tokenSeparators' => array(',', ' ')
                                                                )
                                                            )
                                                        )
                                                    );
						 
                                   echo $form->select2Group($acciones, 'general',
                                                        array(
                                                            'wrapperHtmlOptions' => array(
                                                                'class' => 'col-sm-5',
                                                            ),
                                                            'label'=>'Seleccione general',
                                                            'widgetOptions' => array(
                                                                'asDropDownList' => true,
                                                                'data' => empty($generales_todas)? array() : $generales_todas,
                                                                'htmlOptions'=>array('id'=>'general','ajax' => array(
																			'type'=>'POST', //request type
																			'url'=>CController::createUrl('planificacion/buscarespecfica'), //url to call.
																			//Style: CController::createUrl('currentController/methodToCall')
																			'update'=>'#especifica', //selector to update
																			//'data'=>'js:javascript statement' 
																			//leave out the data key to pass all form values through
																	  	)),
                                                                'options' => array(
                                                                    //'tags' => array('clever', 'is', 'better', 'clevertech'),
                                                                    'placeholder' => 'Seleccionar partida general',
                                                                    // 'width' => '40%', 
                                                                    'tokenSeparators' => array(',', ' ')
                                                                )
                                                            )
                                                        )
                                                    );



                                    echo $form->select2Group($acciones, 'especifica',
                                                        array(
                                                            'wrapperHtmlOptions' => array(
                                                                'class' => 'col-sm-5',
                                                            ),
                                                            'label'=>'Seleccione especifica',
                                                            'widgetOptions' => array(
                                                                'asDropDownList' => true,
                                                                'data' => empty($especificas_todas)? array() : $especificas_todas,
                                                                'htmlOptions'=>array('id'=>'especifica','ajax' => array(
																		'type'=>'POST', //request type
																		'url'=>CController::createUrl('planificacion/buscarsubespecfica'), //url to call.
																		//Style: CController::createUrl('currentController/methodToCall')
																		'update'=>'#subespecifica', //selector to update
																		//'data'=>'js:javascript statement' 
																		//leave out the data key to pass all form values through
																  )),
                                                                'options' => array(
                                                                    //'tags' => array('clever', 'is', 'better', 'clevertech'),
                                                                    'placeholder' => 'Seleccionar partida especifica',
                                                                    // 'width' => '40%', 
                                                                    'tokenSeparators' => array(',', ' ')
                                                                )
                                                            )
                                                        )
                                                    );


                                    echo $form->select2Group($acciones, 'subespecifica',
                                                        array(
                                                            'wrapperHtmlOptions' => array(
                                                                'class' => 'col-sm-5',
                                                            ),
                                                            'label'=>'Seleccione sub especifica',
                                                            'hint' => '<b>Seleccione en caso de que aplique</b>',
                                                            'widgetOptions' => array(
                                                                'asDropDownList' => true,
                                                                'data' => array(),
                                                                'htmlOptions'=>array('id' => 'subespecifica'),
                                                                'options' => array(
                                                                    //'tags' => array('clever', 'is', 'better', 'clevertech'),
                                                                    'placeholder' => 'Seleccionar partida subespecifica',
                                                                    // 'width' => '40%', 
                                                                    'tokenSeparators' => array(',', ' ')
                                                                )
                                                            )
                                                        )
                                                    );

?>

   <a id="add" style="cursor:pointer">Agregar fuente</a>
  <table id="mytable" width="300" border="1" cellspacing="0" cellpadding="2">
  <tbody>
    <?php 
       /* echo "Fuentes";
        print_r($fuentesSel);
        Yii::app()->end();*/

      $cantidad = count($fuentesSel);
    foreach ($fuentesSel as $key => $value) 
    { ?>
    <tr id='producto<?php echo $key; ?>' class="producto">
    <td>
        <?php echo $form->dropDownListGroup($value, 'fuente_id',
                                        array(
                                            'wrapperHtmlOptions' => array(
                                                'class' => 'col-sm-2',
                                            ),
                                            'label'=>'Fuente de financiamiento',
                                            //'hint' => 'Seleccione la cantidad de fuentes que apliquen',
                                            'widgetOptions' => array(

                                                'data' => $fuentes,
                                                //'options'=>array($model->proyecto_id => array('selected'=>true)),
                                                'htmlOptions' => array(//'prompt' => 'Seleccionar la fuente de financiamiento',
                                                            'multiple' => false,
                                                            'name'=>'f[fuente_id][]',
                                                            'id' => 'fuente'.$key,
                                                            ),
                                            )
                                        )
                                    );

        //echo CHtml::dropDownList('fuente', $select, $fuentes,array('empty' => 'Seleccione fuente de financiamiento'));
        ?>
        	
    </td>
    <td>
        <?php
                     echo $form->textFieldGroup($value,'monto',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span3','maxlength'=>20, 'name' => 'f[monto][]', 'id' => 'monto'.$key))));
                                       //echo CHtml::textField('monto', 'some value');
                                        ?>
    </td>
    <script type="text/javascript">
    $(document).ready(function() {
        		$("#delete<?php echo $key; ?>").click(function(event) {
            //alert('#mytable tbody>tr #'+$('#'+event.target.id).parent().parent().attr('id'));
            if($('#mytable tr').length >1)
                                {   
                $('#mytable tbody>tr#'+$('#'+event.target.id).parent().parent().attr('id')).remove();
                  return false;
                  }
        });

       });

        	</script>


      <td><a  id='delete<?php echo $key ?>' style="cursor:pointer">Eliminar fuente</a></td>
    </tr>
    <?php
        }
    ?>
    </tbody>
  </table> 
                                    
<?php
		$this->widget('booster.widgets.TbButton', array(
			            	'buttonType'=>'submit',
			            	'context'=>'primary',
			            	'label'=>$acciones->isNewRecord ? 'Agregar Accion Centralizada' : 'Agregar Accion Centralizada',
			        	)); 
						$this->endWidget();
					unset($form);
			?>

		</div>
<script type="text/javascript">
    $(document).ready(function() {
        var numId = <?php echo $cantidad; ?>;
        $("#add").click(function() {
                $clone = $("#mytable tbody>tr:last").clone(true);
                $('#mytable tbody>tr:last').clone(true).attr("id",$clone.attr("id").replace(/\d+$/, function(str) { return parseInt(str) + 1; } )).insertAfter("#mytable tbody>tr:last");
                        numId++;
                        //alert(numId);
                        //$('#mytable tbody>tr:last').attr('id','producto'+numId);
                        $('#mytable tbody>tr:last>td>a').attr('id','delete'+numId);
        
                            $("#delete"+numId).click(function(event) {
                                //alert('#mytable tbody>tr #'+$('#'+event.target.id).parent().parent().attr('id'));
                                if($('#mytable tr').length >1)
                                {   
                                    $('#mytable tbody>tr#'+$('#'+event.target.id).parent().parent().attr('id')).remove();
                                }
                                      return false;
                            });
          return false;
        });

      
    });
</script>