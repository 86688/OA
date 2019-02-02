<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\Dept */

$this->title = $model->dept_id;
$this->params['breadcrumbs'][] = ['label' => 'Depts', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="dept-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->dept_id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->dept_id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
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
