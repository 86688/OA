<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\Client;

/**
 * ClientSearch represents the model behind the search form of `common\models\Client`.
 */
class ClientSearch extends Client
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['client_id', 'invoice_id'], 'integer'],
            [['client_cmy_name', 'client_dept', 'client_province', 'client_city', 'client_site', 'client_linkman', 'client_man_title', 'client_linktel', 'client_email', 'client_tax_num', 'client_bank', 'client_bank_num', 'client_capital', 'coupon_rate', 'is_taxpayer', 'client_remark'], 'safe'],
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
        $query = Client::find();

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
            'client_id' => $this->client_id,
            'invoice_id' => $this->invoice_id,
        ]);

        $query->andFilterWhere(['like', 'client_cmy_name', $this->client_cmy_name])
            ->andFilterWhere(['like', 'client_dept', $this->client_dept])
            ->andFilterWhere(['like', 'client_province', $this->client_province])
            ->andFilterWhere(['like', 'client_city', $this->client_city])
            ->andFilterWhere(['like', 'client_site', $this->client_site])
            ->andFilterWhere(['like', 'client_linkman', $this->client_linkman])
            ->andFilterWhere(['like', 'client_man_title', $this->client_man_title])
            ->andFilterWhere(['like', 'client_linktel', $this->client_linktel])
            ->andFilterWhere(['like', 'client_email', $this->client_email])
            ->andFilterWhere(['like', 'client_tax_num', $this->client_tax_num])
            ->andFilterWhere(['like', 'client_bank', $this->client_bank])
            ->andFilterWhere(['like', 'client_bank_num', $this->client_bank_num])
            ->andFilterWhere(['like', 'client_capital', $this->client_capital])
            ->andFilterWhere(['like', 'coupon_rate', $this->coupon_rate])
            ->andFilterWhere(['like', 'is_taxpayer', $this->is_taxpayer])
            ->andFilterWhere(['like', 'client_remark', $this->client_remark]);

        return $dataProvider;
    }
}
