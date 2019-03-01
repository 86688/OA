<?php
namespace frontend\controllers;

use common\models\LoginFront;
use Yii;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use common\models\LoginForm;
use yii\web\ForbiddenHttpException;
use common\models\Emp;



/**
 * Site controller
 */
class SiteController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
        ];
    }

    //显示主页
    public function actionIndex()
    {
        if (!Yii::$app->user->can('backend', [], true)) {
            throw new ForbiddenHttpException('请先登录，谢谢！');
        }

        return $this->render('index');
    }

    //  登录方法是在site里面的
    //  注册方法是在user里面的
    public function actionLogin()
    {

        // 是否游客
        if (!Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $model = new LoginFront();
        // 收集数据
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->redirect(['index']);
        } else {
            $model->password_hash = '';
            return $this->render('login', [
                'model' => $model,
            ]);
        }
    }

    //Logout
    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }

}
