// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract ReadFromPacked128 {
    uint128 someValue;
    uint128 readMe;

    function setValue(uint128 v1, uint128 v2) external {
        someValue = v1;
        readMe = v2;
    }

    function main() external view returns (uint256) {
        assembly {
            // your code here
            // unpack and read data from the storage variable `readMe` of type uint128
            // then return it
            let var:=sload(0)
            // var:=shl(128,var)
            var:=shr(128,var)
            // var:=and(var,0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)
            mstore(0x00,var)
            return(0x00,0x20)
        }
    }
}
