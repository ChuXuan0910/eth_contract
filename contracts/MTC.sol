// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

contract MTC {
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;

    mapping(address => uint256) balances;
    mapping(address => mapping(address => uint256)) allowed;

    constructor(uint256 _initialAmount, string memory _tokenName, uint8  _decimalUnits, string memory _tokenSymbol) public {
        // 设置初始总量
        totalSupply = _initialAmount * 10 ** uint256(_decimalUnits);
        // 初始token数量给予消息发送者，因为是构造函数，所以这里也是合约的创建者
        balances[msg.sender] = totalSupply;

        name = _tokenName;
        decimals = _decimalUnits;
        symbol = _tokenSymbol;
    }

    function increase() public returns (bool success) {
        require(msg.sender);
        return true;
    }

    function balanceOf(address _owner) public returns (uint256 balance) {
        return balances[_owner];
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balances[msg.sender] >= _value && balances[_to] + _value > balances[_to]);
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value);

        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(balances[_from] >= _value && allowed[_from][msg.sender] >= _value);
        balances[_from] -= _value;
        allowed[_from][msg.sender] -= _value;
        balances[_to] += _value;
        emit Transfer(_from, _to, _value);

        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowed[msg.sender][_spender] += _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}
