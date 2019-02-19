<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use common\models\User;
use common\models\Dept;
use common\models\Title;
use common\models\Place;


/* @var $this yii\web\View */
/* @var $model common\models\User */
$this->title = "修改:$model->user_name";
$this->params['breadcrumbs'][] = ['label' => '人员', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->user_name, 'url' => ['view', 'id' => $model->user_id]];
$this->params['breadcrumbs'][] = '修改';
?>
<div class="user-update">


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


        <?= $form->field($model, 'linkman')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'linktel')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'housing_fund')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'vacation')->textInput() ?>

        <?= $form->field($model, 'place_id')->dropDownList(Place::allPlace(),['prompt'=>'请输入地点']) ?>

        <?= $form->field($model, 'status_id')->dropDownList(User::allStatus(),['prompt'=>'请输入状态']); ?>

        <?= $form->field($model, 'dept_id')->dropDownList(Dept::allDept(),['prompt'=>'请输入部门']) ?>

        <?= $form->field($model, 'title_id')->dropDownList(Title::allTitle(),['prompt'=>'请输入职称']) ?>

        <div class="form-group">
            <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
        </div>

        <?php ActiveForm::end(); ?>

    </div>

</div>
