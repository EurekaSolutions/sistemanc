<style>
tr.principaltr td {
    /*border: 1px solid black;*/
    text-align:center; 
    vertical-align:middle;
}

tr.principaltr th {
    /*border: 1px solid black;*/
    text-align:center; 
    vertical-align:middle;
}
</style>

<h4 style="text-align: center;">ENTES HIJOS</h4><br>

		<?php 
$dataProvider=new CActiveDataProvider('EntesOrganos', array(
            'data'=>$model,
    ));/*new CArrayDataProvider($model, array(
    'id'=>'ente_organo_id',
    'keyField'=>'ente_organo_id',
    'sort'=>array(
        'attributes'=>array(
             'ente_organo_id', 'nombre', 'codigo_onapre', 'rif',
        ),
    ),
    'pagination'=>array(
        'pageSize'=>10,
    ),
));*/
				$this->widget('booster.widgets.TbGridView',array(
				'id'=>'entes-organos-grid',
				'dataProvider'=> $dataProvider,
				//'filter'=>new EntesOrganos,

				'columns'=>array(
						//'ente_organo_id',
						'nombre',
						'codigo_onapre',						
						//'tipo',
						'rif',
						//array('name'=>'Tiene Usuario','value'=>'$data->tieneusuario($value->enteOrgano->ente_organo_id)?"SI":"NO"'),

					array(
					'class'=>'booster.widgets.TbButtonColumn',
					'template'=>'{update}',
						 'buttons'=>array
						(
						    'update' => array
						    (
						          'url'=>'Yii::app()->createUrl("entesOrganos/actualizarMiEnte", array("id"=>$data->ente_organo_id))',
						    ),
				
						),
					),
				),
				)); 
		?>