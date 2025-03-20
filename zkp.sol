// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ZKPNFT {
    address public owner;
    uint256 public totalSupply;
    mapping(uint256 => address) public tokenOwners;
    mapping(address => bool) public verifiedUsers;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    modifier onlyVerified() {
        require(verifiedUsers[msg.sender], "Not verified");
        _;
    }

    function setVerification(address user, bool status) external onlyOwner {
        verifiedUsers[user] = status;
    }

    function mintNFT() external onlyVerified {
        uint256 tokenId = totalSupply + 1;
        tokenOwners[tokenId] = msg.sender;
        totalSupply = tokenId;
    }
}
