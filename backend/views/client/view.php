<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\Client */

$this->title = $model->client_id;
$this->params['breadcrumbs'][] = ['label' => 'Clients', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="client-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->client_id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->client_id], [
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
            'client_id',
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
