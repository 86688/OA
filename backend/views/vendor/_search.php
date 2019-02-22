<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\VendorSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="vendor-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'vendor_id') ?>

    <?= $form->field($model, 'vendor_name') ?>

    <?= $form->field($model, 'vendor_type') ?>

    <?= $form->field($model, 'vendor_province') ?>

    <?= $form->field($model, 'vendor_city') ?>

    <?php // echo $form->field($model, 'vendor_linkman') ?>

    <?php // echo $form->field($model, 'vendor_linktel') ?>

    <?php // echo $form->field($model, 'vendor_email') ?>

    <?php // echo $form->field($model, 'coupon_rate') ?>

    <?php // echo $form->field($model, 'is_taxpayer') ?>

    <?php // echo $form->field($model, 'vendor_address') ?>

    <?php // echo $form->field($model, 'social_code') ?>

    <?php // echo $form->field($model, 'deposit_bank') ?>

    <?php // echo $form->field($model, 'bank_num') ?>

    <?php // echo $form->field($model, 'register_capital') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
