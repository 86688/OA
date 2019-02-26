<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\ClientSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = '客户';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="client-index">

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('新建客户', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
//        'filterModel' => $searchModel,
        'columns' => [
//            ['class' => 'yii\grid\SerialColumn'],

//            'client_id',
            'client_cmy_name',
//            'client_dept',
//            'client_province',
//            'client_city',
            'client_site',
//            'client_linkman',
//            'client_man_title',
//            'client_linktel',
            //'client_email:email',
            'client_tax_num',
            //'client_bank',
            //'client_bank_num',
            //'client_capital',
            //'coupon_rate',
            //'is_taxpayer',
            //'client_remark',
            //'invoice_id',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
