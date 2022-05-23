#!/bin/bash

cd contracts/circuits
mkdir mastermindVariation

if [ -f ./powersOfTau28_hez_final_10.ptau ]; then
    echo "powersOfTau28_hez_final_10.ptau already exists. Skipping."
else
    echo 'Downloading powersOfTau28_hez_final_10.ptau'
    wget https://hermez.s3-eu-west-1.amazonaws.com/powersOfTau28_hez_final_10.ptau
fi

echo "Compiling MastermindVariation.circom..."

# compile circuit

circom /home/metin/Documents/GitHub/week3/Part1/contracts/circuits/MastermindVariation.circom --r1cs --wasm --sym -o mastermindVariation    
snarkjs r1cs info mastermindVariation/MastermindVariation.r1cs

# Start a new zkey and make a contribution

snarkjs groth16 setup mastermindVariation/MastermindVariation.r1cs powersOfTau28_hez_final_10.ptau mastermindVariation/circuit_0000.zkey   
snarkjs zkey contribute mastermindVariation/circuit_0000.zkey mastermindVariation/circuit_final.zkey --name="3rd Contributor Name" -v -e="random text"
snarkjs zkey export verificationkey mastermindVariation/circuit_final.zkey mastermindVariation/MastermindVariation_verification_key.json    

# generate solidity contract
snarkjs zkey export solidityverifier mastermindVariation/circuit_final.zkey ../MastermindVariation_verifier.sol

cd ../..