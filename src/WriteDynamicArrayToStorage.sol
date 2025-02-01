// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteDynamicArrayToStorage {
    uint256[] public writeHere;

    function main(uint256[] calldata x) external {
        assembly {
            // your code here
            // write the dynamic calldata array `x` to storage variable `writeHere`
            mstore(0x00,0)
            let off:=keccak256(0x00,0x20)
            let size:=calldataload(0x24)
            if eq(size,0){
                return(0x00,0x00)
            }
            sstore(0,size)
            for { let i:=0 } lt(i,size) { i:=add(i,1) } {
                sstore(add(off,i),calldataload(add(mul(i,0x20),0x44)))
            }
        }
    }
}
