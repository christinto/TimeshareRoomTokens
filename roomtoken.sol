pragma solidity ^0.4.20;

import "./ownable.sol";
import "./safemath.sol";
import "./tokens.sol";

contract Timeshare is Ownable, ERC721 {
    
    using SafeMath for uint256;
    
    string public symbol;
    string public  name;
    uint public _totalSupply;
    uint256 price = 2500;

    mapping(address => uint) balances;
    mapping(address => mapping(address => uint)) allowed;
    
    struct RoomToken {
        string date;
        uint64 roomNumber;
    }

    // ------------------------------------------------------------------------
    // Constructor
    // ------------------------------------------------------------------------
    function Timeshare() public {
        //
        symbol = "RMTOK";
        name = "Room tokens";
        _totalSupply = 23750;
        balances[0x5A86f0cafD4ef3ba4f0344C138afcC84bd1ED222] = _totalSupply;
        Transfer(address(0), 0x5A86f0cafD4ef3ba4f0344C138afcC84bd1ED222, _totalSupply);
    }
    
    function ChangePrice(uint256 newPrice) public onlyOwner {
        require(newPrice > 0);
        price = newPrice;
    }
}
