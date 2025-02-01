// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteToPacked128 {
    uint128 public writeHere = 1;
    uint128 public someValue = 7;

    function main(uint256 v) external {
        assembly {
            // your code here
            // change the value of `writeHere` storage variable to `v`
            // be careful not to alter the value of `someValue` variable
            // Hint: storage slots are arranged sequentially. Determine the storage slot of `writeHere`
            // and use `sstore` to modify only the `writeHere` variable.
            let var:=sload(0)
            // var:=shl(128,var)
            // var:=shr(128,var)
            let mask:=0xffffffffffffffffffffffffffffffff00000000000000000000000000000000
            var:=and(var,mask)
            // let ff:=shl(128,v)
            let var2:=add(v,var)
            sstore(0x00,var2)
            // return(0x00,0x20)
        }
    }
}
