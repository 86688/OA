<?php

use yii\helpers\Html;
use yii\grid\GridView;
use common\models\Status;
use common\models\Dept;
use common\models\Title;
use common\models\Emp;

$this->title = '人员';
$this->params['breadcrumbs'][] = $this->title;
?>


<div class="user-index">
    <p>
        <?= Html::a('请假调休', ['vacation/index'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php  echo $this->render('_search', ['model' => $searchModel]); ?>

    <!-- 以下为用户的列表   -->
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'columns' => [
            'user_name',

            'tel',

            ['attribute'=>'dept_id',
                'label'=>'部门',
                'value'=>'dept.dept_name',
                'filter'=>Dept::find()
                    ->select(['dept_name'])
                    ->orderBy('dept_id')
                    ->column(),
            ],
            ['attribute'=>'title_id',
                'label'=>'职位',
                'value'=>'title.title_name',
                'filter'=>Title::find()
                    ->select(['title_name'])
                    ->orderBy('title_id')
                    ->column(),
            ],

        ],
    ]); ?>
</div>