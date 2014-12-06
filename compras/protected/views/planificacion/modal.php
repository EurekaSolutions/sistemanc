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
       /* $productos = array();
        foreach (Partidas::model()->findByAttributes(array('partida_id'=>18))->partidaProductos as $key => $partidaPro) {
            $producto = $partidaPro->producto;
            $productos = array_merge($productos,array($producto->producto_id=>$producto->nombre));
        }
        $lista_productos = $productos; // CHtml::listData(->productos, 'producto_id', 'nombre');*/
            $this->widget(
            'booster.widgets.TbSelect2',
            array(
                'name' => 'group_id_list',
                //'label' => 'Buscardor de producto',
                'data' => /*$lista_productos,*/ array('RU' => 'Russian Federation', 'CA' => 'Canada', 'US' => 'United States of America', 'GB' => 'Great Britain', 'ED' => 'Edgar leal', 'Pr' => 'asdokaosd'),
                    'htmlOptions' => array(
                        'multiple' => 'multiple',
                        'id' => 'issue-574-checker-select',
                        'Label' => 'Buscador',
                    ),
                )
            );
        ?>
        </p>

        <?php
                $this->widget(
    'booster.widgets.TbTabs',
    array(
    'type' => 'tabs', // 'tabs' or 'pills'
    'tabs' => array(
    array(
    'label' => 'Home',
    'content' => 'Home Content',
    'active' => true
    ),
    array('label' => 'Profile', 'content' => 'Profile Content'),
    array('label' => 'Messages', 'content' => 'Messages Content'),
    ),
    )
    );
        ?>

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


    