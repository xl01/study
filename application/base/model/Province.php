<?php
namespace app\base\model;

use app\base\model\Base;

class Province extends Base{

    public function citys(){
        return $this->hasMany('City');
    }
}