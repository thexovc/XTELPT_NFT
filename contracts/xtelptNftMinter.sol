// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts@4.6.0/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.6.0/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts@4.6.0/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts@4.6.0/utils/Counters.sol";

contract xtelptNFT is ERC721, ERC721Enumerable, ERC721URIStorage{
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

     struct ownedNFT {
        string uri;
     }

    mapping (address => ownedNFT[]) public myNFT;
   
    constructor() ERC721("XTELPT COLLECTIBLES", "XFT") {}

    function safeMint(address to, string memory uri, uint256 num) public{
        for(uint256 i = 0; i < num; i++){
            uint256 tokenId = _tokenIdCounter.current();

            _tokenIdCounter.increment();
            _safeMint(to, tokenId);
            _setTokenURI(tokenId, uri);

            ownedNFT memory NewNFT;
            NewNFT.uri = uri;
      
            myNFT[msg.sender].push(NewNFT);

        }
    }

    // The following functions are overrides required by Solidity.

    function _beforeTokenTransfer(address from, address to, uint256 tokenId)
        internal
        override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }


    function getMyNFT(address _addr) public view returns (ownedNFT [] memory) {
        return myNFT[_addr];
    }

}