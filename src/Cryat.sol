// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Cryat {
  string private appName;
  uint256 private totalBalance;
  mapping(address => uint) public processedAmounts;
  event TokensReceived(address indexed _from, uint256 _amount);

  constructor(){
    appName="Cryat";
  }

  function getAppName() public view returns(string memory){
    return appName;
  }

  receive() external payable{
      processedAmounts[msg.sender]+=msg.value;
      totalBalance+=msg.value;
      emit TokensReceived(msg.sender, msg.value);
  }

  function getTotalBalance() public view returns (uint256){
    return totalBalance;
  }

  function getProcessedAmount(address account) external view returns(uint256){
    return processedAmounts[account];
  }
}
