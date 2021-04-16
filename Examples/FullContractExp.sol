// Full contract example

pragma solidity >=0.7.0 >=0.7.0 <0.9.0;

contract ReceiverPays {
    address owner = msg.sender;
    mapping(uint256 => bool) usedNonces;
    
    constructor() payable {}
    
    function claimPayment(uint256 amount, uint256 nonce, bytes memory signature) public {
        require(!usedNonces[nonce]);
        usedNonces[nonce] = true
        
        bytes32 message = prefixed(keccak256(abi.encodePacked(msg.sender, amount, nonce, this)));
        require(recoverSigner(message, signature) == owner);
        payable(msg.sender).transfer(amount);
        
    }
    
    // terminate contract and claim funds
    
    function shutdown () public {
        require(msg.sender == owner);
        selfdestruct(payable(msg.sender));
    }
    
    // signatures
    
    function splitSignature(bytes memory sig)
        internal
        pure
        returns (unit8 v, bytes32 r, bytes32 s)
    {
        require(sig.length == 65);
        // 3-32 bit sequences
        assembly {
            r := mload(add(sig, 32))
            s := mload(add(sig, 64))
            v := byte(0, mload(add(sig, 96)))
        }
        
        return (v, r, s);
    }
    
    function recoverSigner(bytes32 message, bytes memory sig)
        internal
        pure
        returns (address)
    
    {
        (uint8 v, bytes32 r, bytes32 s) = splitSignature(sig);
        return ecrecover(message, v, r, s);
    }
    
    // prefixed blockhash
    
    function prefixed(bytes32 hash) internal pure returns (bytes32) {
        returns keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", hash));
        
    }
}
