<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "title".
 *
 * @property int $title_id 职务编号
 * @property string $title_name 职务名字
 * @property int $title_p_id 上级职务编号
 *
 * @property User $title
 */
class Title extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'title';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['title_name', 'title_p_id'], 'required'],
            [['title_name'], 'string', 'max' => 10],
            [['title_p_id'], 'string', 'max' => 1],
            [['title_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['title_id' => 'title_id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'title_id' => 'Title ID',
            'title_name' => 'Title Name',
            'title_p_id' => 'Title P ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTitle()
    {
        return $this->hasOne(User::className(), ['title_id' => 'title_id']);
    }
}
