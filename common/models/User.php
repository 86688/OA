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
 * @property string $user_pwd 职员密码
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
            [['user_name', 'user_pwd', 'sex', 'tel', 'id_card', 'crt_start', 'crt_end', 'status_id', 'dept_id', 'title_id'], 'required'],
            [['crt_start', 'crt_end'], 'integer'],
            [['user_name', 'linkman'], 'string', 'max' => 5],
            [['user_pwd'], 'string', 'max' => 32],
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
            'user_pwd' => 'User Pwd',
            'sex' => '性别',
            'tel' => '电话',
            'email' => '邮箱',
            'id_card' => '身份证',
            'school' => '院校',
            'major' => '专业',
            'crt_start' => '合同开始',
            'crt_end' => '合同结束',
            'ctr_num' => '合同次数',
            'work_place' => '地点',
            'linkman' => '紧急联系人',
            'linktel' => '紧急联系人电话',
            'housing_fund' => '住房公积金',
            'vacation' => '年假',
            'status_id' => '状态',
            'dept_id' => '部门',
            'title_id' => '职称',
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
