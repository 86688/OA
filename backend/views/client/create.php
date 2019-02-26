<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\Client */

$this->title = '新增客户';
$this->params['breadcrumbs'][] = ['label' => '客户', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="client-create">


    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
