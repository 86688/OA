<?php
/**
 * Created by PhpStorm.
 * User: sunxi
 * Date: 2019/2/18
 * Time: 12:35
 */
namespace console\controllers;

use Yii;
use yii\console\Controller;

class RbacController extends Controller
{
    public function actionInit()
    {
        $auth = Yii::$app->authManager;

        // 添加 "new_emp" 权限
        $new_emp = $auth->createPermission('new_emp');
        $new_emp->description = '查看员工';
        $auth->add($new_emp);

        // 添加 "view_emp" 权限
        $view_emp = $auth->createPermission('view_emp');
        $view_emp->description = '查看员工';
        $auth->add($view_emp);

        // 添加 "hr_aid" 角色并赋予 "$view_emp"权限
        $hr_aid = $auth->createRole('hr_aid');
        $hr_aid->description = '人事助理';
        $auth->add($hr_aid);
        $auth->addChild($hr_aid, $new_emp);
        $auth->addChild($hr_aid, $view_emp);

        // 为用户指派角色。其中 1 和 2 是由 IdentityInterface::getId() 返回的id （译者注：user表的id）
        // 通常在你的 User 模型中实现这个函数。
        $auth->assign($hr_aid, 3);
    }
}