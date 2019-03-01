<?php
return [
    'id' => 'app-common-tests',
    'basePath' => dirname(__DIR__),
    'components' => [
        'emp' => [
            'class' => 'yii\web\User',
            'identityClass' => 'common\models\User',
        ],
        'request' => [
            'cookieValidationKey' => 'test',
        ],
    ],
];
