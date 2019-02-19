<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use common\models\User;
use common\models\Dept;
use common\models\Title;
use common\models\Place;

/* @var $this yii\web\View */
/* @var $model common\models\UserSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="user-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'user_name')?>

    <?= $form->field($model, 'dept_id')->dropDownList(Dept::allDept(),['prompt'=>'请输入部门']) ?>

    <?= $form->field($model, 'sex')->dropDownList(User::allSex(),['prompt'=>'请选择性别']); ?>

    <?= $form->field($model, 'place_id')->dropDownList(Place::allPlace(),['prompt'=>'请输入地点'])?>

    <?= $form->field($model, 'status_id')->dropDownList(User::allStatus(),['prompt'=>'请输入状态']); ?>

    <?= $form->field($model, 'title_id')->dropDownList(Title::allTitle(),['prompt'=>'请输入职位  ']) ?>

    <div class="form-group">
        <?= Html::submitButton('搜索', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('重置', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
