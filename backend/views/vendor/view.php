<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\Vendor */

$this->title = $model->vendor_id;
$this->params['breadcrumbs'][] = ['label' => '供应商', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="vendor-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('修改', ['update', 'id' => $model->vendor_id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('删除', ['delete', 'id' => $model->vendor_id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => '确认删除吗',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
//            'vendor_id',
            'vendor_name',
            'vendor_type',
            'vendor_province',
            'vendor_city',
            'vendor_linkman',
            'vendor_linktel',
            'vendor_email:email',
            'coupon_rate',
            'is_taxpayer',
            'vendor_address',
            'social_code',
            'deposit_bank',
            'bank_num',
            'register_capital',
        ],
    ]) ?>

</div>
