<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\Client */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="client-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'client_id')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'client_cmy_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'client_dept')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'client_province')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'client_city')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'client_site')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'client_linkman')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'client_man_title')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'client_linktel')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'client_email')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'client_tax_num')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'client_bank')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'client_bank_num')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'client_capital')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'coupon_rate')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'is_taxpayer')->textInput() ?>

    <?= $form->field($model, 'client_remark')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'invoice_id')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton('保存', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
