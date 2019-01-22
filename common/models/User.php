<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "user".
 *
 * @property int $user_id 职员编号
 * @property string $user_name 职员姓名
 * @property string $user_pwd 职员密码
 * @property string $sex 职员性别
 * @property string $phone 职员电话
 * @property string $email 职员邮箱
 * @property int $idcard 职员身份证
 * @property string $school 职员院校
 * @property string $major 职员专业
 * @property int $crt_start 合同开始
 * @property int $crt_end 合同结束
 * @property string $place 工作地点
 * @property int $status_id 状态编号(外键)
 * @property int $dept_id 部门编号(外键)
 * @property int $role_id 角色编号（外键）
 *
 * @property Dept $dept
 * @property Role $role
 * @property Status $status
 */
class User extends \yii\db\ActiveRecord
{
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
            [['user_name', 'user_pwd', 'sex', 'phone'], 'required'],
            [['idcard', 'crt_start', 'crt_end', 'status_id', 'dept_id', 'role_id'], 'integer'],
            [['user_name'], 'string', 'max' => 20],
            [['user_pwd', 'email'], 'string', 'max' => 100],
            [['sex'], 'string', 'max' => 10],
            [['phone', 'school'], 'string', 'max' => 50],
            [['major'], 'string', 'max' => 11],
            [['place'], 'string', 'max' => 30],
            [['dept_id'], 'exist', 'skipOnError' => true, 'targetClass' => Dept::className(), 'targetAttribute' => ['dept_id' => 'dept_id']],
            [['role_id'], 'exist', 'skipOnError' => true, 'targetClass' => Role::className(), 'targetAttribute' => ['role_id' => 'role_id']],
            [['status_id'], 'exist', 'skipOnError' => true, 'targetClass' => Status::className(), 'targetAttribute' => ['status_id' => 'status_id']],
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
            'user_pwd' => '密码',
            'sex' => '性别',
            'phone' => '手机',
            'email' => '邮箱',
            'idcard' => '身份证',
            'school' => '院校',
            'major' => '专业',
            'crt_start' => '合同开始',
            'crt_end' => '合同到期',
            'place' => '地点',
            'status_id' => '状态',
            'dept_id' => '部门',
            'role_id' => '角色',
        ];
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
    public function getRole()
    {
        return $this->hasOne(Role::className(), ['role_id' => 'role_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatus()
    {
        return $this->hasOne(Status::className(), ['status_id' => 'status_id']);
    }
}
