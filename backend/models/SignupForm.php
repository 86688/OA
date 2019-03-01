<?php
namespace frontend\models;

use yii\base\Model;
use common\models\User;

/**
 * Signup form
 */
class SignupForm extends Model
{
    public $username;
    public $password_hash;


    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            ['user_name', 'trim'],
            ['user_name', 'required'],
            ['user_name', 'unique', 'targetClass' => '\common\models\User', 'message' => 'This username has already been taken.'],
            ['user_name', 'string', 'min' => 2, 'max' => 255],

            ['password_hash', 'required'],
            ['password_hash', 'string', 'min' => 6],
        ];
    }

    /**
     * Signs emp up.
     *
     * @return User|null the saved model or null if saving fails
     */
    public function signup()
    {
        if (!$this->validate()) {
            return null;
        }
//        对应数据表user
        $user = new User();
//        提交的数据 用户名
        $user->user_name = $this->user_name;
//        密码
        $user->setPassword($this->password_hash);
//        验证安全
        $user->generateAuthKey();
//        保存至数据库
        return $user->save() ? $user : null;
    }
}
