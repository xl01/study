<?php
namespace app\base\controller;

/**
* Created by PhpStorm.
* Power by Mikkle
* QQ:776329498
* Date: 2017/4/17
* Time: 9:33
*/
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
    public static function showReturnCodeWithOutData($code = '', $msg = '')
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
        if (is_array($array)) {
            foreach ($array as $item=>$value) {
                $data[$item] = $this->request->param($value);
            }
        }
        return $data;
    }
    /**
    * 快速修改
    * #User: Mikkle
    * #Email:776329498@qq.com
    * @param $array
    * @param bool|false $validate_name
    * @param string $model_name
    * @return array 返回code码
    */
    protected function editData($parameter = false, $validate_name = false, $model_name = false, $save_data = [])
    {
        if (empty($save_data)) {
            if ($parameter != false && is_array($parameter)) {
                $data = $this->buildParam($parameter);
            } else {
                $data = $this->request->post();
            }
        } else {
            $data = $save_data;
        }
        if (!$data) {
            return $this->showReturnCode(1004);
        }

        // if ($this->checkLoginToken() && !isset($data['uuid'])) {
        //     $data['uuid'] = $this->uuid;
        // }

        if ($validate_name != false) {
            $result = $this->validate($data, $validate_name);
            if (true !== $result) {
                return $this->showReturnCodeWithOutData(1003, $result);
            }
        }
        $model_edit = Loader::model($model_name);
        //dump($model_edit);
        if (!$model_edit) {
            return $this->showReturnCode(1010);
        }
        return $model_edit->editData($data);
    }
    
    protected function doModelAction(
        $param_data,
        $validate_name = false,
        $model_name = false,
        $action_name='editData'
    ) {
        if ($validate_name != false) {
            $result = $this->validate($param_data, $validate_name);
            if (true !== $result) {
                return $this->showReturnCodeWithOutData(1003, $result);
            }
        }
        $model_edit = Loader::model($model_name);
        if (!$model_edit) {
            return $this->showReturnCode(1010);
        }
        return $model_edit->$action_name($param_data);
    }
}
