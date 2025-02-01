// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteTwoDynamicArraysToStorage {
    uint256[] public writeHere1;
    uint256[] public writeHere2;

    function main(uint256[] calldata x, uint256[] calldata y) external {
        assembly {
            // your code here
            // write the dynamic calldata array `x` to storage variable `writeHere1` and
            // dynamic calldata array `y` to storage variable `writeHere2`
            mstore(0x00,0)
            let off:=keccak256(0x00,0x20)
            let size:=calldataload(0x44)
            // if eq(size,0){
            //     return(0x00,0x00)
            // }
            sstore(0,size)
            for { let i:=0 } lt(i,size) { i:=add(i,1) } {
                sstore(add(off,i),calldataload(add(mul(i,0x20),0x64)))
            }
            mstore(0x00,1)
            off:=keccak256(0x00,0x20)
            let st:=calldataload(0x24)
            // st:=add(st,0x20)
            size:=calldataload(st)
            // if eq(size,0){
            //     return(0x00,0x00)
            // }
            sstore(1,size)
            for { let i:=0 } lt(i,size) { i:=add(i,1) } {
                sstore(add(off,i),calldataload(add(mul(i,0x20),add(st,0x20))))
            }
        }
    }
}
