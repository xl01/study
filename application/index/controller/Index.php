<?php
namespace app\index\controller;

class Index
{
    public function index()
    {
        $city=model('common/city')->get(1);
        halt($city->pp());
    }
}
