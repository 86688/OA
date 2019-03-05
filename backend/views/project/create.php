<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use common\models\User;
use common\models\Dept;
use common\models\Title;
use common\models\Place;
use timepicker\DateTimePicker;
use common\models\Project;
use common\models\Area;

/* @var $this yii\web\View */
/* @var $model common\models\Project */

$this->title = '新建项目';
$this->params['breadcrumbs'][] = ['label' => '项目', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="project-form">

    <?php $form = ActiveForm::begin(); ?>

    <div>
        <p class="control-label">地点</p>
        <select class="form-control" id="province" onchange="showcity()"><option  value="0">-省份-</option></select>
        <select class="form-control" id="city" onchange="showdistrict()"><option value="0">-城市-</option></select>
        <select class="form-control" id="district"><option  value="0">-地点-</option></select>
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

    <?= $form->field($model, 'project_type')->checkboxList(Project::allType(),['prompt'=>'请选择类型']); ?>

<!--    --><?//=
//    $url=\yii\helpers\Url::toRoute(['get-region']);
//
//    echo $form->field($model, 'province')->widget(\region\Region::className(),[
//        'model'=>$model,
//        'url'=>$url,
//        'province'=>[
//            'attribute'=>'province',
//            'items'=>Area::getRegion(),
//            'options'=>['class'=>'form-control form-control-inline','prompt'=>'选择省份']
//        ],
//        'city'=>[
//            'attribute'=>'city',
//            'items'=>Area::getRegion($model['province']),
//            'options'=>['class'=>'form-control form-control-inline','prompt'=>'选择城市']
//        ],
//        'district'=>[
//            'attribute'=>'district',
//            'items'=>Area::getRegion($model['city']),
//            'options'=>['class'=>'form-control form-control-inline','prompt'=>'选择县/区']
//        ]
//    ]);
//    ?>


    <div class="form-group">
        <?= Html::submitButton('保存', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
