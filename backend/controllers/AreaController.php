<?php

namespace backend\controllers;

use Yii;



/**
 * ClientController implements the CRUD actions for Client model.
 */
class AreaController extends Controller
{
    public function actions()
    {
        $actions=parent::actions();
        $actions['get-region']=[
            'class'=>\region\RegionAction::className(),
            'model'=>\common\models\Region::className()
        ];
        return $actions;
    }
}
