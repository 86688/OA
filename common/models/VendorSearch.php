<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\Vendor;

/**
 * VendorSearch represents the model behind the search form of `common\models\Vendor`.
 */
class VendorSearch extends Vendor
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['vendor_id'], 'integer'],
            [['vendor_name', 'vendor_type', 'vendor_province', 'vendor_city', 'vendor_linkman', 'vendor_linktel', 'vendor_email', 'coupon_rate', 'is_taxpayer', 'vendor_address', 'social_code', 'deposit_bank', 'bank_num', 'register_capital'], 'safe'],
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
        $query = Vendor::find();

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
            'vendor_id' => $this->vendor_id,
        ]);

        $query->andFilterWhere(['like', 'vendor_name', $this->vendor_name])
            ->andFilterWhere(['like', 'vendor_type', $this->vendor_type])
            ->andFilterWhere(['like', 'vendor_province', $this->vendor_province])
            ->andFilterWhere(['like', 'vendor_city', $this->vendor_city])
            ->andFilterWhere(['like', 'vendor_linkman', $this->vendor_linkman])
            ->andFilterWhere(['like', 'vendor_linktel', $this->vendor_linktel])
            ->andFilterWhere(['like', 'vendor_email', $this->vendor_email])
            ->andFilterWhere(['like', 'coupon_rate', $this->coupon_rate])
            ->andFilterWhere(['like', 'is_taxpayer', $this->is_taxpayer])
            ->andFilterWhere(['like', 'vendor_address', $this->vendor_address])
            ->andFilterWhere(['like', 'social_code', $this->social_code])
            ->andFilterWhere(['like', 'deposit_bank', $this->deposit_bank])
            ->andFilterWhere(['like', 'bank_num', $this->bank_num])
            ->andFilterWhere(['like', 'register_capital', $this->register_capital]);

        return $dataProvider;
    }
}
