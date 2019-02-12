<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use common\models\User;



/* @var $this yii\web\View */
/* @var $model common\models\User */

$this->title = '新入人员';
$this->params['breadcrumbs'][] = ['label' => '人员', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="user-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'user_name')->textInput(['maxlength' => true]) ?>
    
    <?= $form->field($model, 'sex')->dropDownList(User::allSex(),['prompt'=>'请选择性别']); ?>

    <?= $form->field($model, 'tel')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'email')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'id_card')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'school')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'major')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'crt_start')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'crt_end')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'ctr_num')->textInput() ?>

    <?= $form->field($model, 'work_place')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'linkman')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'linktel')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'housing_fund')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'vacation')->textInput() ?>

    <?= $form->field($model, 'status_id')->dropDownList(User::allStatus(),['prompt'=>'请选择状态']); ?>

    <?= $form->field($model, 'dept_id')->textInput() ?>

    <?= $form->field($model, 'title_id')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
