// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;
contract LogisticSupply {
  address public owner;

  constructor() {
    owner = msg.sender;
  }
}