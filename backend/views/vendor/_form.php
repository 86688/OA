<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\Vendor */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="vendor-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'vendor_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'vendor_type')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'vendor_province')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'vendor_city')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'vendor_linkman')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'vendor_linktel')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'vendor_email')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'coupon_rate')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'is_taxpayer')->textInput() ?>

    <?= $form->field($model, 'vendor_address')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'social_code')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'deposit_bank')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'bank_num')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'register_capital')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton('保存', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
