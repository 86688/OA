<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\Dept;

/**
 * DeptSearch represents the model behind the search form of `common\models\Dept`.
 */
class DeptSearch extends Dept
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['dept_id', 'dept_name', 'dept_level', 'dept_p_id', 'dept_status'], 'safe'],
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
        $query = Dept::find();

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
        $query->andFilterWhere(['like', 'dept_id', $this->dept_id])
            ->andFilterWhere(['like', 'dept_name', $this->dept_name])
            ->andFilterWhere(['like', 'dept_level', $this->dept_level])
            ->andFilterWhere(['like', 'dept_p_id', $this->dept_p_id])
            ->andFilterWhere(['like', 'dept_status', $this->dept_status]);

        return $dataProvider;
    }
}
