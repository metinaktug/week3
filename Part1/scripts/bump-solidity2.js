const fs = require("fs");
const solidityRegex = /pragma solidity \^\d+\.\d+\.\d+/

let content = fs.readFileSync("./contracts/verifier.sol", { encoding: 'utf-8' });
let bumped = content.replace(solidityRegex, 'pragma solidity ^0.8.0');

fs.writeFileSync("./contracts/verifier.sol", bumped);


++++++++++++++++++++++++++
const fs = require("fs");
const solidityRegex = /pragma solidity \^\d+\.\d+\.\d+/

const verifierRegex = /contract Verifier/

let content = fs.readFileSync("./contracts/HelloWorldVerifier.sol", { encoding: 'utf-8' });
let bumped = content.replace(solidityRegex, 'pragma solidity ^0.6.11');
bumped = bumped.replace(verifierRegex, 'contract HelloWorldVerifier');

fs.writeFileSync("./contracts/Multiplier3Verifier.sol", bumped);

//[assignment] add your own scripts below to modify the other verifier contracts you will build during the assignment


// let content_1 = fs.readFileSync("./contracts/Multiplier3Verifier.sol", { encoding: 'utf-8' });
// let bumped_1 = content_1.replace(solidityRegex, 'pragma solidity ^0.8.0');
// bumped_1 = bumped_1.replace(verifierRegex, 'contract Multiplier3Verifier');

// fs.writeFileSync("./contracts/Multiplier3Verifier.sol", bumped_1);