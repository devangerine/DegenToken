// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import “@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol”

contract DegenToken is ERC20, Ownable {

    string itemList = "\n 1.Rapi  \n 2.Anis  \n 3.Neon \n  4.Marian";

    constructor() ERC20("Degen", "DGN") {}

        function mint(address to, uint256 amount) public onlyOwner {
            _mint(to, amount);
    }

    function decimals() override public pure returns(uint8){
        return 0;
    }

    function displayShopItems() public view returns (string memory){
        return itemList;
    }

   // function buyFigure(uint256 _itemNumber) public 

   // create a global variable to store itemInventory of user

   // import burnable 

}
