<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\VendorSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = '供应商';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="vendor-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('新建供应商', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'vendor_id',
            'vendor_name',
            'vendor_type',
            'vendor_province',
            'vendor_city',
            'vendor_linkman',
//            'vendor_linktel',
//            'vendor_email:email',
//            'coupon_rate',
//            'is_taxpayer',
//            'vendor_address',
//            'social_code',
//            'deposit_bank',
//            'bank_num',
//            'register_capital',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
