<?php
namespace common\models;

use Yii;
use yii\base\Model;

/**
 * Login form
 */
class LoginForm extends Model
{
    public $user_name;
    public $password_hash;
    public $rememberMe = true;

    private $_user;


    /**
     * @inheritdoc
     */
    // 规则
    public function rules()
    {
        return [
            // username and password are both required
            [['user_name', 'password_hash'], 'required',"message"=>"{attribute}不能为空"],
            // rememberMe must be a boolean value
            ['rememberMe', 'boolean'],
            // password is validated by validatePassword()
            ['password_hash', 'validatePassword',"message"=>"{attribute}不能为空"],
        ];
    }

    public function attributeLabels()
    {
        return [
            'user_name'=> '用户名',
            'password_hash'=>'密码',
            'rememberMe'=>'记住我',
            
        ];
    }

    /**
     * Validates the password.
     * This method serves as the inline validation for password.
     *
     * @param string $attribute the attribute currently being validated
     * @param array $params the additional name-value pairs given in the rule
     */
    // 验密(属性 参数)
    // 验证用户密码的配对
    public function validatePassword($attribute, $params)
    {
        if (!$this->hasErrors()) {
            $user = $this->getUser();
            if (!$user || !$user->validatePassword($this->password_hash)) {
                $this->addError($attribute, '用户名或者密码有错误');
            }
        }
    }

    /**
     * Logs in a user using the provided username and password.
     *
     * @return boolean whether the user is logged in successfully
     */
    // 注册
//    验证通过  进行注册用户   并且保持登录
    public function login()
    {
        // validate检测rules
        if ($this->validate()) {
            // 保存一个月
            return Yii::$app->user->login($this->getUser(), $this->rememberMe ? 3600 * 24 * 30 : 0);
        } else {
            return false;
        }
    }

    /**
     * Finds user by [[username]]
     *
     * @return User|null
     */
    // 获取员工名
    protected function getUser()
    {
        if ($this->_user === null) {
            $this->_user = User::findByUsername($this->user_name);
        }
//        能够顺利获取用户名与密码值
//        echo '<pre>';
//        var_dump($this->_user);
//        echo '<pre>';
//        die();

        return $this->_user;
    }
}
