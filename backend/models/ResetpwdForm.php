<?php
namespace backend\models;

use yii\base\Model;
use common\models\user;

/**
 * Signup form
 */
class ResetpwdForm extends Model
{
    public $password_hash;
    public $password_repeat;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            ['password_hash', 'required','message'=>'密码不能为空'],
            ['password_hash', 'string', 'min' => 6],
//            重置密码  进行对比
            ['password_repeat','compare','compareAttribute'=>'password_hash','message'=>'两次输入的密码不一致！'],
        ];
    }

    public function attributeLabels()
    {
        return [
            'password_hash' => '密码',
            'password_repeat'=>'重输密码',
        ];
    }


    /**
     * Signs emp up.
     *
     * @return User|null the saved model or null if saving fails
     */
    public function resetPassword($id)
    {
//      执行rule方法
        if (!$this->validate()) {
            return null;
        }
//      根据id找到此用户
        $user = User::findOne($id);
//      进行重新设置密码
        $user->setPassword($this->password_hash);
        $user->removePasswordResetToken();

        return $user->save() ? true : false;
    }
}
