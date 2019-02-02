<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\DeptSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="dept-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'dept_id') ?>

    <?= $form->field($model, 'dept_name') ?>

    <?= $form->field($model, 'dept_level') ?>

    <?= $form->field($model, 'dept_p_id') ?>

    <?= $form->field($model, 'dept_status') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
