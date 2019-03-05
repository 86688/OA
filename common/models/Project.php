<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "project".
 *
 * @property string $project_id ��Ŀ���
 * @property string $project_name ��Ŀ����
 * @property string $dept_id
 * @property string $new_time ��Ŀ�½�ʱ��
 * @property string $update_time ��Ŀ����ʱ��
 * @property string $confirm_time ��Ŀȷ��ʱ��
 * @property string $exec_time ��Ŀִ��ʱ��
 * @property string $end_time ��Ŀ���ʱ��
 * @property string $principal ��Ŀ������
 * @property string $assist ��ĿЭ����
 * @property string $city ��Ŀ����
 * @property string $address ��Ŀ�ص�
 * @property string $budget ��ĿԤ��
 * @property string $crt_id ��ͬ���
 * @property int $self_id �Լ���˾���
 * @property string $client_id �ͻ����
 * @property string $project_remark ��Ŀ��ע
 * @property string $rating ��Ŀ����
 * @property int $phase �׶� 1-����2-δ��3-ȷ��4-ִ��5-����
 * @property string $project_type ��Ŀ����
 *
 * @property Contract $contract
 * @property SelfCmy $selfCmy
 */
class Project extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'project';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['project_name'], 'string', 'max' => 50],
            [['dept_id', 'budget'], 'string', 'max' => 30],
            [['principal', 'rating'], 'string', 'max' => 10],
            [['assist', 'address'], 'string', 'max' => 100],
            [['city'], 'string', 'max' => 20],
            [['self_id'], 'string', 'max' => 3],
            [['project_remark'], 'string', 'max' => 75],
            [['phase'], 'string', 'max' => 1],
            [['project_type'], 'max' => 5],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'project_id' => '项目编号',
            'project_name' => '项目名字',
            'dept_id' => '部门',
            'new_time' => '新建时间',
            'update_time' => '修改时间',
            'confirm_time' => '确认时间',
            'exec_time' => '执行时间',
            'end_time' => '截止时间',
            'principal' => '负责人',
            'assist' => '协助人',
            'city' => '城市',
            'address' => '地址',
            'budget' => '预算',
            'crt_id' => '合同',
            'self_id' => '公司',
            'client_id' => '客户',
            'project_remark' => '项目备注',
            'rating' => '排名',
            'phase' => '阶段',
            'project_type' => '项目类型',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getContract()
    {
        return $this->hasOne(Contract::className(), ['crt_id' => 'crt_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSelfCmy()
    {
        return $this->hasOne(SelfCmy::className(), ['self_id' => 'self_id']);
    }

    public static function allPhase()
    {
        return [
            1=>'意向',
            2=>'确定',
            3=>'结算',
            4=>'结束',
        ];
    }
    public static function allType()
    {
        return [
            1=>'内部',
            2=>'外部',
        ];
    }
}
