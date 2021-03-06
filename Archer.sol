
/**
 * This file was generated by TONDev.
 * TONDev is a part of TON OS (see http://ton.dev).
 */
pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import 'Unit.sol';

contract Archer is Unit{   
    
    int healthPoints = maxHP;

      function getAttackPower() public override view returns(uint){
        tvm.accept();
        return attackPower;
    }
     function getHealthPoints() public override view returns(int) {   
         tvm.accept();     
         return healthPoints;
    }   
}
