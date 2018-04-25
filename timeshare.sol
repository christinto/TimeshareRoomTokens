pragma solidity ^0.4.20;

import "./ownable.sol";
import "./safemath.sol";
import "./tokens.sol";

contract Timeshare is Ownable, ERC20 {
    
    using SafeMath for uint256;
    
    string public symbol;
    string public  name;
    uint8 public decimals;
    uint public _totalSupply;

    mapping(address => uint) balances;
    mapping(address => mapping(address => uint)) allowed;

    // ------------------------------------------------------------------------
    // Constructor
    // ------------------------------------------------------------------------
    function Timeshare() public {
        //
        symbol = "UTTOK";
        name = "Utility tokens";
        decimals = 18;
        _totalSupply = 180e6;
        balances[0x5A86f0cafD4ef3ba4f0344C138afcC84bd1ED222] = _totalSupply;
        Transfer(address(0), 0x5A86f0cafD4ef3ba4f0344C138afcC84bd1ED222, _totalSupply);
    }
    
}
