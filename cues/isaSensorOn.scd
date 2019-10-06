(
    {
        "Isa sensor on".postln;
        [9, 12].do{|id, idx| ~deltaTriggers[\water][idx].play() };
    }
)
