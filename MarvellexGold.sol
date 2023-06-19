// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract MarvellexGold is ERC20, ERC20Burnable, AccessControl {
    constructor(address initalAccount) ERC20("MarvellexGold", "MLXG") {
        require(initalAccount != address(0), "Initial Account is the zero address");
        _grantRole(DEFAULT_ADMIN_ROLE, initalAccount);
        _mint(initalAccount, 10000 * 10 ** decimals());
       
    }
    function mint(address to, uint256 amount) public onlyRole(DEFAULT_ADMIN_ROLE) {
        require(hasRole(DEFAULT_ADMIN_ROLE, _msgSender()), "MLXG: must have Admin role to mint");
        _mint(to, amount);
    }
    
}