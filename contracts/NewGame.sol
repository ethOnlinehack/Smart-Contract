//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract GameItems is ERC1155, ContextMixin, NativeMetaTransaction {
    // Contract name
    string public name;
    address public owner;
    mapping(uint256 => string) public uriOf;

    constructor(string memory name_, address _owner) ERC1155("") {
        name = name_;
        owner - _owner;
    }

    modifier onlyOwner() {
        require(_msgSender() == owner);
        _;
    }

    function setURI(uint256 _tokenID, string memory _uri) onlyOwner {
        uriOf[tokenID] = _uri;
    }

    /**
     * As another option for supporting trading without requiring meta transactions, override isApprovedForAll to whitelist our account
     */
    function isApprovedForAll(address _owner, address _operator)
        public
        view
        override
        returns (bool isOperator)
    {
        if (_operator == address(_owner)) {
            return true;
        }

        return ERC1155.isApprovedForAll(_owner, _operator);
    }

    function mint(address to,
        uint256 id,
        uint256 amount,
        bytes memory data) external onlyOwner {
        
        ERC1155._mint(address to,
        uint256 id,
        uint256 amount,
        bytes memory data)
    }
}
