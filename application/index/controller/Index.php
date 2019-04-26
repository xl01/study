<?php
namespace app\index\controller;

use app\base\controller\Base;

class Index extends Base
{
    public function index()
    {
        // return self::showReturnCodeWithOutData(1003);

    //手机页面添加项目
    $validate_name = "base/ProjectEnty.edit";
    $model_name='base/Project';
    halt(json($this->editData()));
    }
    public function province(){
        return $this->fetch();
    }
    public function save(){
        $save_data=['name'];
        // $validate_name = "base/ProjectEnty.edit";
        $model_name='base/Province';
        halt($this->editData(false,false,$model_name,$save_data));
    }
}