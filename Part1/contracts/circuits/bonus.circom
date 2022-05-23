// [bonus] implement an example game from part d

pragma circom 2.0.0;

template Bonus() {
    signal input a;
    signal input b;
    signal output c;
    c <== a*b;
 }

 component main = Bonus();
 