// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract LkToken is ERC721, ERC721Enumerable, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;
    uint256 public mintRate = 0.01 ether;
    constructor() ERC721("LkToken", "LTK") {}

    function _baseURI() internal pure override returns (string memory) {
        return " https://ipfs.io/ipfs/Qmcob1MaPTXUZt5MztHEgsYhrf7R6G7wV8hpcweL8nEfgU/meka/1275";
    }

    function safeMint(address to) public   {
      //  require(msg.value >= mintRate, "Not enough ether sent.");
        
        _tokenIdCounter.increment();
        _safeMint(to, _tokenIdCounter.current());
    }

    // The following functions are overrides required by Solidity.

    function _beforeTokenTransfer(address from, address to, uint256 tokenId, uint256 batchSize)
        internal
        override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId, batchSize);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
    function withdraw() public onlyOwner {
        require(address(this).balance > 0, "Balance  is 0");
        payable(owner()).transfer(address(this).balance);
    }
}