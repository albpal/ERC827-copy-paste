pragma solidity ^0.4.19;

contract ERC20Basic {
  function totalSupply() public view returns (uint256);
  function balanceOf(address who) public view returns (uint256);
  function transfer(address to, uint256 value) public returns (bool);
  event Transfer(address indexed from, address indexed to, uint256 value);
}

contract ERC20 is ERC20Basic {
  function allowance(address owner, address spender) public view returns (uint256);
  function transferFrom(address from, address to, uint256 value) public returns (bool);
  function approve(address spender, uint256 value) public returns (bool);
  event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract AChainLogic{
    function AChainLogic() public {}
    
    function PayToExecute() public returns (bool) {
        ERC20 tokenContract = ERC20(msg.sender);
        uint256 allowedValue = tokenContract.allowance(tx.origin, this);
        require(allowedValue == 50);
        tokenContract.transferFrom(tx.origin, this, allowedValue);
        openTheDoor();
    }
    
    function openTheDoor() private returns (bool)
    {
        return true;
    }
    
}
