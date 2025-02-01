// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract ReturnOppositeBool {
    function main(bool _bool) external pure returns (bool) {
        assembly {
            // your code here
            // return the opposite of `_bool`
            let val:=calldataload(0x04)
            val:=xor(val,shl(0,0x01))
            mstore(0x00,val)
            return(0x00,0x20)
        }
    }
}
