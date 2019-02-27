<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\ProjectSearch */
/* @var $form yii\widgets\ActiveForm */
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

<div class="project-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'project_name')->textInput(['placeholder'=> '项目名字','class'=>'input form-control','value'=>""])->label(false);?><div class="nbsp">&nbsp;&nbsp;&nbsp;</div>

    <?= $form->field($model, 'principal')->textInput(['placeholder'=> '负责人','class'=>'input form-control','value'=>""])->label(false);?><div class="nbsp">&nbsp;&nbsp;&nbsp;</div>

    <div class="form-group">
        <?= Html::submitButton('搜索', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('重置', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
