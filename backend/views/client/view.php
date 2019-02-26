<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\Client */

$this->title = $model->client_cmy_name;
$this->params['breadcrumbs'][] = ['label' => '客户', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="client-view">


    <p>
        <?= Html::a('修改', ['update', 'id' => $model->client_id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('删除', ['delete', 'id' => $model->client_id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
//            'client_id',
            'client_cmy_name',
            'client_dept',
            'client_province',
            'client_city',
            'client_site',
            'client_linkman',
            'client_man_title',
            'client_linktel',
            'client_email:email',
            'client_tax_num',
            'client_bank',
            'client_bank_num',
            'client_capital',
            'coupon_rate',
            'is_taxpayer',
            'client_remark',
            'invoice_id',
        ],
    ]) ?>

</div>
