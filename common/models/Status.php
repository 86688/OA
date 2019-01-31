<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "status".
 *
 * @property int $status_id 状态编号
 * @property string $status_name 状态注释
 *
 * @property User $status
 */
class Status extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'status';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['status_id', 'status_name'], 'required'],
            [['status_id'], 'string', 'max' => 1],
            [['status_name'], 'string', 'max' => 2],
            [['status_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['status_id' => 'status_id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'status_id' => 'Status ID',
            'status_name' => 'Status Name',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatus()
    {
        return $this->hasOne(User::className(), ['status_id' => 'status_id']);
    }
}
