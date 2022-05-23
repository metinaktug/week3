// [bonus] implement an example game from part d

pragma circom 2.0.0;

template MastermindVariation() {
    signal input a;
    signal input b;
    signal input d;
    signal input e;
    signal input f;

    signal x;
    signal y;
    signal z;
   
    signal output c;
    x <== a*b;
    y <== x*d;
    z <== y*e;
    c <== z*f;
     }

 component main = MastermindVariation();
 