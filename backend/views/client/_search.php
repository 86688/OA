<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\ClientSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="client-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'client_id') ?>

    <?= $form->field($model, 'client_cmy_name') ?>

    <?= $form->field($model, 'client_dept') ?>

    <?= $form->field($model, 'client_province') ?>

    <?= $form->field($model, 'client_city') ?>

    <?php // echo $form->field($model, 'client_site') ?>

    <?php // echo $form->field($model, 'client_linkman') ?>

    <?php // echo $form->field($model, 'client_man_title') ?>

    <?php // echo $form->field($model, 'client_linktel') ?>

    <?php // echo $form->field($model, 'client_email') ?>

    <?php // echo $form->field($model, 'client_tax_num') ?>

    <?php // echo $form->field($model, 'client_bank') ?>

    <?php // echo $form->field($model, 'client_bank_num') ?>

    <?php // echo $form->field($model, 'client_capital') ?>

    <?php // echo $form->field($model, 'coupon_rate') ?>

    <?php // echo $form->field($model, 'is_taxpayer') ?>

    <?php // echo $form->field($model, 'client_remark') ?>

    <?php // echo $form->field($model, 'invoice_id') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
