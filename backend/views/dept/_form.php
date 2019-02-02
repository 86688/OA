<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\Dept */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="dept-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'dept_id')->textInput() ?>

    <?= $form->field($model, 'dept_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'dept_level')->textInput() ?>

    <?= $form->field($model, 'dept_p_id')->textInput() ?>

    <?= $form->field($model, 'dept_status')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
