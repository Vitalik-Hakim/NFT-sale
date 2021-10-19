pragma solidity ^0.7.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Buying.sol";

contract TestBuying {
    // The address of the buying contract to be tested
    Buying buying = Buying(DeployedAddresses.Buying());

    // The id of the pet that will be used for testing
    uint expectedPetId = 8;

    //The expected owner of adopted pet is this contract
    address expectedAdopter = address(this);
    // Testing the adopt() function
    function testUserCanAdoptPet() public {
        uint returnedId = buying.buy(expectedPetId);

  Assert.equal(returnedId, expectedPetId, "Buying of the expected merch should match what is returned.");
  }

  // Testing retrieval of a single pet's owner
    function testGetAdopterAddressByPetId() public {

        address adopter = buying.buyers(expectedPetId);

    Assert.equal(adopter, expectedAdopter, "Owner of the expected pet should be this contract");
}
    // Testing retrieval of all pet owners
    function testGetAdopterAddressByPetIdInArray() public {
    // Store adopters in memory rather than contract's storage
        address[16] memory adopters = buying.getBuyers();

    Assert.equal(adopters[expectedPetId], expectedAdopter, "Owner of the expected pet should be this contract");
}

}
