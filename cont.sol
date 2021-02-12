pragma solidity ^0.4.19;

contract ws {
    struct Driver {
        string name;
        uint stage;
        uint dtp;
        uint fine;
        uint insurancefee;
        uint balance;
    }
    struct Car {
        uint number;
        string validity;
        string category;
    }
    registrationCar[] public regCar;
    registrationDriver[] public regDriver;
    function _registrationCar (uint _number, string _validity, string _category) public {
        regCar.push(registrationCar(_number,_validity,_category));
    }
    function _registrationDriver (string _name, uint _stage, uint _dtp, uint _fine, uint _insurancefee, uint _balance) public {
        reg
    }
}
