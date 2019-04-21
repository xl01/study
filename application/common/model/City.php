<?php
namespace app\common\model;

use think\Model;

class City extends Model{


    protected function getProvinceIdAttr($value,$data){

        return model('common/Province')->where('id',$value)->value('name');
        // return $this->belongsto('Province')->where('id',$value)->value('name');
    }
    public function pp(){
        return $this->belongsto('Province');
    }
}