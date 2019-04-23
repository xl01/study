<?php
namespace app\base\model;

use think\Model;

class Province extends Model{

    public function citys(){
        return $this->hasMany('City');
    }
}