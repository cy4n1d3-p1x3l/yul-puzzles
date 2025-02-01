// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract MaxOfArray {
    function main(uint256[] memory arr) external pure returns (uint256) {
        assembly {
            // your code here
            // return the maximum value in the array
            // revert if array is empty
            let size:=calldataload(0x24)
            if eq(size,0) { revert(0x00,0x00) }
            let max:=0x00
            for {let i:=0 } lt(i,size) { i:=add(i,1) }{
                if lt(max,calldataload(add(0x44,mul(i,0x20)))) {max:=calldataload(add(0x44,mul(i,0x20)))}
            }
            mstore(0x00,max)
            return(0x00,0x20)
        }
    }
}
