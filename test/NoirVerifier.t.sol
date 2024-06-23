pragma solidity ^0.8.17;

// import "forge-std/Test.sol";
import "../contracts/NoirVerifier.sol";
import "../contracts/Starter.sol";
import {Test, Vm, console} from "forge-std/Test.sol";

contract StarterTest is Test {
    Starter public starter;
    UltraVerifier public verifier;

    bytes32[] public correct = new bytes32[](3);
    bytes32[] public wrong = new bytes32[](1);

    function setUp() public {
        verifier = new UltraVerifier();
        starter = new Starter(verifier);

        correct[0] = "123";
        correct[1] = "456";
        correct[2] = "19620391833206800292073497099357851348339828238212863168390691880932172496143";
    }

    function testVerifyProof() public {
        string memory proof = vm.readLine("./proofs/InitialNftOffering.proof");
        bytes memory proofBytes = vm.parseBytes(proof);
        starter.verifyEqual(proofBytes, correct);
    }

    function test_wrongProof() public {
        vm.expectRevert();
        string memory proof = vm.readLine("./proofs/InitialNftOffering.proof");
        bytes memory proofBytes = vm.parseBytes(proof);
        starter.verifyEqual(proofBytes, wrong);
    }
}
