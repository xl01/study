<?php
namespace app\api\controller;

use think\Controller;
/**
* Created by PhpStorm.
* User: Mikkle
* Q Q:776329498
* Date: 2017/2/8
* Time: 0:23
*/
class AdminUser extends Controller{
    public function adminUserInfo(){
        $open_id='oO059v39zsst76IkuiYV3yMvc4Sw';
        $user_info=model('common/AdminUser')->getInfoByOpenid($open_id);
        return $user_info->getdata();
    }
    public function adminUserWithDepartment(){
        $open_id='oO059v39zsst76IkuiYV3yMvc4Sw';
        $user_info=model('common/AdminUser')->getInfoByOpenid($open_id);

        return $user_info->toArray();
        }
}