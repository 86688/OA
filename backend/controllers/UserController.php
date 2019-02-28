<?php

namespace backend\controllers;

use Yii;
use common\models\User;
use common\models\UserSearch;
use yii\web\Controller;
use yii\web\ForbiddenHttpException;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use common\models\AuthAssignment;
use common\models\AuthItem;
use app\models\Upload;
use app\models\UploadForm;
use yii\web\UploadedFile;

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

    //展示所有
    public function actionIndex()
    {
        if (!Yii::$app->user->can('backend', [], true)) {
            throw new ForbiddenHttpException('请认证身份，谢谢！');
        }

        $searchModel = new UserSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            //两个模型
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionChange()
    {
        $searchModel=new UserSearch();

        $dataProvider=$searchModel->change(Yii::$app->request->queryParams);

        return $this->render('change',[
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    //展示一个
    public function actionView($id)
    {
        if (!Yii::$app->user->can('view_emp', [], true)) {
            throw new ForbiddenHttpException('对不起，你没有这个权限');
        }

        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    //删除一个
    public function actionDelete($id)
    {

        if (!Yii::$app->user->can('del_emp', [], true)) {
            throw new ForbiddenHttpException('对不起，你没有这个权限');
        }

        $user=$this->findModel($id);
        $user->status_id='2';
        $user->save(true,['status_id']);
        return $this->redirect(['index']);
    }

    //上传文件
    public function upload()
    {
        $model = new User();
        //获取上传文件名字的数组
        $files = UploadedFile::getInstances($model, 'file');

        foreach ($files as $file){
            //saveAs保存上传的文件 逐个保存
            //构成：位置+(时间+文件名+扩展名)---(路径，删除模板)
            $file->saveAs(Yii::getAlias("@backend").'\assets\file\\'.$model->user_name.$file->baseName.'.'.$file->extension,true);
        }
    }

    //新建一个
    public function actionCreate()
    {

        if (!Yii::$app->user->can('new_emp', [], true)) {
            throw new ForbiddenHttpException('对不起，你没有这个权限');
        }

        $model = new User();
        //功能点一：设置默认密码
        $model->password_hash = '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu';

        //功能点二：上传文件
        $this->upload();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->user_id]);
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    //更新一个
    public function actionUpdate($id)
    {
        if (!Yii::$app->user->can('modify_emp', [], true)) {
            throw new ForbiddenHttpException('对不起，你没有这个权限');
        }

        $model = $this->findModel($id);

        //上传文件
        $this->upload();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->user_id]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    //重置一个
    public function actionResetpwd($id)
    {

        if (!Yii::$app->user->can('modify_emp', [], true)) {
            throw new ForbiddenHttpException('对不起，你没有这个权限');
        }

        $user = User::findOne($id);
        $user->password_hash = '$2y$13$HtJqGRmc76KIRIwokii8AOQ1XZljXiuWCKUGFnH9vkTnfBpHtqgFu';
        if ($user->save(true, ['password_hash'])) {
            return $this->redirect(['index']);
        }
    }

    //找到一个
    protected function findModel($id)
    {
        if (($model = User::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

    //权限
    public function actionPrivilege($id)
    {
        if (!Yii::$app->user->can('gm', [], true)) {
            throw new ForbiddenHttpException('对不起，你没有这个权限');
        }

        //step1. 找出所有权限,提供给checkboxlist
        $allPrivileges = AuthItem::find()
            ->select(['name', 'description'])
            ->where(['type' => 1])
            ->orderBy('description')
            ->all();

        foreach ($allPrivileges as $pri) {
            $allPrivilegesArray[$pri->name] = $pri->description;
        }

        //step2. 当前用户的权限
        $AuthAssignments = AuthAssignment::find()
            ->select(['item_name'])
            ->where(['user_id' => $id])
            ->orderBy('item_name')
            ->all();

        //此处的数组是在把之前有的权限制作成了一个数组
        $AuthAssignmentsArray = array();

        foreach ($AuthAssignments as $AuthAssignment) {
            array_push($AuthAssignmentsArray, $AuthAssignment->item_name);
        }

        //step3. 从表单提交的数据,来更新AuthAssignment表,从而用户的角色发生变化
        if (isset($_POST['newPri'])) {
            AuthAssignment::deleteAll('user_id=:id', [':id' => $id]);

            $newPri = $_POST['newPri'];

            $arrlength = count($newPri);

            for ($x = 0; $x < $arrlength; $x++) {
                $aPri = new AuthAssignment();
                $aPri->item_name = $newPri[$x];
                $aPri->user_id = $id;
                $aPri->created_at = time();

                $aPri->save();
            }
            return $this->redirect(['index']);
        }

        //step4. 渲染checkBoxList表单
        return $this->render('privilege', ['id' => $id, 'AuthAssignmentArray' => $AuthAssignmentsArray,
            'allPrivilegesArray' => $allPrivilegesArray]);

    }

    //上传
    public function actionUploadMore()
    {

        $model = new User();

        if(Yii::$app->request->isPost){
            //获取文件
            $files = UploadedFile::getInstances($model, 'file');

            foreach ($files as $file){
                //构成：位置+(时间+文件名+扩展名)
                $file->saveAs('./uploads/'.time() .$file->baseName. '.' . $file->extension);
                var_dump(1);
                die();
            }
        }
    }
}

