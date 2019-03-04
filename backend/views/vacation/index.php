<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\VacationSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = '请假';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="vacation-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('新建请假', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
//            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'user',
            'start',
            'end',
            'count',
            //'statusone',
            //'statustwo',
            //'statusthr',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
