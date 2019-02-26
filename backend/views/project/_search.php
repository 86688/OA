<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\ProjectSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="project-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'project_id') ?>

    <?= $form->field($model, 'project_name') ?>

    <?= $form->field($model, 'depe_id') ?>

    <?= $form->field($model, 'new_time') ?>

    <?= $form->field($model, 'update_time') ?>

    <?php // echo $form->field($model, 'confirm_time') ?>

    <?php // echo $form->field($model, 'exec_time') ?>

    <?php // echo $form->field($model, 'end_time') ?>

    <?php // echo $form->field($model, 'principal') ?>

    <?php // echo $form->field($model, 'assist') ?>

    <?php // echo $form->field($model, 'city') ?>

    <?php // echo $form->field($model, 'address') ?>

    <?php // echo $form->field($model, 'budget') ?>

    <?php // echo $form->field($model, 'crt_id') ?>

    <?php // echo $form->field($model, 'self_id') ?>

    <?php // echo $form->field($model, 'client_id') ?>

    <?php // echo $form->field($model, 'project_remark') ?>

    <?php // echo $form->field($model, 'rating') ?>

    <?php // echo $form->field($model, 'phase') ?>

    <?php // echo $form->field($model, 'project_type') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
