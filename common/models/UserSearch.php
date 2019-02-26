<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\User;

/**
 * UserSearch represents the model behind the search form of `common\models\User`.
 */
//继承user
class UserSearch extends User
{
//    public function attributes()
//    {
//        return array_merge(parent::attributes(),['authorName']);
//    }

    /**
     * @重写了rules
     */
    public function rules()
    {
        return [
            [['user_id', 'crt_start', 'crt_end'], 'integer'],
            [['user_name', 'auth_key', 'password_hash', 'password_reset_token', 'sex', 'tel', 'email', 'id_card', 'school', 'major', 'ctr_num', 'linkman', 'linktel', 'housing_fund', 'vacation', 'status_id', 'dept_id', 'title_id', 'place_id'], 'safe'],
        ];
    }

    public function scenarios()
    {
        return Model::scenarios();
    }

    public function search($params)
    {
        $query = User::find()
            ->where(['!=','status_id',2]);

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);
        //块赋值
        $this->load($params);
        //校验数据
        if (!$this->validate()) {
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere(['like', 'user_name', $this->user_name])
            ->andFilterWhere(['like', 'sex', $this->sex])
            ->andFilterWhere(['like', 'status_id', $this->status_id])
            ->andFilterWhere(['like', 'dept_id', $this->dept_id])
            ->andFilterWhere(['like', 'title_id', $this->title_id]);

        //连表查询-工作地址
        $query->join('INNER JOIN','place','user.place_id = place.place_id');
        $query->andFilterWhere(['like','place.place',$this->place_id]);

        //默认排序
        $dataProvider->sort->attributes['title_id'] =
            [
                'asc'=>['User.title_id'=>SORT_ASC],
                'desc'=>['User.dept_id'=>SORT_DESC],
            ];

        return $dataProvider;
    }

    public function change($params)
    {
        $query = User::find()->where([]);

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);
        if (!$this->validate()) {
            return $dataProvider;
        }

        $query->andFilterWhere(['like', 'user_name', $this->user_name])
            ->andFilterWhere(['like', 'sex', $this->sex])
            ->andFilterWhere(['like', 'tel', $this->tel])
            ->andFilterWhere(['like', 'ctr_num', $this->ctr_num])
            ->andFilterWhere(['like', 'vacation', $this->vacation])
            ->andFilterWhere(['like', 'status_id', $this->status_id])
            ->andFilterWhere(['like', 'dept_id', $this->dept_id])
            ->andFilterWhere(['like', 'title_id', $this->title_id])
            ->andFilterWhere(['like', 'place_id', $this->place_id]);

        return $dataProvider;
    }
}
