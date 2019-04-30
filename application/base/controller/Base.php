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
use think\Loader;
use think\Config;

class Base extends Controller
{
    /**
    * 获取当前类名称
    * Power: Mikkle
    * Email：776329498@qq.com
    * @param bool|false $all
    * @return string
    */
    public function getClassName($all = false){
        return $all
        ? get_called_class()
        : basename(str_replace('\\', '/', get_called_class()),'.php')
        ;
    }
    /**
    * 获取返回码数组
    * Power by Mikkle
    * QQ:776329498
    * @param string $code
    * @param array $data
    * @param string $msg
    * @return array
    */
    static public function showReturnCode($code = '', $data = [], $msg =''){
        $return_data = [
            'code' => '500',
            'msg' => '未定义消息',
            'data' => $code == 1001 ? $data : [],
        ];
        if (empty($code)) return $return_data;
            $return_data['code'] = $code;
        if(!empty($msg)){
            $return_data['msg'] = $msg;
        }else if (isset(ReturnCode::$return_code[$code]) ) {
            $return_data['msg'] = ReturnCode::$return_code[$code];
        }
        return $return_data;
    }
    /**
    * 获取返回码数组别名函数 以json格式返回
    * Power: Mikkle
    * Email：776329498@qq.com
    * @param string $code
    * @param array $data
    * @param string $msg
    * @return array
    */
    static public function showJsonReturnCode($code = '', $data = [], $msg = ''){
        Config::set(['default_return_type' => 'json',]);
        return self::showReturnCode($code, $data, $msg);
    }
    /**
    * 获取返回码数组别名函数 无返回值
    * Power: Mikkle
    * Email：776329498@qq.com
    * @param string $code
    * @param string $msg
    * @return array
    */
    static public function showReturnCodeWithOutData($code = '', $msg = '')
    {
        return self::showReturnCode($code,[],$msg);
    }
    /**
    * 获取返回码数组别名函数 以json格式返回 无返回值
    * Power: Mikkle
    * Email：776329498@qq.com
    * @param string $code
    * @param string $msg
    * @return array
    */
    static public function showJsonReturnCodeWithOutData($code = '', $msg= ''){
        Config::set(['default_return_type' => 'json',]);
        return self::showReturnCode($code, [], $msg);
    }
    /**
    * 数据库字段 网页字段转换
    * 标识为数据库字段 值为浏览器提交字段
    * Power: Mikkle
    * Email：776329498@qq.com
    * @param $array 标识为数据库字段 值为浏览器提交字段
    * @param bool|false $uuid 是否追加UUID信息
    * @return array
    */
    protected function buildParam($array,$uuid=false)
    {
        $data=[];
        foreach( $array as $item=>$value ){
        $data[$item] = $this->request->param($value);
    }
    if ($uuid && isset($this->uuid)){
        $data['uuid'] = $this->uuid;
    }
        return $data;
    }
    /**
    * 检测是否登录
    * Power by Mikkle
    * QQ:776329498
    * @return bool
    */
    public function checkLoginGlobal()
    {
        $check_success = false;
        switch ($this->loginType) {
        case 1;
        case "session";
            $this->uuid = Session::get('uuid', 'Global');
            $this->member_info = Session::get('member_info', 'Global');
        if ($this->uuid && $this->member_info) {
            $check_success = true;
        }
        break;
        case 2;
        case "cache";
            $session_id_check = Cookie::get("session_id");
            $this->uuid = Cache::get("uuid_{$session_id_check}");
            $this->member_info = Cache::get("member_info_{$session_id_check}");
        if ($this->uuid && $this->member_info) {
            $check_success = true;
        }
            //刷新 缓存有效期
            Cache::set("uuid_{$session_id_check}", $this->uuid);
            Cache::set("member_info_{$session_id_check}", $this->member_info);
        break;
        case 3:
        case "redis":
            //这部分不方便共享 不好意思
        break;
        }
        return $check_success;
    }
    /**
    * 设置全局登录
    * #User: Mikkle
    * #Email:776329498@qq.com
    * #Date:
    */
    public function setLoginGlobal($member_info = [], $login_code = 0)
    {
        $set_success = false ;
        if ($member_info) {
        switch ($this->loginType) {
        case 1:
        case "session":
        Session::set('member_info', $member_info, 'Global');
        Session::set('uuid', $member_info['uuid'], 'Global');
        if ((Session::has("uuid", "Global"))) {
            $set_success = true;
        }
        break;
        case 2:
        case "cache":
        $session_id = $this->create_uuid("SN");
        Cookie::set("session_id", $session_id);
        Cache::set("member_info_$session_id", $member_info);
        Cache::set("uuid_$session_id", $member_info['uuid'])
        ;
        $session_id_check = Cookie::get("session_id");
        if ((Cache::get("uuid_{$session_id_check}"))) {
            $set_success = true;
        }
        break;
        case 3:case "redis":
        //这部分不方便共享 不好意思
        break;
        }
}
        if (!$set_success) return false;
            //保存登录记录
            $this->saveLoginInfo($member_info['uuid'],$login_code);
            return true;
        }
        /**
        * 全局退出
        * Power by Mikkle
        * QQ:776329498
        * @return bool
        */
        protected function logoutGlobal(){
            switch ($this->loginType) {
            case 1:
            case "session":
            Session::delete('uuid', 'Global');
            Session::delete('member_info', 'Global');
            break;
            case 2:
            case "cache":
            $session_id_check = Cookie::get("session_id");
            Cache::rm("uuid_{$session_id_check}");
            Cache::rm("member_info_{$session_id_check}");
            Cookie::delete("session_id");
            break;
            case 3:case "redis":
            //这部分不方便共享 不好意思
            break;
            }
                $this->member_info = null;
                $this->uuid = null;
                return true;
            }
        /**
        * 快速修改
        * Power: Mikkle
        * Email：776329498@qq.com
        * @param bool|false $parameter
        * @param bool|false $validate_name
        * @param bool|false $model_name
        * @param array $save_data
        * @return array
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
        if (!$data) return $this->showReturnCode(1004);
        //追加登录UUID
        if ($this->checkLoginGlobal() && !isset($data['uuid'])) $data['uuid']
        = $this->uuid;
        if ($validate_name != false) {
        $result = $this->validate($data, $validate_name);
        if (true !== $result) return $this->showReturnCodeWithOutData(1003,$result);
        }
        $model_edit = Loader::model($model_name);
        if (!$model_edit) return ['code' => 1010];
        return $model_edit->editData($data);
        }
        /**
        * 快速调用执行model函数
        * Power: Mikkle
        * Email：776329498@qq.com
        * @param $param_data
        * @param bool|false $validate_name
        * @param bool|false $model_name
        * @param string $action_name
        * @return array
        */
        protected function doModelAction($param_data,$validate_name = false, $model_name = false,$action_name='editData'){
            if ($validate_name != false) {
            $result = $this->validate($param_data, $validate_name);
            if (true !== $result) return $this->showReturnCode(1003, [], $result);
        }
        $model_edit = Loader::model($model_name);
        if (!$model_edit) return $this->showReturnCode(1010);
            return $model_edit->$action_name($param_data);
        }
}
