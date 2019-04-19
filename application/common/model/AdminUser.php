<?php
namespace app\common\model;

use think\Model;

class AdminUser extends Model{
    protected $table='my_admin_user';
    protected $name='adminUser';

    //定义根据 openid获取数据的方法
    public  function getInfoByOpenid($open_id){
        return $this->where('weixin_openid',$open_id)->find();
    }

    public function getDep(){
        return $this->belongsTo('AdminDepartment','department_id','id');
    }
    //复杂的关联获取器 方法一
    // public function getDepartmentIdAttr($value,$data){
    //     return $this->belongsTo('AdminDepartment','department_id','id')->where('id',$value)->value('name');
    // }
    //复杂的关联获取器 方法二
    public function getDepartmentIdAttr($value,$data){
        return $this->belongsTo('AdminDepartment','department_id','id')->where('id',$data['department_id'])->value('name');
    }
}