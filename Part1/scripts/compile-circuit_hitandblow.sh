#!/bin/bash

cd contracts/circuits
mkdir Hitandblow

if [ -f ./powersOfTau28_hez_final_10.ptau ]; then
    echo "powersOfTau28_hez_final_10.ptau already exists. Skipping."
else
    echo 'Downloading powersOfTau28_hez_final_10.ptau'
    wget https://hermez.s3-eu-west-1.amazonaws.com/powersOfTau28_hez_final_10.ptau
fi

echo "Compiling hitandblow.circom..."

# compile circuit

circom /home/metin/Documents/GitHub/week3/Part1/contracts/circuits/hitandblow.circom --r1cs --wasm --sym -o Hitandblow
snarkjs r1cs info Hitandblow/hitandblow.r1cs

# Start a new zkey and make a contribution

snarkjs groth16 setup Hitandblow/hitandblow.r1cs powersOfTau28_hez_final_10.ptau Hitandblow/circuit_0000.zkey
snarkjs zkey contribute Hitandblow/circuit_0000.zkey Hitandblow/circuit_final.zkey --name="2nd Contributor Name" -v -e="random text"
snarkjs zkey export verificationkey Hitandblow/circuit_final.zkey Hitandblow/hitandblow_verification_key.json

# generate solidity contract
snarkjs zkey export solidityverifier Hitandblow/circuit_final.zkey ../hitandblow_verifier.sol

cd ../..