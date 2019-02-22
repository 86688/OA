<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "project".
 *
 * @property string $project_id ��Ŀ���
 * @property string $project_name ��Ŀ����
 * @property string $depe_id
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
            [['project_name', 'phase'], 'required'],
            [['new_time', 'update_time', 'confirm_time', 'exec_time', 'end_time', 'crt_id', 'client_id'], 'integer'],
            [['project_name'], 'string', 'max' => 50],
            [['depe_id', 'budget'], 'string', 'max' => 30],
            [['principal', 'rating'], 'string', 'max' => 10],
            [['assist', 'address'], 'string', 'max' => 100],
            [['city'], 'string', 'max' => 20],
            [['self_id'], 'string', 'max' => 3],
            [['project_remark'], 'string', 'max' => 75],
            [['phase'], 'string', 'max' => 1],
            [['project_type'], 'string', 'max' => 5],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'project_id' => 'Project ID',
            'project_name' => 'Project Name',
            'depe_id' => 'Depe ID',
            'new_time' => 'New Time',
            'update_time' => 'Update Time',
            'confirm_time' => 'Confirm Time',
            'exec_time' => 'Exec Time',
            'end_time' => 'End Time',
            'principal' => 'Principal',
            'assist' => 'Assist',
            'city' => 'City',
            'address' => 'Address',
            'budget' => 'Budget',
            'crt_id' => 'Crt ID',
            'self_id' => 'Self ID',
            'client_id' => 'Client ID',
            'project_remark' => 'Project Remark',
            'rating' => 'Rating',
            'phase' => 'Phase',
            'project_type' => 'Project Type',
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
}
