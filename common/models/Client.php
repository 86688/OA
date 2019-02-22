<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "client".
 *
 * @property string $client_id 客户编号
 * @property string $client_cmy_name 客户公司名字
 * @property string $client_dept 客户公司部门
 * @property string $client_province 客户公司省份
 * @property string $client_city 客户公司城市
 * @property string $client_site 客户公司地址
 * @property string $client_linkman 客户公司联系人
 * @property string $client_man_title 客户公司联系人职称
 * @property string $client_linktel 客户公司联系电话
 * @property string $client_email 客户公司邮箱
 * @property string $client_tax_num 统一社会代码
 * @property string $client_bank 客户公司银行
 * @property string $client_bank_num 客户公司银行卡号码
 * @property string $client_capital 客户公司注册资本
 * @property string $coupon_rate 票面税率
 * @property int $is_taxpayer 是否一般纳税人
 * @property string $client_remark 客户公司备注信息
 * @property string $invoice_id 发票的ID
 *
 * @property Project $client
 * @property Invoice $invoice
 */
class Client extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'client';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['client_cmy_name', 'client_linktel'], 'required'],
            [['invoice_id'], 'integer'],
            [['client_cmy_name', 'client_tax_num', 'client_bank'], 'string', 'max' => 50],
            [['client_dept', 'client_linktel'], 'string', 'max' => 15],
            [['client_province', 'client_linkman', 'client_bank_num', 'client_capital'], 'string', 'max' => 20],
            [['client_city', 'client_man_title', 'coupon_rate'], 'string', 'max' => 10],
            [['client_site'], 'string', 'max' => 60],
            [['client_email'], 'string', 'max' => 30],
            [['is_taxpayer'], 'string', 'max' => 1],
            [['client_remark'], 'string', 'max' => 75],
            [['client_id'], 'exist', 'skipOnError' => true, 'targetClass' => Project::className(), 'targetAttribute' => ['client_id' => 'client_id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'client_id' => 'Client ID',
            'client_cmy_name' => 'Client Cmy Name',
            'client_dept' => 'Client Dept',
            'client_province' => 'Client Province',
            'client_city' => 'Client City',
            'client_site' => 'Client Site',
            'client_linkman' => 'Client Linkman',
            'client_man_title' => 'Client Man Title',
            'client_linktel' => 'Client Linktel',
            'client_email' => 'Client Email',
            'client_tax_num' => 'Client Tax Num',
            'client_bank' => 'Client Bank',
            'client_bank_num' => 'Client Bank Num',
            'client_capital' => 'Client Capital',
            'coupon_rate' => 'Coupon Rate',
            'is_taxpayer' => 'Is Taxpayer',
            'client_remark' => 'Client Remark',
            'invoice_id' => 'Invoice ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getClient()
    {
        return $this->hasOne(Project::className(), ['client_id' => 'client_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getInvoice()
    {
        return $this->hasOne(Invoice::className(), ['invoice_id' => 'invoice_id']);
    }
}
