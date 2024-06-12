// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;
contract LogisticSupply {
  address public owner;
  uint public medCount = 0;
  uint public rawMatCount = 0;
  uint public manuCount = 0;
  uint public distCount = 0;
  uint public retailCount = 0;

  constructor() {
    owner = msg.sender;
  }

  modifier onlyOwner(){
    require(owner==msg.sender, "You are not the owner");
    _;
  }

  enum STAGE {
    Init,
    RawMaterialSupply,
    Manufacture,
    Distribution,
    Retail,
    Sold
  }
}