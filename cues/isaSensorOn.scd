(
    {
        "Isa sensor on".postln;
        [12].do{|id, idx| ~deltaTriggers[\water][idx].play(out: ~bus[\master], target: ~group[\mix]) };
    }
)
