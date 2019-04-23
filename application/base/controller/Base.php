<?php
/**
* Created by PhpStorm.
* Power by Mikkle
* QQ:776329498
* Date: 2017/4/17
* Time: 9:33
*/
namespace app\base\controller;

use think\Controller;

class Base extends Controller
{
    /**
    * Power by Mikkle
    * QQ:776329498
    * @param string $code
    * @param array $data
    * @param string $msg
    * @return array
    */
    public static function showReturnCode($code = '', $data = [], $msg ='')
    {
        $return_data = [
            'code' => '500',
            'msg' => '未定义消息',
            'data' => $code == 1001 ? $data : [],
        ];
       
        if (empty($code)) {
            return $return_data;
        }
        $return_data['code'] = $code;

        if (!empty($msg)) {
            $return_data['msg'] = $msg;
        } elseif (isset(ReturnCode::$return_code[$code])) {
            $return_data['msg'] = ReturnCode::$return_code[$code];
        }
        return json($return_data);
    }
    public static function showReturnCodeWithOutData($code = '', $msg = '
    ')
    {
        return self::showReturnCode($code, [], $msg);
    }
    /*
    * #User: Mikkle
    * #Email:776329498@qq.com
    * #Date:
    * @param $array 转化数组
    * @return 返回数据数组
    */
    protected function buildParam($array)
    {
        $data=[];
        if (is_array($array)){
        foreach( $array as $item=>$value ){
        $data[$item] = $this->request->param($value);
        }
        }
        return $data;
    }
}
