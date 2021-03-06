<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;


/* @var $this yii\web\View */
/* @var $model common\models\Dept */

$this->title = '新建部门';
$this->params['breadcrumbs'][] = ['label' => '部门', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="dept-create">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'dept_name')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton('保存', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>