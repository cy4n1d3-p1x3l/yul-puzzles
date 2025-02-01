// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract IsPrime {
    function main(uint256 x) external pure returns (bool) {
        assembly {
            // your code here
            // return true if x is a prime number, else false
            // 1. check if the number is a multiple of 2 or 3
            // 2. loop from 5 to x / 2 to see if it is divisible
            // 3. increment the loop by 2 to skip the even numbers
            let data:=0x01
            if eq(mod(x,2),0) {data:=0x00}
            if eq(mod(x,3),0) {data:=0x00}
            if eq(1,x) { data:=0x00 }
            for { let i:=5} lt(i,div(x,2)) {i:=add(i,2)}{
                if eq(mod(x,i),0) { data:=0x00 }
            }
            mstore(0x00,data)
            return(0x00,0x20)
        }
    }
}
