<?php echo "<script type='text/javascript' src='./jquery-3.1.1.min.js'>alert('js代码');</script>";?>

<?php
//$a="<script type='text/javascript'>alert('js代码');</script>";
//echo $a;
?>


<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use common\models\Dept;
use timepicker\DateTimePicker;
use common\models\Project;

$this->title = '新建项目';
$this->params['breadcrumbs'][] = ['label' => '项目', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>




<div class="project-form">

    <?php $form = ActiveForm::begin(); ?>

    <div>
        <p class="control-label">地点</p>
        <select class="form-control" id="province"><option  value="0">-请选择-</option></select>
        <br>
        <select class="form-control" id="city" ><option value="0">-请选择-</option></select>
        <br>
        <select class="form-control" id="area"><option  value="0">-请选择-</option></select>
    </div>

    <?= $form->field($model, 'project_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'dept_id')->dropDownList(Dept::allDept(),['prompt'=>'请输入部门']) ?>


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

    <?= $form->field($model, 'phase')->dropDownList(Project::allPhase(),['prompt'=>'请选择阶段']); ?>

    <?= $form->field($model, 'project_type')->dropDownList(Project::allType(),['prompt'=>'请选择类型']); ?>

    <div class="form-group">
        <?= Html::submitButton('保存', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>



