<?php

namespace common\models;

use Yii;
use yii\base\NotSupportedException;
use yii\behaviors\TimestampBehavior;
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
 * @property string $work_place 工作地点
 * @property string $linkman 紧急联系人
 * @property string $linktel 紧急联系人电话
 * @property string $housing_fund 住房公积金
 * @property int $vacation 年假
 * @property int $status_id 状态编号(外键)
 * @property int $dept_id 部门编号(外键)
 * @property int $title_id 角色编号（外键）
 *
 * @property Dept $dept
 * @property Status[] $statuses
 * @property Title $title
 */
class User extends ActiveRecord implements IdentityInterface
{
    const STATUS_DELETED = 0;
    const STATUS_ACTIVE = 10;

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
            [['tel', 'crt_start', 'crt_end', 'ctr_num', 'status_id', 'dept_id', 'title_id'], 'required'],
            [['crt_start', 'crt_end'], 'integer'],
            [['user_name', 'linkman'], 'string', 'max' => 5],
            [['password_hash'], 'string', 'max' => 100],
            [['auth_key'], 'string', 'max' => 32],
            [['password_reset_token'], 'string', 'max' => 255],
            [['sex', 'ctr_num', 'vacation', 'status_id', 'dept_id', 'title_id'], 'string', 'max' => 1],
            [['tel', 'linktel'], 'string', 'max' => 11],
            [['email'], 'string', 'max' => 30],
            [['id_card'], 'string', 'max' => 18],
            [['school', 'major', 'work_place'], 'string', 'max' => 15],
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
            'crt_start' => '开始',
            'crt_end' => '结束',
            'ctr_num' => '合同次数',
            'work_place' => '工作地',
            'linkman' => '紧急联系人',
            'linktel' => '紧急联系电话',
            'housing_fund' => '公积金',
            'vacation' => '年假',
            'status_id' => '状态',
            'dept_id' => '部门',
            'title_id' => '职称',
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

    /**
     * @inheritdoc
     */
    public function getId()
    {
        return $this->getPrimaryKey();
    }

    /**
     * @inheritdoc
     */
    public function getAuthKey()
    {
        return $this->auth_key;
    }

    /**
     * @inheritdoc
     */
    public function validateAuthKey($authKey)
    {
        return $this->getAuthKey() === $authKey;
    }

    /**
     * Validates password
     *
     * @param string $password password to validate
     * @return boolean if password provided is valid for current user
     */
    // 参数为密码
    public function validatePassword($password_hash)
    {
        return Yii::$app->security->validatePassword($password_hash, $this->password_hash);
    }

    /**
     * Generates password hash from password and sets it to the model
     *
     * @param string $password
     */
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

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDept()
    {
        return $this->hasOne(Dept::className(), ['dept_id' => 'dept_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatuses()
    {
        return $this->hasMany(Status::className(), ['status_id' => 'status_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTitle()
    {
        return $this->hasOne(Title::className(), ['title_id' => 'title_id']);
    }

}
