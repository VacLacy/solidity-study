pragma solidity ^0.4.18;
contract Const{
    uint SaleCost;
    uint HomeArea;
    uint Lifetime;
    string Adress;
    string Owner;
    string HomeType;
    address public owner;
}

contract AddHome is Const{
    function setSaleCost(uint newSaleCost) public {
        SaleCost = newSaleCost;
    } 
    function getSaleCost() public constant returns (uint) {
        return SaleCost;
    }
    function setAddress(string newAddress) public {
        Adress = newAddress;
    }
    function getAddress() public constant returns (string) {
        return Adress;
    }
    function setHomeArea(uint newHomeArea) public {
        HomeArea = newHomeArea;
    }
    function getHomeArea() public constant returns (uint) {
        return HomeArea;
    }
    function getOwner() public constant returns (string){
    return Owner;
    }
    function setObjectType(string newHomeType) public {
        HomeType = newHomeType;
    }
    function getObjectType() public constant returns (string){
        return HomeType;
    }
    function setLifetime(uint newLifetime) public {
            Lifetime = newLifetime;
    }
    function getLifetime() public constant returns (uint){
        return Lifetime;
    }
   //* Owner *//
    address public owner;
    function Ownable() public {
        owner = msg.sender;
    }
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    function transferOwnership(address newOwner) public onlyOwner {
        owner = newOwner;
    }
    //* End of Owner*//
    
    
    //*Simple Token*//
    
    string public constant name = "Simple Coin Token";
    string public constant symbol = "SCT";
    uint32 public constant decimals = 18;
    uint public totalSupply = 0;
    mapping (address => uint) balances;
    mapping (address => mapping(address => uint)) allowed;
    function mint(address _to, uint _value) public onlyOwner {
        assert(totalSupply + _value >= totalSupply && balances[_to] + _value >= balances[_to]);
        balances[_to] += _value;
        totalSupply += _value;
    }
    function balanceOf(address _owner) public constant returns (uint balance) {
        return balances[_owner];
    }
    function transfer(address _from,address _to, uint _value) public returns (bool success) {
        if(balances[_from] >= _value && balances[_to] + _value >= balances[_to]) {
            balances[_from] -= _value; 
            balances[_to] += _value;
            Transfer(_from, _to, _value);
            return true;
        } 
        return false;
    }
    // function transferFrom(address _from, address _to, uint _value) public returns (bool success) {
    //     if( allowed[_from][msg.sender] >= _value &&
    //         balances[_from] >= _value 
    //         && balances[_to] + _value >= balances[_to]) {
    //         allowed[_from][msg.sender] -= _value;
    //         balances[_from] -= _value; 
    //         balances[_to] += _value;
    //         Transfer(_from, _to, _value);
    //         return true;
    //     } 
    //     return false;
    // }
    function approve(address _spender, uint _value) public returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        return true;    
    }
    function allowance(address _owner, address _spender) public constant returns (uint remaining) {
        return allowed[_owner][_spender];
    }
    event Transfer(address indexed _from, address indexed _to, uint _value);
    event Approval(address indexed _owner, address indexed _spender, uint _value);
}
    //*End of Simple Token*//
