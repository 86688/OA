<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\Area */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="area-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'area_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'area_code')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'area_short')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'area_is_hot')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'area_sequence')->textInput() ?>

    <?= $form->field($model, 'area_parent_id')->textInput() ?>

    <?= $form->field($model, 'init_date')->textInput() ?>

    <?= $form->field($model, 'init_addr')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
