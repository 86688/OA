<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\Dept */

$this->title = '新建部门';
$this->params['breadcrumbs'][] = ['label' => '部门', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="dept-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</  