<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\ProjectSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = '项目';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="project-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('新建项目', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php  echo $this->render('_search', ['model' => $searchModel]); ?>


    <?= GridView::widget([
        'dataProvider' => $dataProvider,
//        'filterModel' => $searchModel,
        'columns' => [
//            ['class' => 'yii\grid\SerialColumn'],

//            'project_id',
            'project_name',
            'depe_id',
            'new_time',
            'update_time',
            //'confirm_time',
            //'exec_time',
            //'end_time',
            //'principal',
            //'assist',
            'city',
            //'address',
            //'budget',
            //'crt_id',
            //'self_id',
            //'client_id',
            //'project_remark',
            //'rating',
            'phase',
            'project_type',

            ['class' => 'yii\grid\ActionColumn',
                'template'=>'{view} {update} {delete}',
            ],
        ],
    ]); ?>
</div>
