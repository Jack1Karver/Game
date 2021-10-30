pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import "BaseUnitInterface.sol";
import "GameObject.sol";

contract BaseStation is GameObject{ 
    
    address[] units;
    constructor() public {
        tvm.accept();   
        this.setBaseAddress();
    }     

    function createUnit() external{
        units.push(msg.sender);
    }

    function setBaseAddress()external {
        baseAddress = msg.sender;
    }
    function getBase() public view returns(address){
        
        return baseAddress;
    }

    function returnArr() public view returns(address[]){               
        return units;
    }
   

    function dismissUnit(address addr) external {
        tvm.accept();  
        for(uint i = 0; i<units.length;i++)
            if(units[i]==addr){      
            address temp = units[units.length];
            units[units.length] = units[i];
            units[i] = temp;
            units.pop();
            }
            BaseUnitInterface gameUnit = BaseUnitInterface(addr);
            gameUnit.killForBase(baseAddress);
           
    }

    function kill(address enemyAddr) internal override {
        tvm.accept();
        for (uint i = 0; i<units.length;i++){
            BaseUnitInterface gameUnit = BaseUnitInterface(units[i]);
            gameUnit.killForBase(enemyAddr);
        }    
        enemyAddr.transfer(1, true, 160);
         
    }
}
