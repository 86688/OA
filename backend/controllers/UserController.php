<?php

namespace backend\controllers;

use backend\models\ResetpwdForm;
use Yii;
use common\models\User;
use common\models\UserSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * UserController implements the CRUD actions for User model.
 */
class UserController extends Controller
{
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    public function actionIndex()
    {
        $searchModel = new UserSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single User model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new User model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new User();
        $model->password_hash='$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu';

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->user_id]);
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing User model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->user_id]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }


    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the User model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return User the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = User::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

    public function actionResetpwd()
    {
        var_dump($key);
        return '1';
        die();
//        模型类
        $model = new User($key);
        $model->password_hash='$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu';

        return $this->render('index', [
            'model' => $model,
        ]);

    }

    public function actionPrivilege($id)
    {
        //step1. 找出所有权限,提供给checkboxlist
        $allPrivileges = AuthItem::find()->select(['name','description'])
            ->where(['type'=>1])->orderBy('description')->all();

        foreach ($allPrivileges as $pri)
        {
            $allPrivilegesArray[$pri->name]=$pri->description;
        }
        //step2. 当前用户的权限

        $AuthAssignments=AuthAssignment::find()->select(['item_name'])
            ->where(['user_id'=>$id])->orderBy('item_name')->all();

        $AuthAssignmentsArray = array();

        foreach ($AuthAssignments as $AuthAssignment)
        {
            array_push($AuthAssignmentsArray,$AuthAssignment->item_name);
        }

        //step3. 从表单提交的数据,来更新AuthAssignment表,从而用户的角色发生变化
        if(isset($_POST['newPri']))
        {
            AuthAssignment::deleteAll('user_id=:id',[':id'=>$id]);

            $newPri = $_POST['newPri'];

            $arrlength = count($newPri);

            for($x=0;$x<$arrlength;$x++)
            {
                $aPri = new AuthAssignment();
                $aPri->item_name = $newPri[$x];
                $aPri->user_id = $id;
                $aPri->created_at = time();

                $aPri->save();
            }
            return $this->redirect(['index']);
        }

        //step4. 渲染checkBoxList表单

        return $this->render('privilege',['id'=>$id,'AuthAssignmentArray'=>$AuthAssignmentsArray,
            'allPrivilegesArray'=>$allPrivilegesArray]);

    }

    // 收集view的用户ID 进行传递至模型  返回来的是部门的名字
    public function actionTest($id)
    {
//        $a=$this->findModel($id);

    }
}
