<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Vacation */

$this->title = '修改请假: {nameAttribute}';
$this->params['breadcrumbs'][] = ['label' => '请假', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->user, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = '修改';
?>
<div class="vacation-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
