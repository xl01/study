<?php
namespace app\base\model;

use think\Model;

class Base extends Model{
/**
* 根据有Id修改信息 无Id 新增信息
* #User: Mikkle
* #Email:776329498@qq.com
* #Date:
* @param $data
* @return false|int|string
* @throws
*/
public function editData($data){
    if (isset($data['id'])){
    if (is_numeric($data['id']) && $data['id']>0){
        $save = $this->allowField(true)->save($data,[ 'id' =>
        $data['id']]);
    }else{
        $save = $this->allowField(true)->save($data);
    }
    }else{
        $save = $this->allowField(true)->save($data);
    }
    if ( $save == 0 || $save == false) {
        $res=[ 'code'=> 1009, 'msg' => '数据更新失败', ];
    }else{
        $res=[ 'code'=> 1001, 'msg' => '数据更新成功', ];
    }
        return $res;
    }
}