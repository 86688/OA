<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\Vacation */

$this->title = '新建请假';
$this->params['breadcrumbs'][] = ['label' => '请假', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="vacation-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
