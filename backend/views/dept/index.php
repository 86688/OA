<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\DeptSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = '新建部门';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="dept-index">

<!--    --><?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('新建部门', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'dept_id',
            'dept_name',
//            'dept_level',
//            'dept_p_id',
            'dept_status',

            ['class' => 'yii\grid\ActionColumn'],
        ]
    ])
    ?>