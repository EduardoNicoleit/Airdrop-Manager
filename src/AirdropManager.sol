// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import "@openzeppelin/token/ERC20/IERC20.sol"; // Import the ERC20 interface

contract AirdropManager {
    address public owner;
    IERC20 public token; // ERC20 token contract address

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    constructor(address _tokenAddress) {
        owner = msg.sender;
        token = IERC20(_tokenAddress);
    }

    // Function to distribute tokens to multiple addresses
    function distributeTokens(address[] memory recipients, uint256[] memory amounts) public onlyOwner {
        require(recipients.length == amounts.length, "Invalid input lengths");
        
        for (uint256 i = 0; i < recipients.length; i++) {
            token.transfer(recipients[i], amounts[i]);
        }
    }

    // Function to withdraw tokens accidentally sent to this contract
    function withdrawTokens(address _token, uint256 _amount) public onlyOwner {
        require(_token != address(token), "Cannot withdraw the main token of the contract");
        IERC20(_token).transfer(owner, _amount);
    }

    // Function to withdraw Ether accidentally sent to this contract
    function withdrawEther() public onlyOwner {
        payable(owner).transfer(address(this).balance);
    }

    // Function to receive Ether
    receive() external payable {
        // No logic needed here, Ether is simply received
    }

    // Function to receive ERC20 tokens
    function receiveTokens(address _from, uint256 _amount) external {
        require(msg.sender == address(token), "Only the token contract can call this function");
        require(_from != address(0), "Invalid sender address");
        
        // Transfer tokens from the sender to this contract
        token.transferFrom(_from, address(this), _amount);
    }
}
