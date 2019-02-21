<?php

use yii\helpers\Html;
use yii\widgets\DetailView;


/* @var $this yii\web\View */
/* @var $model common\models\User */

$this->title = $model->user_name;
$this->params['breadcrumbs'][] = ['label' => '人员', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="user-view">

    <p>
        <?= Html::a('修改', ['update', 'id' => $model->user_id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('删除', ['delete', 'id' => $model->user_id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => "确定要删除{$model->user_name}吗？",
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        //此处的model属于的是user的模型！
        'model' => $model,
        'attributes' => [
            'user_id',
            'user_name',
            'sex',
            'tel',
            'email:email',
            'id_card',
            'school',
            'major',
            [
               'attribute'=>'crt_start',
                'format'=>['date','php:Y-m-d'],
            ],
            [
                'attribute'=>'crt_start',
                'format'=>['date','php:Y-m-d'],
            ],
            'ctr_num',
            'linkman',
            'linktel',
            'housing_fund',
            'vacation',
            [
                'attribute'=>'status_id',
                'value'=>$model->status->status_name,
            ],
            [
                'attribute'=>'dept_id',
                // $model执行dept方法然后进行取出dept_name字段
                'value'=>$model->dept->dept_name,
            ],
            [
                'attribute'=>'title_id',
                'value'=>$model->title->title_name,
            ],
            //工作地点
            [
                'attribute'=>'place_id',
                'value'=>$model->place->place,
            ],
            'file',
            'show',
        ],
    ]) ?>

</div>
