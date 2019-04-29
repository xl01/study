<?php
namespace app\index\controller;

use app\base\controller\Base;

class Index extends Base
{
    public function index()
    {
    // return self::showReturnCodeWithOutData(1003);
    //手机页面添加项目
    // $validate_name = "base/ProjectEnty.edit";
    // $model_name='base/Project';
    //     halt(json($this->editData()));
    $param_list =[
        "company"=>"company/s",
        "address"=>"address/s",
        "contacts"=>"contacts/s",
        "jobs"=>"jobs/s",
        "mobile"=>"mobile/s",
        "tencent_code"=>"tencent_code/s",
        "desc"=>"desc/s",
        "event_key"=>"event_key/d",
        ];
        halt($param_list);
    }
    public function province(){
        return $this->fetch();
    }
    public function save(){
        $param=[
            'id'=>'id',
            'name'=>'name'
        ];
        // $validate_name = "base/ProjectEnty.edit";
        $model_name='base/Province';
        halt($this->editData($param,false,$model_name));
    }
}