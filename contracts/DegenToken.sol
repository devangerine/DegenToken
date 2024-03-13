// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";


contract DegenToken is ERC20, ERC20Burnable, Ownable {

    //Redeemable Items List 
    string itemList = "\n 1.Rapi  \n 2.Anis  \n 3.Neon \n  4.Marian";
    uint256 redeemPrice = 100;

    constructor() ERC20("Degen", "DGN") {}

        function mint(address to, uint256 amount) public onlyOwner {
            _mint(to, amount);
    }

    //Decimals function to set decimals to zero for simplicities sake
    function decimals() override public pure returns(uint8){
        return 0;
    }

    //Function to display Shop Items
    function displayShopItems() public view returns (string memory){
        return itemList;
    }

    //Mapping for the item inventory of each user
    mapping(address => uint256[]) private userInventory;

    //Function to redeem items from the shop
    function redeemItem(uint256 _itemNumber) public {
        require(balanceOf(_msgSender())>= redeemPrice, "Your balance of Degen tokens is insufficient.");
        updateInventory(_msgSender(), _itemNumber);
    }

    //Function to update the inventory of users upon redemption of items using tokens
    function updateInventory(address _address, uint256 item) private{
        userInventory[_address].push(item);
    }

    //Function to display the inventory of the user
    function displayInventory() public view returns (uint256[] memory){
        return userInventory[_msgSender()];
    }

    //Function to burn tokens from users balance
    function burnTokens(uint256 _amount) external{
        require(balanceOf(_msgSender())>= _amount, "Your balance of Degen tokens is insufficient.");
        approve(_msgSender(), _amount);
        burn(_amount);
    }

    //Function to transfer tokens from user's balance to a receiving address
    function transferTokens(address _receivingAddress, uint256 _amount) external{
        require(balanceOf(_msgSender())>= _amount, "Your balance of Degen tokens is insufficient.");
        approve(_msgSender(), _amount);
        transferFrom(_msgSender(), _receivingAddress, _amount);
    }
    

}
