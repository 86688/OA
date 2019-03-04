<?php

/* @var $this yii\web\View */
use yii\helpers\Html;


$this->title = '后台管理系统';
?>

<div class="container">

    <div class="row jumbotron">
        <?= Html::a('人事', ['user/index'], ['class' => 'btn btn-lg btn-success col-md-4']) ?>
        <?= Html::a('项目', ['project/index'], ['class' => 'btn btn-lg btn-success col-md-4 col-md-offset-1']) ?>
        <br><br><br><br>
        <?= Html::a('财务', ['finance/index'], ['class' => 'btn btn-lg btn-success col-md-4']) ?>
        <?= Html::a('供应商', ['vendor/index'], ['class' => 'btn btn-lg btn-success col-md-4 col-md-offset-1']) ?>
        <br><br><br><br>
        <?= Html::a('客户', ['client/index'], ['class' => 'btn btn-lg btn-success col-md-4 ']) ?>

    </div>

</div>
