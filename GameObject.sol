pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import "GameObjectInterface.sol";

contract GameObject is GameObjectInterface {
    int  maxHP  = 500;
    address baseAddress;    
        
    int private healthPoints = maxHP;

    function getHealthPoints() virtual public view returns(int){ 
        tvm.accept();       
        return healthPoints;
    }
   
    
    function getKilled(address enemy)  private returns(string){
        tvm.accept();
        if(healthPoints <= 0){              
            kill(enemy);
            return "Object killed";
        }
        else
         return "Object is alive";
        
    }    

   
    function kill(address enemyAddr) virtual internal{
        enemyAddr.transfer(1, true, 160);
    }
    
    function acceptAttack(uint v) virtual external override{
        tvm.accept();
        healthPoints-= int(v);
        getKilled(msg.sender);
    }
}
