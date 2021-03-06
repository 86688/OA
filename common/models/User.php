<?php

namespace common\models;

use Yii;
use yii\base\NotSupportedException;
use yii\db\ActiveRecord;
use yii\web\IdentityInterface;

/**
 * This is the model class for table "user".
 *
 * @property int $user_id 职员编号
 * @property string $user_name 职员姓名
* @property string $password_hash 职员密码
 * @property string $auth_key 安全认证
 * @property string $password_reset_token 重置密码
 * @property string $sex 职员性别
 * @property string $tel 职员电话
 * @property string $email 职员邮箱
 * @property string $id_card 职员身份证
 * @property string $school 职员院校
 * @property string $major 职员专业
 * @property string $crt_start 合同开始
 * @property string $crt_end 合同结束
 * @property int $ctr_num 合同次数
 * @property string $linkman 紧急联系人
 * @property string $linktel 紧急联系人电话
 * @property string $housing_fund 住房公积金
 * @property int $vacation 年假
 * @property int $status_id 状态编号(外键)
 * @property int $dept_id 部门编号(外键)
 * @property int $title_id 角色编号（外键）
 * @property int $place_id  地点编号(外键)
 * @property string $file 文件图片路径
 * @property int $show 离职在职
 * @property int $in_time 入职时间
 * @property int $out_time 离职时间
 * @property int $sal_time
 * @property double $salary 薪资
 * @property string $mark 备注

 *
 * @property Dept $dept
 * @property Status[] $statuses
 * @property Title $title
 */
class User extends ActiveRecord implements IdentityInterface
{
    //性别
    const MAN=1;
    const WOMEN=0;
    //使用与转正
//    const STATUS_TRY = 0;
//    const STATUS_OFFICAL = 1;

    public static function tableName()
    {
        return 'user';
    }

    public function rules()
    {
        return [
//            [['tel', 'id_card', 'status_id', 'dept_id', 'title_id','place_id','linkman','linktel'], 'required',"message"=>"{attribute}不能为空"],
            [['show'], 'integer',"message"=>"{attribute}必须为数字"],
            [['user_name', 'linkman'], 'string', 'max' => 5],
            [['password_hash'], 'string', 'max' => 100],
            [['auth_key'], 'string', 'max' => 32],
            [['password_hash', 'password_reset_token'], 'string', 'max' => 255],
            [['sex', 'ctr_num', 'vacation', 'status_id'], 'string', 'max' => 1],
            [['tel', 'linktel'], 'string', 'max' => 11,"message"=>"{attribute}只能为数字"],
            [['email'], 'string', 'max' => 30],
            [['id_card'], 'string', 'max' => 18],
            [['school', 'major'], 'string', 'max' => 15],
            [['housing_fund'], 'string', 'max' => 20],
        ];
    }

    public function attributeLabels()
    {
        return [
            'user_id' => '编号',
            'user_name' => '姓名',
            'password_hash' => '密码',
            'auth_key' => '安全认证',
            'password_reset_token' => '重置密码',
            'sex' => '性别',
            'tel' => '电话',
            'email' => '邮箱',
            'id_card' => '身份证',
            'school' => '院校',
            'major' => '专业',
            'crt_start' => '合同开始',
            'crt_end' => '合同截止',
            'ctr_num' => '次数',
            'linkman' => '紧急联系人',
            'linktel' => '紧急联系电话',
            'housing_fund' => '公积金',
            'vacation' => '年假',
            'status_id' => '状态',
            'dept_id' => '部门',
            'title_id' => '职称',
            'place_id' => '地点',
            'file' => '上传',
            'show' => '展示',
            'in_time' => '入职时间',
            'out_time' => '离职时间',
            'sal_time' => '薪资调整时间',
            'salary' => '薪资',
            'mark' => '备注',

        ];
    }

    //根据ID查找
    public static function findIdentity($id)
    {
        return static::findOne($id);
    }

    //根据token查找
    public static function findIdentityByAccessToken($token, $type = null)
    {
        throw new NotSupportedException('"findIdentityByAccessToken" is not implemented.');
    }

    //根据name查找
    public static function findByUsername($user_name)
    {
        return static::findOne(['user_name' => $user_name]);
    }

    //根据token查找
    public static function findByPasswordResetToken($token)
    {
        if (!static::isPasswordResetTokenValid($token)) {
            return null;
        }

        return static::findOne([
            'password_reset_token' => $token,
            'status' => self::STATUS_ACTIVE,
        ]);
    }

    //判断token
    public static function isPasswordResetTokenValid($token)
    {
        if (empty($token)) {
            return false;
        }

        $timestamp = (int) substr($token, strrpos($token, '_') + 1);
        $expire = Yii::$app->params['user.passwordResetTokenExpire'];
        return $timestamp + $expire >= time();
    }

    //获取主键
    public function getId()
    {
        return $this->getPrimaryKey();
    }

    // 获取getAuthKey
    public function getAuthKey()
    {
        return $this->auth_key;
    }

    // 验证authkey
    public function validateAuthKey($authKey)
    {
        return $this->getAuthKey() === $authKey;
    }

    // 验证密码
    public function validatePassword($password_hash)
    {
        return Yii::$app->security->validatePassword($password_hash, $this->password_hash);
    }

    //产生哈希值
    public function setPassword($password_hash)
    {
        $this->password_hash = Yii::$app->security->generatePasswordHash($password_hash);
    }

    //Generates "remember me" authentication key
    public function generateAuthKey()
    {
        $this->auth_key = Yii::$app->security->generateRandomString();
    }

    //Generates new password reset token
    public function generatePasswordResetToken()
    {
        $this->password_reset_token = Yii::$app->security->generateRandomString() . '_' . time();
    }

    //删除重置密码
    public function removePasswordResetToken()
    {
        $this->password_reset_token = null;
    }

    //展示页面获取所有的状态
    public static function allStatus()
    {
        return [0=>'正式',1=>'试用',2=>'离职'];
    }

    //展示页面获取所有性别
    public static function allSex()
    {
        return [self::MAN=>'男',self::WOMEN=>'女'];
    }

    //性别下拉菜单数组  用于view页面
    public  function getStatus()
    {
        return $this->hasOne(Status::className(), ['status_id' => 'status_id']);
    }

    //获取部门名字  用于view页面
    public function getDept()
    {
        return $this->hasOne(Dept::className(), ['dept_id' => 'dept_id']);
    }

    //获取职称  用于view页面
    public function getTitle()
    {
        return $this->hasOne(Title::className(), ['title_id' => 'title_id']);
    }

    //获取地点  用于view页面
    public function getPlace()
    {
        return $this->hasOne(Place::className(), ['place_id' => 'place_id']);
    }

}
