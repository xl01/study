<?php
namespace app\api\controller;

class Search extends Base{
    public function returnCode(){
        return self::showReturnCode(1001);
    }
}