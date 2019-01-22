<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "dept".
 *
 * @property int $dept_id 部门编号
 * @property string $dept_name 部门名字
 * @property int $depe_level 部门级别
 * @property int $dept_p_id 上级部门编号
 *
 * @property User[] $users
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
            [['depe_level', 'dept_p_id'], 'integer'],
            [['dept_name'], 'string', 'max' => 50],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'dept_id' => 'Dept ID',
            'dept_name' => 'Dept Name',
            'depe_level' => 'Depe Level',
            'dept_p_id' => 'Dept P ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUsers()
    {
        return $this->hasMany(User::className(), ['dept_id' => 'dept_id']);
    }
}
