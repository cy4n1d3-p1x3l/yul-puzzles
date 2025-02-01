// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteToDynamicArray {
    uint256[] writeHere;

    function main(uint256[] memory x) external {
        assembly {
            // your code here
            // store the values in the DYNAMIC array `x` in the storage variable `writeHere`
            // Hint: https://www.rareskills.io/post/solidity-dynamic
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

    function getter() external view returns (uint256[] memory) {
        return writeHere;
    }
}
