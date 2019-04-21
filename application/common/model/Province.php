<?php
namespace app\common\model;

use think\Model;

class Province extends Model{

    public function citys(){
        return $this->hasMany('City');
    }
}