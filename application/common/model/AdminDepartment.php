<?php
namespace app\common\model;

use think\Model;

class AdminDepartment extends Model{
    protected $table='my_admin_department';

    protected $name='admin_department';

    public  function getInfoByOpenid($open_id){
        return $this->where('weixin_openid',$open_id)->find();
    }
}