<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\Vendor */

$this->title = '新增供应商';
$this->params['breadcrumbs'][] = ['label' => '供应商', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="vendor-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
