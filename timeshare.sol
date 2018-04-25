pragma solidity ^0.4.20;

import "./ownable.sol";
import "./safemath.sol";
import "./tokens.sol";
import "./roomtoken.sol";

contract Timeshare is Ownable, RoomToken, ERC20 {
    
    using SafeMath for uint256;
    
    struct RoomToken {
        string date;
        uint64 roomNumber;
        bool locked;
    }
    
    RoomToken[] public rooms;

    // ERC20
    string public symbol;
    string public  name;
    uint8 public decimals;
    uint public _totalSupply;
    mapping(address => uint) balances;
    mapping(address => mapping(address => uint)) allowed;
    // ------------------------------------------------------------------------
    // Constructor
    // ------------------------------------------------------------------------
    function Timeshare() internal {
        //
        symbol = "UTTOK";
        name = "Utility tokens";
        decimals = 18;
        _totalSupply = 180e6;
        balances[owner] = _totalSupply;
        Transfer(address(0), owner, _totalSupply);
    }

    function buyRoomToken(string _date, uint64 _roomNumber) public {
        require(balances[msg.sender] == price);
        //
        uint id = rooms.push(RoomToken(_date, _roomNumber, true));
        roomsToOwner[id] = msg.sender;
        balances[msg.sender] -= price;
        ownerRoomsCount[msg.sender]++;
        BuyRoom(id, _date, _roomNumber);
    }    
    
}
