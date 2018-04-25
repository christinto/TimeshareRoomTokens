pragma solidity ^0.4.20;

import "./ownable.sol";
import "./safemath.sol";
import "./tokens.sol";

contract RoomToken is Ownable, ERC721 {
    
    using SafeMath for uint256;    
    
    event BuyRoom(uint roomId, string date, uint dna);

    mapping (uint => address) public roomsToOwner;
    mapping (address => uint) ownerRoomsCount;
    uint256 price = 2500;

    // ERC721
    string public symbol;
    string public  name;
    uint public _totalSupply;
    mapping(address => uint) balances;
    mapping(address => mapping(address => uint)) allowed;
    // ------------------------------------------------------------------------
    // Constructor
    // ------------------------------------------------------------------------
    function RoomToken() internal {
        //
        symbol = "RMTOK";
        name = "Room tokens";
        _totalSupply = 23750;
        balances[owner] = _totalSupply;
        Transfer(address(0), owner, _totalSupply);
    }
    
    function ChangePrice(uint256 newPrice) public onlyOwner {
        require(newPrice > 0);
        //
        price = newPrice;
    }
    
}
