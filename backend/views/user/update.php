<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\User */
$this->title = "修改:$model->user_name";
$this->params['breadcrumbs'][] = ['label' => '人员', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->user_name, 'url' => ['view', 'id' => $model->user_id]];
$this->params['breadcrumbs'][] = '修改';
?>
<div class="user-update">


    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
