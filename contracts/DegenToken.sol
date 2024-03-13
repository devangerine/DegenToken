// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";


contract DegenToken is ERC20, ERC20Burnable, Ownable {

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

    mapping(address => uint256[]) public userInventory;

    function redeemItem(uint256 itemNumber) public {
        updateInventory(_msgSender(), itemNumber);
    }

    function updateInventory(address _address, uint256 item) private{
        userInventory[_address].push(item);
    }

    function displayInventory() public view returns (uint256[] memory){
        return userInventory[_msgSender()];
    }

}
