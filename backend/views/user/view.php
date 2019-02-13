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

    <!-- <h1><?= Html::encode($this->title) ?></h1> -->

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
        'model' => $model,
        'attributes' => [
            'user_id',
            'user_name',
//            'password_hash',
            'sex',
            'tel',
            'email:email',
            'id_card',
            'school',
            'major',
//            'crt_start',
            [
               'attribute'=>'crt_start',
                'format'=>['date','php:Y-m-d'],
            ],
//            'crt_end',
            [
                'attribute'=>'crt_start',
                'format'=>['date','php:Y-m-d'],
            ],
            'ctr_num',
            'work_place',
            'linkman',
            'linktel',
            'housing_fund',
            'vacation',
//          'status_id',
            [
                'attribute'=>'status_id',
                'value'=>$model->StatusStr,
            ],
//            'dept_id',
            [
                'attribute'=>'dept_id',
//                'value'=>$model->,
            ],
            'title_id',
        ],
    ]) ?>

</div>
