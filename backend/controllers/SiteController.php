<?php
namespace backend\controllers;

use Yii;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use common\models\LoginForm;

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
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'actions' => ['login', 'error'],
                        'allow' => true,
                    ],
                    [
                        'actions' => ['logout', 'index'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
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

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex()
    {
        return $this->render('index');
    }

    /**
     * Login action.
     *
     * @return string
     */
//  登录方法是在site里面的
//  注册方法是在user里面的
    public function actionLogin()
    {
        // 是否游客
        if (!Yii::$app->user->isGuest) {
            return $this->goHome();
        }
//        数据模型的名字
//        $B=Yii::$app->request->post();
//        echo '<br>';
//        echo '<br>';
//        echo '<br>';
//        echo '<br>';
//
//        var_dump($B);
//        $a=$model->load(Yii::$app->request->post());
//        var_dump($a);
//        die();

        $model = new LoginForm();
        //收集数据  && 执行loginform的login方法（验证密码用户配对  并且注册用户）
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->goBack();
//            没有通过  再次进行填写
        } else {
            $model->password_hash = '';

            return $this->render('login', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Logout action.
     *
     * @return string
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }

}
