<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\UserSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = '人员';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="user-index">

    <!-- <h1><?= Html::encode($this->title) ?></h1> -->
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('新入人员', ['create'], ['class' => 'btn btn-success']) ?>
        <?= Html::a('部门管理', ['dept/create'], ['class' => 'btn btn-success']) ?>

    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
//             ['class' => 'yii\grid\SerialColumn'],

            // 'user_id',
            'user_name',
            // 'password_hash',
            'sex',
            'tel',
            'email:email',
            // 'id_card',
            'school',
            //'major',
            // 'crt_start',
            // 'crt_end',
            //'ctr_num',
            'work_place',
            //'linkman',
            //'linktel',
            //'housing_fund',
            'vacation',
            'status_id',
            'dept_id',
            'title_id',

//            ['class' => 'yii\grid\ActionColumn'
//                'template'=>'{view}{update}{resetpwd}{privilege}',
//                'buttons'=>[
//                    'resetpwd'=>function($url,$model,$key)
//                    {
//                        $options=[
//                                'title'=>Yii::t('yii','重置密码'),
//                                'aria-label'=>Yii::t('yii','重置密码'),
//                                'data-pjax'=>'0',
//                                ];
//                        return Html::a()
//                        ]
//                    }
//                ]
//
//            ],
        ],
    ]); ?>
</div>
