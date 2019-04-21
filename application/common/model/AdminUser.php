<?php
namespace app\common\model;

use think\Model;

class AdminUser extends Model
{
    protected $table = "my_admin_user";

    public function getInfoByOpenid($open_id){
        return $this->where('weixin_openid',$open_id)->find();
    }


    //方法一
    public function getDepartmentIdAttr($value,$data)
    {
    return $this->belongsTo('AdminDepartment','department_id','id')->where('id',$value)->value('name');
    }
    //方法二
    // public function getDepartmentIdAttr($value,$data)
    // {
    // return $this->belongsTo('AdminDepartment','department_id','id')->
    // where('id',$data['department_id'])->value('name');
    // }
}