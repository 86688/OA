<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\Project;

/**
 * ProjectSearch represents the model behind the search form of `common\models\Project`.
 */
class ProjectSearch extends Project
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['project_id', 'new_time', 'update_time', 'confirm_time', 'exec_time', 'end_time', 'crt_id', 'client_id'], 'integer'],
            [['project_name', 'dept_id', 'principal', 'assist', 'city', 'address', 'budget', 'self_id', 'project_remark', 'rating', 'phase', 'project_type'], 'safe'],
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
        $query = Project::find();

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
            'project_id' => $this->project_id,
            'new_time' => $this->new_time,
            'update_time' => $this->update_time,
            'confirm_time' => $this->confirm_time,
            'exec_time' => $this->exec_time,
            'end_time' => $this->end_time,
            'crt_id' => $this->crt_id,
            'client_id' => $this->client_id,
        ]);

        $query->andFilterWhere(['like', 'project_name', $this->project_name])
            ->andFilterWhere(['like', 'dept_id', $this->dept_id])
            ->andFilterWhere(['like', 'principal', $this->principal])
            ->andFilterWhere(['like', 'assist', $this->assist])
            ->andFilterWhere(['like', 'city', $this->city])
            ->andFilterWhere(['like', 'address', $this->address])
            ->andFilterWhere(['like', 'budget', $this->budget])
            ->andFilterWhere(['like', 'self_id', $this->self_id])
            ->andFilterWhere(['like', 'project_remark', $this->project_remark])
            ->andFilterWhere(['like', 'rating', $this->rating])
            ->andFilterWhere(['like', 'phase', $this->phase])
            ->andFilterWhere(['like', 'project_type', $this->project_type]);

        return $dataProvider;
    }
}
