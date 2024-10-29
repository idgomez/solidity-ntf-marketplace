// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts@4.5.0/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts@4.5.0/security/ReentrancyGuard.sol";

contract Marketplace is ReentrancyGuard {

    address payable public immutable feeAccount;
    uint public immutable feePercent;
    uint public itemCount;

    mapping(uint => Item) public items;

    struct Item {
        uint itemId;
        IERC721 nft;
        uint tokenId;
        uint price;
        address payable seller;
        bool sold;
    }

    event Offered(
        uint itemId,
        address indexed nft,
        uint tokenId,
        uint price,
        address indexed seller
    );

    event Bought(
        uint itemId,
        address indexed nft,
        uint tokendId,
        uint price,
        address indexed seller,
        address indexed buyer
    );
    
    constructor(uint _feePercent) {
        feeAccount = payable(msg.sender);
        feePercent = _feePercent;
    }
}