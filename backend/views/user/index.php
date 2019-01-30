<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\UserSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Users';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="user-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create User', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'user_id',
            'user_name',
            'password_hash',
            'sex',
            'tel',
            //'email:email',
            //'id_card',
            //'school',
            //'major',
            //'crt_start',
            //'crt_end',
            //'ctr_num',
            //'work_place',
            //'linkman',
            //'linktel',
            //'housing_fund',
            //'vacation',
            //'status_id',
            //'dept_id',
            //'title_id',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
