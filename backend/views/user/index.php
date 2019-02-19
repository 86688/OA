<?php

use yii\helpers\Html;
use yii\grid\GridView;


/* @var $this yii\web\View */
/* @var $searchModel common\models\UserSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = '人员';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="user-index table table-hover">
    <!--   标签  -->
    <p>
        <?= Html::a('新入人员', ['create'], ['class' => 'btn btn-success']) ?>
        <?= Html::a('请假调休', ['vacation/index'], ['class' => 'btn btn-success']) ?>
        <?= Html::a('部门管理', ['dept/index'], ['class' => 'btn btn-success']) ?>
        <?= Html::a('人事变动', ['user/index'], ['class' => 'btn btn-success']) ?>
    </p>

    <!--  搜索框  -->
    <form class="form-inline" action="User/search/">

        <div class="form-group dropdown">
            <input class="form-control"  placeholder="地点">
        </div>

        <div class="form-group">
            <input class="form-control"  placeholder="地点">
        </div>

        <div class="form-group">
            <input class="form-control"  placeholder="职务">
        </div>

        <div class="form-group">
            <input class="form-control"  placeholder="状态">
        </div>

        <div class="form-group">
            <input class="form-control"  placeholder="性别">
        </div>

        <button type="submit" class="btn btn-default">搜索</button>
        <p>
    </form>



    <?= GridView::widget([
    'dataProvider' => $dataProvider,
//    'filterModel' => $searchModel,
    'columns' => [
        'user_name',
        'sex',
        'tel',
        'email:email',

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
        [
            'attribute' => 'crt_start',
            'format' => ['date', 'php:Y-m-d']
        ],
        [
            'attribute' => 'crt_end',
            'format' => ['date', 'php:Y-m-d']
        ],
        'ctr_num',
        //动作按钮
        ['class' => 'yii\grid\ActionColumn',
            'template'=>'{view} {update} {delete} {resetpwd} {privilege}',
            'buttons'=>[
                //$url 是列为按钮创建的URL，
                //$model是当前要渲染的模型对象，
                //$key 是在数据提供者数组中模型的键
                'resetpwd'=>function($url,$model,$key)
                {
                    $options=[
                        'title'=>Yii::t('yii','重置密码'),
                        'aria-label'=>Yii::t('yii','重置密码'),
                        'data-pjax'=>'0',
                        'data-confirm' => Yii::t('yii', '确认重置吗?'),

                    ];
                    return Html::a('<span class="glyphicon glyphicon-lock"></span>',['user/resetpwd', 'id' => $key],$options);
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
