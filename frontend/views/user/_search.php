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

    <!--    搜索框-->
    <?= $form->field($model, 'user_name')->textInput(['placeholder'=> '姓名','class'=>'input form-control','value'=>""])->label(false);?><div class="nbsp">&nbsp;&nbsp;&nbsp;</div>


    <div class="form-group">
        <?= Html::submitButton('搜索', ['class' => 'btn btn-primary']) ?>

    </div>

    <?php ActiveForm::end(); ?>

</div>
