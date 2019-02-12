<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Dept */

//$this->title = 'Update Dept: {nameAttribute}';
$this->params['breadcrumbs'][] = ['label' => '部门', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->dept_name, 'url' => ['view', 'id' => $model->dept_id]];
$this->params['breadcrumbs'][] = '更新';
?>
<div class="dept-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
