// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IVerifier {
    function verifyProof(uint256[2] memory a, uint256[2][2] memory b, uint256[2] memory c, uint256[1] memory input)
        external
        view
        returns (bool);
}

contract PrivateBidsAuction {
    IVerifier public verifier;
    address public highestBidder;
    uint256 public highestBid;

    mapping(address => bool) public hasBidded;

    event NewHighestBid(address indexed bidder, uint256 amount);

    constructor(address _verifier) {
        verifier = IVerifier(_verifier);
    }

    function submitBid(
        uint256[2] memory a,
        uint256[2][2] memory b,
        uint256[2] memory c,
        uint256[1] memory input,
        uint256 bidHash
    ) external {
        require(!hasBidded[msg.sender], "Already bidded");
        require(verifier.verifyProof(a, b, c, input), "Invalid proof");

        uint256 bidAmount = input[0];
        require(bidAmount > highestBid, "Bid is not higher than current highest bid");

        highestBid = bidAmount;
        highestBidder = msg.sender;
        hasBidded[msg.sender] = true;

        emit NewHighestBid(msg.sender, bidAmount);
    }
}
