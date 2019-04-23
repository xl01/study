<?php
namespace app\base\model;

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
        return Model('base/AdminDepartment')->where('id',$data['department_id'])->value('name');
    // return $this->belongsTo('AdminDepartment','department_id','id')->where('id',$value)->value('name');
    }
    //方法二
    // public function getDepartmentIdAttr($value,$data)
    // {
    // return $this->belongsTo('AdminDepartment','department_id','id')->
    // where('id',$data['department_id'])->value('name');
    // }
    //复杂的关联获取器 方法二
    // public function getDepartmentIdAttr($value,$data){
    //     // return $this->belongsTo('AdminDepartment','department_id','id');
    //     // return $this->belongsTo('AdminDepartment','department_id','id')->where('id',$data['department_id'])->value('name');
    //     return Model('common/AdminDepartment')->where('id',$data['department_id'])->value('name');
    // }
}