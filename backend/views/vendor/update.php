<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Vendor */

$this->title = '修改供应商';
$this->params['breadcrumbs'][] = ['label' => '供应商', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->vendor_name, 'url' => ['view', 'id' => $model->vendor_id]];
$this->params['breadcrumbs'][] = '修改';
?>
<div class="vendor-update">


    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
