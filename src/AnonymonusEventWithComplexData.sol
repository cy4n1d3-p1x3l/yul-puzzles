// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract AnonymonusEventWithComplexData {
    enum Gender {
        Male,
        Female,
        Trans
    }

    struct Person {
        string name;
        uint256 age;
        Gender gender;
    }

    // EMIT ME!!!
    event MyEvent(address indexed emitter, bytes32 indexed id, Person person);

    function main(address emitter, bytes32 id, Person memory person) external {
        assembly {
            // your code here
            // emit the `MyEvent(address,bytes32,(string,uint256,uint8))` event.
            // Anonymous events don't have the event signature (topic0) included.
            // Hint: how the `Person` struct is encoded in mem:
            //          - string offset
            //          - string length offset
            //          - age
            //          - gender
            //          - name length
            //          - name
            let len:=calldataload(0x44)
            let name:=calldataload(0x64)
            let age:=calldataload(0x84)
            let gen:=calldataload(0xa4)
            mstore(0x00,0x20)
            mstore(0x20,0x60)
            mstore(0x40,age)
            mstore(0x60,gen)
            mstore(0x80,len)
            mstore(0xa0,name)
            // mstore(0x00,len)
            // mstore(0x20,name)
            // mstore(0x40,age)
            // mstore(0x60,gen)
            log3(0x00,0xc0,0,emitter,id)
        }
    }
}
