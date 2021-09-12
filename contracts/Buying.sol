pragma solidity ^0.5.0;

contract Buying {
    address[16] public buyers;
    // Buying A shirt 
    function buy(uint prodId) public returns (uint) {
    require(prodId >= 0 && prodId <= 100);

    buyers[prodId] = msg.sender;

    return prodId;
    }
    // Retrieving the Buyers
    function getBuyers() public view returns (address[16] memory) {
    return buyers;
    }
}