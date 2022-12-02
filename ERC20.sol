// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract NDCoinERC20 {
event Transfer(address indexed from, address indexed to, uint tokens);

event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
string public constant name = "ND Coin";
string public constant symbol = "NDN";
uint8 public constant decimals = 18;
mapping(address => uint256) balances;

mapping(address => mapping (address => uint256)) allowed;
uint256 totalSupply_;
constructor(uint256 total) {
  totalSupply_ = total;
  balances[msg.sender] = totalSupply_;
}
function totalSupply() public view returns (uint256) {
  return totalSupply_;
}
  function balanceOf(address tokenOwner) public view returns (uint) {
   return balances[tokenOwner];
  }
  
   function transfer(address receiver, uint numTokens) public returns (bool) {
    require(numTokens <= balances[msg.sender]);
    balances[msg.sender] -= numTokens;
    balances[receiver] += numTokens;
    emit Transfer(msg.sender, receiver, numTokens);
    return true;
    }
    function approve(address delegate, uint numTokens) public returns (bool) {
    allowed[msg.sender][delegate] = numTokens;
    emit Approval(msg.sender, delegate, numTokens);
    return true;
}
function allowance(address owner, address delegate) public view returns (uint) {
    return allowed[owner][delegate];
}

}


// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract NDCoinERC20 {
event Transfer(address indexed from, address indexed to, uint tokens);

event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
string public constant name = "ND Coin";
string public constant symbol = "NDN";
uint8 public constant decimals = 18;
mapping(address => uint256) balances;

mapping(address => mapping (address => uint256)) allowed;
uint256 totalSupply_;
constructor(uint256 total) {
  totalSupply_ = total;
  balances[msg.sender] = totalSupply_;
}
function totalSupply() public view returns (uint256) {
  return totalSupply_;
}
  function balanceOf(address tokenOwner) public view returns (uint) {
   return balances[tokenOwner];
  }
  
   function transfer(address receiver, uint numTokens) public returns (bool) {
    require(numTokens <= balances[msg.sender]);
    balances[msg.sender] -= numTokens;
    balances[receiver] += numTokens;
    emit Transfer(msg.sender, receiver, numTokens);
    return true;
    }
    function approve(address delegate, uint numTokens) public returns (bool) {
    allowed[msg.sender][delegate] = numTokens;
    emit Approval(msg.sender, delegate, numTokens);
    return true;
}
function allowance(address owner, address delegate) public view returns (uint) {
    return allowed[owner][delegate];
}

}


