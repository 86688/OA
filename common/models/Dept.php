<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "dept".
 *
 * @property int $dept_id 部门编号
 * @property string $dept_name 部门名字
 * @property int $dept_level 部门级别
 * @property int $dept_p_id 上级部门编号
 * @property int $dept_status
 *
 * @property User $dept
 */
class Dept extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'dept';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['dept_name', 'dept_level', 'dept_p_id'], 'required'],
            [['dept_name'], 'string', 'max' => 15],
            [['dept_level', 'dept_p_id', 'dept_status'], 'string', 'max' => 1],
            [['dept_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['dept_id' => 'dept_id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'dept_id' => '部门编号',
            'dept_name' => '部门名字',
            'dept_level' => '部门级别',
            'dept_p_id' => '上级部门',
            'dept_status' => '部门状态',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDept()
    {
        return $this->hasOne(User::className(), ['dept_id' => 'dept_id']);
    }
}
