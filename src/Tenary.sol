// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract Tenary {
    uint256 public result;

    function main(uint256 a, uint256 b, uint256 c) external {
        assembly {
            // your code here
            // store `10` in the storage variable `result` if a > b,
            // else if b > c, store `20`,
            // else, store `30`
            if gt(a,b) {sstore(0,10)}
            if or(eq(a,b),lt(a,b)) {
                if gt(b,c) {sstore(0,20)}
                if or(eq(b,c),lt(b,c)) {sstore(0,30)}
            }
        }
    }
}
