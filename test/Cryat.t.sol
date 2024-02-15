// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Cryat} from "../src/Cryat.sol";

contract CryatTest is Test {
    Cryat public cryat;

    function setUp() public {
        cryat = new Cryat();
    }

    function test_AppName() public {
        cryat.getAppName();
        assertEq(cryat.getAppName(), "Cryat");
    }

    function test_Flow() public {
        (bool sent, )=address(cryat).call{value: 1 ether}("");
        require(sent);
        assertEq(cryat.getTotalBalance(),1 ether);
        assertEq(cryat.getProcessedAmount(address(this)), 1 ether);
    }  
}
