<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\Dept */

$this->title = $model->dept_name;
$this->params['breadcrumbs'][] = ['label' => '部门', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="dept-view">


    <p>
        <?= Html::a('更新', ['update', 'id' => $model->dept_id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('删除', ['delete', 'id' => $model->dept_id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => '确定删除吗？',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
//      从控制器返回过来的数据 $model
        'model' => $model,
        'attributes' => [
            'dept_id',
            'dept_name',
            'dept_level',
            'dept_p_id',
            'dept_status',
        ],
    ]) ?>

</div>
