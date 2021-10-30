pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import "UnitDismissInterface.sol";
import "GameObject.sol";

contract Unit is GameObject {
    int private healthPoints;
    uint attackPower = 100;    
    address my;
    
    
    constructor() public{ 
        tvm.accept(); 
       
    }
    function write(address baseStation) public {
        tvm.accept();
        baseAddress = baseStation;
        UnitDismissInterface base = UnitDismissInterface(baseAddress);
        base.createUnit();
    }
    

    function getBase() public view returns(address){
        
        return baseAddress;
    }
    
     
    
    function getHealthPoints() virtual public override view returns(int){
        tvm.accept();
        return healthPoints;
    }
        
    function getAttackPower() virtual public view returns(uint){
        tvm.accept();
        return attackPower;
    }
    
    function attack(address addr) public {
        tvm.accept();  
        GameObjectInterface enemy = GameObjectInterface(addr);
        enemy.acceptAttack(attackPower);
    }

    function kill(address enemy) internal override{
        tvm.accept();  
        UnitDismissInterface base = UnitDismissInterface(baseAddress);      
        base.dismissUnit(msg.sender);
        enemy.transfer(1, true, 160);
    }

    function killForBase(address enemy) external  {
        require(baseAddress == msg.sender);
        tvm.accept();        
        enemy.transfer(1, true, 160);
          
    }
}
