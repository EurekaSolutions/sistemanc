		<div>
			<h4 style="text-align: center;">AGREGAR ACCIONES CENTRALIZADAS</h4><br>				
				   <?php 

				    			$lista_acciones = CHtml::listData($accionestodas, 'accion_id', 'nombre');
	
								/** @var TbActiveForm $form */
								$form = $this->beginWidget('booster.widgets.TbActiveForm',
								    array(
								        'id' => 'agregarcentralizada-form',
								        'htmlOptions' => array('class' => 'well'), // for inset effect
								    )
								);

								 echo $form->dropDownListGroup($acciones ,	'nombre',
										array(
											'wrapperHtmlOptions' => array(
												'class' => 'col-sm-2',
											),
											'label'=>'Seleccione Acción Centralizada a cargar',
											'widgetOptions' => array(

												'data' => $lista_acciones,
												//'options'=>array($model->proyecto_id => array('selected'=>true)),
												'htmlOptions' => array(/*'prompt' => 'Seleccionar proyecto',*/'multiple' => false, ),
											)
										)
									); 

								/*	$this->widget(
									    'booster.widgets.TbButton',
									    array('buttonType' => 'submit', 'label' => 'Seleccionar')
									); */
								 
							?>


			<div class="well">
                <label>
                    Seleccione la Partida
                <select class="form-control">
                  <option value="">Partidas</option>
                  <option value="corpovex">401 GASTOS DE PERSONAL</option>
                  <option>402 MATERIALES Y SUMINISTRO</option>
                  <option>403 GASTOS NO PERSONALES</option>
                  <option>404 BIENES</option>
                </select>
                </label>
            </div>


            <div class="well">
                <label>
                    Seleccione la partida general
                    <select class="form-control">
                      <option value="">Generales</option>
                      <option value="corpovex">401.07.00.00</option>
                    </select>
                </label>
            </div>
			
			<div class="well">
				<label>
					Dinero asignado
					<input type="email" class="form-control" id="exampleInputEmail1" placeholder="Dinero asignado">
				</label>
			</div>


			<?php

			$this->widget('booster.widgets.TbButton', array(
            	'buttonType'=>'submit',
            	'context'=>'primary',
            	'label'=>$model->isNewRecord ? 'Asignar dinero' : 'Agregar dinero',
        	)); 



			$this->endWidget();
								unset($form);
			?>

		</div>