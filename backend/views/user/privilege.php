<?php
/**
 * Created by PhpStorm.
 * User: sunxi
 * Date: 2019/2/18
 * Time: 16:13
 */

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use common\models\User;

/* @var $this yii\web\View */
/* @var $model common\models\Adminuser */

$model = User::findOne($id);

$this->title = '权限设置: ' . $model->user_name;
$this->params['breadcrumbs'][] = ['label' => '管理员', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->user_name, 'url' => ['view', 'id' => $id]];
$this->params['breadcrumbs'][] = '权限设置';
?>

<div class="user-update">



    <div class="adminuser-privilege-form">

        <?php $form = ActiveForm::begin(); ?>

            <?= Html::checkboxList('newPri',$AuthAssignmentArray,$allPrivilegesArray);?>

            <div class="form-group">
                <?= Html::submitButton('设置') ?>
            </div>

        <?php ActiveForm::end(); ?>

    </div>

</div>




