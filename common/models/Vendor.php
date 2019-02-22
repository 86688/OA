<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "vendor".
 *
 * @property string $vendor_id ��Ӧ�̱��
 * @property string $vendor_name ��Ӧ������
 * @property string $vendor_type ��Ӧ�����
 * @property string $vendor_province ��Ӧ��ʡ��
 * @property string $vendor_city ��Ӧ�̳���
 * @property string $vendor_linkman ��Ӧ����ϵ��
 * @property string $vendor_linktel ��Ӧ����ϵ�绰
 * @property string $vendor_email ��Ӧ������
 * @property string $coupon_rate Ʊ��˰��
 * @property int $is_taxpayer �Ƿ�һ����˰��
 * @property string $vendor_address ��˾��ַ
 * @property string $social_code ͳһ������
 * @property string $deposit_bank ��������
 * @property string $bank_num ���п�����
 * @property string $register_capital ע���ʱ�
 */
class Vendor extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'vendor';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['vendor_name', 'vendor_type', 'vendor_province', 'vendor_city'], 'required'],
            [['vendor_name', 'vendor_type', 'vendor_address', 'social_code', 'deposit_bank'], 'string', 'max' => 50],
            [['vendor_province', 'vendor_city', 'coupon_rate', 'register_capital'], 'string', 'max' => 10],
            [['vendor_linkman'], 'string', 'max' => 5],
            [['vendor_linktel'], 'string', 'max' => 15],
            [['vendor_email'], 'string', 'max' => 30],
            [['is_taxpayer'], 'string', 'max' => 1],
            [['bank_num'], 'string', 'max' => 16],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'vendor_id' => 'Vendor ID',
            'vendor_name' => 'Vendor Name',
            'vendor_type' => 'Vendor Type',
            'vendor_province' => 'Vendor Province',
            'vendor_city' => 'Vendor City',
            'vendor_linkman' => 'Vendor Linkman',
            'vendor_linktel' => 'Vendor Linktel',
            'vendor_email' => 'Vendor Email',
            'coupon_rate' => 'Coupon Rate',
            'is_taxpayer' => 'Is Taxpayer',
            'vendor_address' => 'Vendor Address',
            'social_code' => 'Social Code',
            'deposit_bank' => 'Deposit Bank',
            'bank_num' => 'Bank Num',
            'register_capital' => 'Register Capital',
        ];
    }
}
