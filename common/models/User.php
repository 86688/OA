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
 * @property int $place_id

 *
 * @property Dept $dept
 * @property Status[] $statuses
 * @property Title $title
 */
class User extends ActiveRecord implements IdentityInterface
{
//    性别
    const WOMEN=0;
    const MAN=1;
//   使用与转正
    const STATUS_TRY = 0;
    const STATUS_OFFICAL = 1;

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'user';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['tel', 'crt_start', 'crt_end', 'ctr_num', 'status_id', 'dept_id', 'title_id','place_id'], 'required',"message"=>"{attribute}不能为空"],
            [['crt_start', 'crt_end'], 'integer',"message"=>"{attribute}必须为数字"],
            [['user_name', 'linkman'], 'string', 'max' => 5],
            [['password_hash'], 'string', 'max' => 100],
            [['auth_key'], 'string', 'max' => 32],
            [['password_hash', 'password_reset_token'], 'string', 'max' => 255],
            [['sex', 'ctr_num', 'vacation', 'status_id', 'dept_id', 'title_id'], 'string', 'max' => 1],
            [['tel', 'linktel'], 'string', 'max' => 11,"message"=>"{attribute}只能为数字"],
            [['email'], 'string', 'max' => 30],
            [['id_card'], 'string', 'max' => 18],
            [['school', 'major'], 'string', 'max' => 15],
            [['housing_fund'], 'string', 'max' => 20],
        ];
    }

    /**
     * @inheritdoc
     */
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
            'crt_end' => '合同结束',
            'ctr_num' => '合同次数',
            'linkman' => '紧急联系人',
            'linktel' => '紧急联系电话',
            'housing_fund' => '公积金',
            'vacation' => '年假',
            'status_id' => '状态',
            'dept_id' => '部门',
            'title_id' => '职称',
            'place_id' => '地点',

        ];
    }

    /**
     * @inheritdoc
     */
    public static function findIdentity($id)
    {
        return static::findOne($id);
    }

    /**
     * @inheritdoc
     */
    public static function findIdentityByAccessToken($token, $type = null)
    {
        throw new NotSupportedException('"findIdentityByAccessToken" is not implemented.');
    }

    /**
     * Finds user by username
     *
     * @param string $username
     * @return static|null
     */
    public static function findByUsername($user_name)
    {
        return static::findOne(['user_name' => $user_name]);
    }

    /**
     * Finds user by password reset token
     *
     * @param string $token password reset token
     * @return static|null
     */
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

    /**
     * Finds out if password reset token is valid
     *
     * @param string $token password reset token
     * @return boolean
     */
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

    // 验证密码   参数为密码
    public function validatePassword($password_hash)
    {
        return Yii::$app->security->validatePassword($password_hash, $this->password_hash);
    }

    //产生密码的哈希值
    public function setPassword($password_hash)
    {
        $this->password_hash = Yii::$app->security->generatePasswordHash($password_hash);
    }

    /**
     * Generates "remember me" authentication key
     */
    public function generateAuthKey()
    {
        $this->auth_key = Yii::$app->security->generateRandomString();
    }

    /**
     * Generates new password reset token
     */
    public function generatePasswordResetToken()
    {
        $this->password_reset_token = Yii::$app->security->generateRandomString() . '_' . time();
    }

    /**
     * Removes password reset token
     */
    public function removePasswordResetToken()
    {
        $this->password_reset_token = null;
    }

    //展示页面获取所有的状态
    public static function allStatus()
    {
        return [self::STATUS_OFFICAL=>'正式',self::STATUS_TRY=>'试用'];
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
