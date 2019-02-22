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
            'vendor_id' => '编号',
            'vendor_name' => '名称',
            'vendor_type' => '类型',
            'vendor_province' => '省份',
            'vendor_city' => '城市',
            'vendor_linkman' => '联系人',
            'vendor_linktel' => '联系电话',
            'vendor_email' => '电子邮箱',
            'coupon_rate' => '票面利率',
            'is_taxpayer' => '一般纳税人',
            'vendor_address' => '地址',
            'social_code' => '社会编码',
            'deposit_bank' => '开户银行',
            'bank_num' => '银行卡',
            'register_capital' => '注册资本',
        ];
    }
}
