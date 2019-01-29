<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\User;

/**
 * UserSearch represents the model behind the search form of `common\models\User`.
 */
class UserSearch extends User
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_id', 'crt_start', 'crt_end'], 'integer'],
            [['user_name', 'user_pwd', 'sex', 'tel', 'email', 'id_card', 'school', 'major', 'ctr_num', 'work_place', 'linkman', 'linktel', 'housing_fund', 'vacation', 'status_id', 'dept_id', 'title_id'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = User::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'user_id' => $this->user_id,
            'crt_start' => $this->crt_start,
            'crt_end' => $this->crt_end,
        ]);

        $query->andFilterWhere(['like', 'user_name', $this->user_name])
            ->andFilterWhere(['like', 'user_pwd', $this->user_pwd])
            ->andFilterWhere(['like', 'sex', $this->sex])
            ->andFilterWhere(['like', 'tel', $this->tel])
            ->andFilterWhere(['like', 'email', $this->email])
            ->andFilterWhere(['like', 'id_card', $this->id_card])
            ->andFilterWhere(['like', 'school', $this->school])
            ->andFilterWhere(['like', 'major', $this->major])
            ->andFilterWhere(['like', 'ctr_num', $this->ctr_num])
            ->andFilterWhere(['like', 'work_place', $this->work_place])
            ->andFilterWhere(['like', 'linkman', $this->linkman])
            ->andFilterWhere(['like', 'linktel', $this->linktel])
            ->andFilterWhere(['like', 'housing_fund', $this->housing_fund])
            ->andFilterWhere(['like', 'vacation', $this->vacation])
            ->andFilterWhere(['like', 'status_id', $this->status_id])
            ->andFilterWhere(['like', 'dept_id', $this->dept_id])
            ->andFilterWhere(['like', 'title_id', $this->title_id]);

        return $dataProvider;
    }
}
