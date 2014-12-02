    <?php $this->beginWidget(
        'booster.widgets.TbModal',
        array('id' => 'myModal')
        ); 
    ?>
     
    <div class="modal-header">
        <a class="close" data-dismiss="modal">&times;</a>
        <h4>Agregar Producto(s)</h4>
    </div>
     
    <div class="modal-body">
        <p>
        <?php

            $this->widget(
            'booster.widgets.TbSelect2',
            array(
                'name' => 'group_id_list',
                'data' => array('RU' => 'Russian Federation', 'CA' => 'Canada', 'US' => 'United States of America', 'GB' => 'Great Britain', 'ED' => 'Edgar leal', 'Pr' => 'asdokaosd'),
                    'htmlOptions' => array(
                        'multiple' => 'multiple',
                        'id' => 'issue-574-checker-select'
                    ),
                )
            );
        ?>
        </p>
    </div>
     
    <div class="modal-footer">
        <?php $this->widget(
            'booster.widgets.TbButton',
            array(
                'context' => 'primary',
                'label' => 'Agregar',
                'url' => '#',
                'htmlOptions' => array('data-dismiss' => 'modal'),
            )
        ); ?>
        
        <?php $this->widget(
            'booster.widgets.TbButton',
                array(
                    'label' => 'Cerrar',
                    'url' => '#',
                    'htmlOptions' => array('data-dismiss' => 'modal'),
                )
            ); 
        ?>
    </div>
     
    <?php $this->endWidget(); ?>
    
    <?php $this->widget(
        'booster.widgets.TbButton',
            array(
                'label' => 'Agregar Producto(s)',
                'context' => 'primary',
                'htmlOptions' => array(
                    'data-toggle' => 'modal',
                    'data-target' => '#myModal',
                ),
            )
        );
    ?>