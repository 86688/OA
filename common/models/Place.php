<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "place".
 *
 * @property int $place_id
 * @property string $place
 */
class Place extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'place';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['place_id', 'place'], 'required'],
            [['place_id'], 'integer'],
            [['place'], 'string', 'max' => 20],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'place_id' => 'Place ID',
            'place' => 'Place',
        ];
    }

    // 找出所有的部门
    public static function allPlace()
    {
        $allPlace=Place::find()
            ->select(['place'])
            ->from('place')
            ->indexBy('place')
            ->column();
        return $allPlace;
    }
}
