<?php

use yii\helpers\Html;
use yii\grid\GridView;
use common\models\Status;
use common\models\Dept;

$this->title = '人员';
$this->params['breadcrumbs'][] = $this->title;
?>


<div class="user-index">

    <p>
        <?= Html::a('请假调休', ['vacation/create'], ['class' => 'btn btn-success']) ?>
        <?php if(Yii::$app->user->can('backend', [], true)){
            echo Html::a('新入人员', ['user/create'], ['class' => 'btn btn-success']);
            echo '&nbsp';
            echo Html::a('部门管理', ['dept/index'], ['class' => 'btn btn-success']);
            echo '&nbsp';
            echo Html::a('人事变动', ['user/change'], ['class' => 'btn btn-success']);
        }
        ?>
    </p>

    <?php  echo $this->render('_change', ['model' => $searchModel]); ?>

    <!-- 以下为用户的列表   -->
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        //'filterModel' => $searchModel,
        'columns' => [
            'user_name',
            'in_time',
            'out_time',
            'salary',
            'sal_time',

            ['attribute'=>'status_id',
                'label'=>'状态',
                'value'=>'status.status_name',
                'filter'=>Status::find()
                    ->select(['status_name'])
                    ->orderBy('status_id')
                    ->column(),
            ],

            ['attribute'=>'dept_id',
                'label'=>'部门',
                'value'=>'dept.dept_name',
                'filter'=>Dept::find()
                    ->select(['dept_name'])
                    ->orderBy('dept_id')
                    ->column(),
            ],
            'mark',
            //动作按钮
            ['class' => 'yii\grid\ActionColumn',
                'template'=>'{view} {update} {delete}',
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


