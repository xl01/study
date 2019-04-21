<?php
namespace app\index\controller;

use think\Controller;
class Index extends Controller
{
    public function index()
    {
        cache('name','tom',3600);
        halt(cache('name'));
        // $city=model('common/city')->get(1);
        // halt($city->toArray());
        $province=model('common/Province')->get(1);

        $citys=$province->citys;

        foreach ($citys as $key => $value) {
            # code...
            var_dump($value['name']);
        }
    }

    public function login(){

        return $this->fetch();
    }
    public function test(){
        $data=['username'];
        halt($this->buildParam($data));
    }
    /**
     * 基类的转换
     * 
     */
    protected function buildParam($array){
        $data=[];
        if(is_array($array)){
            foreach ($array as $key => $value) {
                # code...
                $data[$value]=$this->request->param($value);
            }
        }
        return $data;
    }
}