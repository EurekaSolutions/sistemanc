        <script type="text/javascript">
            $( document ).ready(function() {
                //alert("ready!");
                $( "#Proyectos_nombreid" ).change(function() {
                    $('#general').html("");
                    $( "#general" ).append( '<option value="">Seleccionar partida general</option>' );

                    $('#partida').prop('selectedIndex',0);

                    $('#especifica').html("");
                    $( "#especifica" ).append( '<option value="">Seleccionar partida especifica</option>' );
                   
                });

                $( "#partida" ).change(function() {
                    $('#especifica').html("");
                    $( "#especifica" ).append( '<option value="">Seleccionar partida especifica</option>' );
                });
            });
        </script>

        <div>
            <h4 style="text-align: center;">AGREGAR PARTIDAS A PROYECTOS</h4><br>             
                    

               <?php 


                        foreach(Yii::app()->user->getFlashes() as $key => $message) {
                            echo '<div class="flash-' . $key . '">' . $message . "</div>\n";
                        }

                                $lista_proyectos = CHtml::listData($proyectos, 'codigo', 'nombre');

                                
                                $partidas_principal = CHtml::listData($partidas, function($partidas) {
                                                                return CHtml::encode($partidas->partida_id);
                                                            }, function($partidas) {
                                                                return CHtml::encode($partidas->p1.'-'. $partidas->nombre);
                                                            });

                                $fuentes = CHtml::listData($fuentes, 'fuente_financiamiento_id', 'nombre');

                                /** @var TbActiveForm $form */
                                $form = $this->beginWidget('booster.widgets.TbActiveForm',
                                    array(
                                        'id' => 'agregarcentralizada-form',
                                        'htmlOptions' => array('class' => 'well'), // for inset effect
                                    )
                                );

                                echo $form->errorSummary($model);

                                 echo $form->dropDownListGroup($model , 'nombreid',
                                        array(
                                            'wrapperHtmlOptions' => array(
                                                'class' => 'col-sm-2',
                                            ),
                                            'label'=>'Seleccione proyecto',
                                            'widgetOptions' => array(

                                                'data' => $lista_proyectos,
                                                //'options'=>array($model->proyecto_id => array('selected'=>true)),
                                                'htmlOptions' => array('prompt' => 'Seleccione proyecto'),
                                            )
                                        )
                                    ); 

                                // echo CHtml::dropDownList('partida','', array());

                                 
                                 echo $form->dropDownListGroup($model , 'partida',
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
                                                    'url'=>CController::createUrl('planificacion/buscargeneralproyecto'), //url to call.
                                                    //Style: CController::createUrl('currentController/methodToCall')
                                                    'update'=>'#general', //selector to update
                                                    //'data'=>'js:javascript statement' 
                                                    //leave out the data key to pass all form values through
                                              )),
                                            )
                                        )
                                    );

                                    echo $form->dropDownListGroup($model , 'general',
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
                                                    'url'=>CController::createUrl('planificacion/buscarespecficap'), //url to call.
                                                    //Style: CController::createUrl('currentController/methodToCall')
                                                    'update'=>'#especifica', //selector to update
                                                    //'data'=>'js:javascript statement' 
                                                    //leave out the data key to pass all form values through
                                              )

                                                ),
                                            ),

                                        )
                                    );

                                    echo $form->dropDownListGroup($model , 'especifica',
                                        array(
                                            'wrapperHtmlOptions' => array(
                                                'class' => 'col-sm-2',
                                            ),
                                            'label'=>'Seleccione especifica',
                                            'widgetOptions' => array(

                                                'data' => empty($especificas_todas)? array() : $especificas_todas,
                                                
                                                //'options'=>array($model->proyecto_id => array('selected'=>true)),
                                                'htmlOptions' => array('prompt' => 'Seleccionar partida especifica', 'id' => 'especifica' , 'ajax' => array(
                                                    'type'=>'POST', //request type
                                                    'url'=>CController::createUrl('planificacion/buscarsubespecficap'), //url to call.
                                                    //Style: CController::createUrl('currentController/methodToCall')
                                                    'update'=>'#subespecifica', //selector to update
                                                    //'data'=>'js:javascript statement' 
                                                    //leave out the data key to pass all form values through
                                              )

                                                ),
                                            ),

                                        )
                                    );


                                    echo $form->dropDownListGroup($model , 'subespecifica',
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


                                   echo $form->dropDownListGroup($model , 'fuente',
                                        array(
                                            'wrapperHtmlOptions' => array(
                                                'class' => 'col-sm-2',
                                            ),
                                            'label'=>'Fuente de financiamiento',
                                            'hint' => 'Seleccione la cantidad de fuentes que apliquen',
                                            'widgetOptions' => array(

                                                'data' => $fuentes,
                                                //'options'=>array($model->proyecto_id => array('selected'=>true)),
                                                'htmlOptions' => array(/*'prompt' => 'Seleccionar la fuente de financiamiento',*/ 'multiple' => true),
                                            )
                                        )
                                    ); 


                                    echo $form->textFieldGroup($model,'monto',array('widgetOptions'=>array('htmlOptions'=>array('class'=>'span3','maxlength'=>20))));

                                /*  $this->widget(
                                        'booster.widgets.TbButton',
                                        array('buttonType' => 'submit', 'label' => 'Seleccionar')
                                    ); */
                                 


                        $this->widget('booster.widgets.TbButton', array(
                            'buttonType'=>'submit',
                            'context'=>'primary',
                            'label'=>$model->isNewRecord ? 'Asignar dinero' : 'Agregar dinero',
                        )); 



                        $this->endWidget();
                    unset($form);
            ?>

        </div>