<?php
namespace app\api\controller;

class AdminUser extends Base{
    public function adminUserInfo(){
        $open_id='oO059v39zsst76IkuiYV3yMvc4Sw';
        $user_info=model('base/AdminUser')->getInfoByOpenid($open_id);
        return $user_info->getdata();
    }
    public function adminUserWithDepartment(){
        $open_id='oO059v39zsst76IkuiYV3yMvc4Sw';
        $user_info=model('base/AdminUser')->getInfoByOpenid($open_id);
        return $user_info->toArray();
        }
    }