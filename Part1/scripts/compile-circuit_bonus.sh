#!/bin/bash

cd contracts/circuits
mkdir Bonus

if [ -f ./powersOfTau28_hez_final_10.ptau ]; then
    echo "powersOfTau28_hez_final_10.ptau already exists. Skipping."
else
    echo 'Downloading powersOfTau28_hez_final_10.ptau'
    wget https://hermez.s3-eu-west-1.amazonaws.com/powersOfTau28_hez_final_10.ptau
fi

echo "Compiling bonus.circom..."

# compile circuit

circom /home/metin/Documents/GitHub/week3/Part1/contracts/circuits/bonus.circom --r1cs --wasm --sym -o Bonus
snarkjs r1cs info Bonus/bonus.r1cs

# Start a new zkey and make a contribution

snarkjs groth16 setup Bonus/bonus.r1cs powersOfTau28_hez_final_10.ptau Bonus/circuit_0000.zkey
snarkjs zkey contribute Bonus/circuit_0000.zkey Bonus/circuit_final.zkey --name="1st Contributor Name" -v -e="random text"
snarkjs zkey export verificationkey Bonus/circuit_final.zkey Bonus/bonus_verification_key.json

# generate solidity contract
snarkjs zkey export solidityverifier Bonus/circuit_final.zkey ../bonus_verifier.sol

cd ../..