<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \common\models\LoginForm */

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;

$this->title = '登录';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="site-login">
    <!-- <h1><?= Html::encode($this->title) ?></h1> -->

    <!-- <p>请输入个人信息</p> -->

    <div class="row">
        <div class="col-lg-3">
            <?php $form = ActiveForm::begin(['id' => 'login-form'],['action'=>'site/login']); ?>
            <!--  public yii\widgets\ActiveField field($model, $attribute, $options = [])-->
            <?= $form->field($model, 'user_name')->textInput(['autofocus' => true]) ?>

                <?= $a=$form->field($model, 'password_hash')->passwordInput()?>

                <?= $form->field($model, 'rememberMe')->checkbox() ?>

                <div class="form-group">
                    <?= Html::submitButton('登录', ['class' => 'btn btn-primary', 'name' => 'login-button']) ?>
                </div>

            <?php ActiveForm::end(); ?>
        </div>
    </div>
</div>
