// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.7.6;

import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import "openzeppelin-solidity/contracts/access/Ownable.sol";
import "openzeppelin-solidity/contracts/token/ERC20/ERC20Burnable.sol";

contract Floppy is ERC20("Floppy", "FLP"), ERC20Burnable, Ownable {
    uint256 private cap = 50_000_000_000 * 10**uint256(18);
    
    constructor() {
        _mint(msg.sender, cap);
        transferOwnership(msg.sender);
    }

    function mint(address to, uint256 amount) public onlyOwner {
        require(
            ERC20.totalSupply() + amount <= cap,
            "Floppy: cap exceeded"
        );
        _mint(to, amount);
    }
}
