<?php
namespace app\index\controller;

use app\base\controller\Base;

class Index extends Base
{
    public function index()
    {
        return self::showReturnCodeWithOutData(1003);
    }
}