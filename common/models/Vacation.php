<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "vacation".
 *
 * @property int $id
 * @property string $user
 * @property string $start
 * @property string $end
 * @property string $count 请几天假
 * @property string $statusone
 * @property string $statustwo
 * @property string $statusthr
 */
class Vacation extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'vacation';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'user'], 'required'],
            [['id'], 'integer'],
            [['start', 'end'], 'safe'],
            [['user', 'count', 'statusone', 'statustwo', 'statusthr'], 'string', 'max' => 255],
            [['id'], 'unique'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => '编号',
            'user' => '用户',
            'start' => '开始',
            'end' => '结束',
            'count' => '时长',
            'statusone' => '批准一',
            'statustwo' => '批准二',
            'statusthr' => '批准三',
        ];
    }
}
