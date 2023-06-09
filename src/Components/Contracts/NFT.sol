// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract NFT is ERC721URIStorage {
    uint public tokenCount;
    address public originalCreator; // variable to store the original creator of the NFT

    constructor() ERC721("DApp NFT", "DAPP"){}

    function mint(string memory _tokenURI,address creatorAddress) external returns(uint) {
        originalCreator = creatorAddress;
        tokenCount ++;
        _safeMint(msg.sender, tokenCount);
        _setTokenURI(tokenCount, _tokenURI);
        return(tokenCount);
    }
}
