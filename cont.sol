pragma solidity ^0.4.19;

contract ws {
    uint id;
    int count = -1;
    struct confirmation{
        uint number;
        string validity;
        string category;
        uint valid;
    }
    struct Car {
        uint number;
        string validity;
        string category;
        string strah;
    }
    Car[] public regCar;
    confirmation[] public conf;
    
    function _registrationCar (uint _number, string _validity, string _category) public {
        uint valid = 0;
        conf.push(confirmation(_number,_validity,_category, valid));
        count = count + 1;
    }
    
    function confirm (uint _id) public {
        
    }
    function unfinfirm1 (uint _id) public {
        id = _id;
        delete conf[id];
        
    }
    function getlastnumber () public constant returns(int) {
        return count;
    }
    
    function getstrah (int _count) public  {
        count = _count;
    }
    
    
}
