
pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import "Unit.sol";

contract Warrior is Unit{ 

    int private healthPoints;
    
      function getAttackPower() public override view returns(uint){
        tvm.accept();
        return attackPower;
    }
     function getHealthPoints() public override view returns(int) {   
         tvm.accept();     
         return healthPoints;
    }   
}
