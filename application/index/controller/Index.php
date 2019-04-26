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
}