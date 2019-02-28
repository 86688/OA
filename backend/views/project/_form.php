<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use timepicker\DateTimePicker;

/* @var $this yii\web\View */
/* @var $model common\models\Project */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="project-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'project_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'depe_id')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'new_time')->widget(DateTimePicker::className(), [
        'template' => '{input}',
        'pickButtonIcon' => 'glyphicon glyphicon-time',
        'inline' => false,
        'clientOptions' => [
            'todayHighlight'=>true,
            'startView' => 2,
            'minView' => 2,
            'autoclose' => true,
            'linkFormat' => 'yyyy-mm-dd', // if inline = true
            'format' => 'yyyy-mm-dd', // if inline = false
        ]
    ]);?>
    <?= $form->field($model, 'update_time')->widget(DateTimePicker::className(), [
        'template' => '{input}',
        'pickButtonIcon' => 'glyphicon glyphicon-time',
        'inline' => false,
        'clientOptions' => [
            'todayHighlight'=>true,
            'startView' => 2,
            'minView' => 2,
            'autoclose' => true,
            'linkFormat' => 'yyyy-mm-dd', // if inline = true
            'format' => 'yyyy-mm-dd', // if inline = false
        ]
    ]);?>
    <?= $form->field($model, 'confirm_time')->widget(DateTimePicker::className(), [
        'template' => '{input}',
        'pickButtonIcon' => 'glyphicon glyphicon-time',
        'inline' => false,
        'clientOptions' => [
            'todayHighlight'=>true,
            'startView' => 2,
            'minView' => 2,
            'autoclose' => true,
            'linkFormat' => 'yyyy-mm-dd', // if inline = true
            'format' => 'yyyy-mm-dd', // if inline = false
        ]
    ]);?>
    <?= $form->field($model, 'exec_time')->widget(DateTimePicker::className(), [
        'template' => '{input}',
        'pickButtonIcon' => 'glyphicon glyphicon-time',
        'inline' => false,
        'clientOptions' => [
            'todayHighlight'=>true,
            'startView' => 2,
            'minView' => 2,
            'autoclose' => true,
            'linkFormat' => 'yyyy-mm-dd', // if inline = true
            'format' => 'yyyy-mm-dd', // if inline = false
        ]
    ]);?>
    <?= $form->field($model, 'end_time')->widget(DateTimePicker::className(), [
        'template' => '{input}',
        'pickButtonIcon' => 'glyphicon glyphicon-time',
        'inline' => false,
        'clientOptions' => [
            'todayHighlight'=>true,
            'startView' => 2,
            'minView' => 2,
            'autoclose' => true,
            'linkFormat' => 'yyyy-mm-dd', // if inline = true
            'format' => 'yyyy-mm-dd', // if inline = false
        ]
    ]);?>

    <?= $form->field($model, 'principal')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'assist')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'city')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'address')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'budget')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'crt_id')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'self_id')->textInput() ?>

    <?= $form->field($model, 'client_id')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'project_remark')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'rating')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'phase')->textInput() ?>

    <?= $form->field($model, 'project_type')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton('保存', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
