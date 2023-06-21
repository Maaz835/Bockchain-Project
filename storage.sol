// SPDX-License-Identifier: unlicensed
pragma solidity ^0.8.0;
contract Storage {
uint data; 

function set(uint newdata) public{
data = newdata;
}

function get() public view returns (uint){
return data;
}
}
