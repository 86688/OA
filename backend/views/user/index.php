<?php

use yii\helpers\Html;
use yii\grid\GridView;
use common\models\Dept;
use common\models\Title;


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
        <?= Html::a('部门管理', ['dept/index'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [

            'user_name',
            'sex',
            'tel',
            'email:email',
            'school',
            'work_place',

            ['attribute'=>'status_id',
                'label'=>'状态',
                'value'=>'status.status_name',
            ],
            ['attribute'=>'dept_id',
                'label'=>'部门',
                'value'=>'dept.dept_name',
            ],
            ['attribute'=>'title_id',
                'label'=>'状态',
                'value'=>'title.title_name',
            ],
            'vacation',

            ['class' => 'yii\grid\ActionColumn',
                'template'=>'{view} {update} {delete} {resetpwd} {privilege}',

                'buttons'=>[

                    'resetpwd'=>function($url,$model,$key)
                    {
                        $options=[
                            'title'=>Yii::t('yii','重置密码'),
                            'aria-label'=>Yii::t('yii','重置密码'),
                            'data-pjax'=>'0',
                        ];
                        return Html::a('<span class="glyphicon glyphicon-lock"></span>',$url,$options);
                    },

                    'privilege'=>function($url,$model,$key)
                    {
                        $options=[
                            'title'=>Yii::t('yii','权限'),
                            'aria-label'=>Yii::t('yii','权限'),
                            'data-pjax'=>'0',
                        ];
                        return Html::a('<span class="glyphicon glyphicon-user"></span>',$url,$options);
                    },

                ],
        ],
            ],
    ]); ?>
</div>
