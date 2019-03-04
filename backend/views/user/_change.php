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
        'action' => ['change'],
        'method' => 'get',
    ]); ?>

    <!--搜索框-->
    <?= $form->field($model, 'user_name')->textInput(['placeholder'=> '姓名','class'=>'input form-control','value'=>""])->label(false);?><div class="nbsp">&nbsp;&nbsp;&nbsp;</div>

    <?= $form->field($model, 'dept_id')->dropDownList(Dept::allDept(),['prompt'=>'部门','class'=>'input form-control'])->label(false);?><div class="nbsp">&nbsp;&nbsp;&nbsp;</div>

    <?= $form->field($model, 'place_id')->dropDownList(Place::allPlace(),['prompt'=>'地点','class'=>'input form-control'])->label(false);?><div class="nbsp">&nbsp;&nbsp;&nbsp;</div>

    <?= $form->field($model, 'status_id')->dropDownList(User::allStatus(),['prompt'=>'状态','class'=>'input form-control'])->label(false);?><div class="nbsp">&nbsp;&nbsp;&nbsp;</div>

    <?= $form->field($model, 'title_id')->dropDownList(Title::allTitle(),['prompt'=>'职位','class'=>'input form-control'])->label(false);?><div class="nbsp">&nbsp;&nbsp;&nbsp;</div>

    <div class="form-group">
        <?= Html::submitButton('搜索', ['class' => 'btn btn-primary']) ?>

    </div>

    <?php ActiveForm::end(); ?>

</div>
