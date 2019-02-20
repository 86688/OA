<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use common\models\User;
use common\models\Dept;
use common\models\Title;
use common\models\Place;
?>

<style>
    .input{
        width:110px;
        float:left;
    }
    .nbsp{
        float:left;
    }
</style>

<div class="user-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'user_name')->textInput(['placeholder'=> '姓名','class'=>'input form-control'])->label(false);?>
    <div class="nbsp">&nbsp;&nbsp;</div>
    <?= $form->field($model, 'dept_id')->dropDownList(Dept::allDept(),['prompt'=>'请输入部门','class'=>'input form-control'])->label(false);?>
    <div class="nbsp">&nbsp;&nbsp;</div>
    <?= $form->field($model, 'sex')->dropDownList(User::allSex(),['prompt'=>'请选择性别','class'=>'input form-control'])->label(false);?>
    <div class="nbsp">&nbsp;&nbsp;</div>
    <?= $form->field($model, 'place_id')->dropDownList(Place::allPlace(),['prompt'=>'请输入地点','class'=>'input form-control'])->label(false);?>
    <div class="nbsp">&nbsp;&nbsp;</div>
    <?= $form->field($model, 'status_id')->dropDownList(User::allStatus(),['prompt'=>'请输入状态','class'=>'input form-control'])->label(false);?>
    <div class="nbsp">&nbsp;&nbsp;</div>
    <?= $form->field($model, 'title_id')->dropDownList(Title::allTitle(),['prompt'=>'请输入职位','class'=>'input form-control'])->label(false);?>
    <div class="nbsp">&nbsp;&nbsp;</div>
    <div class="nbsp">&nbsp;&nbsp;</div>
    <div class="form-group">
        <?= Html::submitButton('搜索', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('重置', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
