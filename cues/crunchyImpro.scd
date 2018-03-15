(
    "*Crunchy_impro*".postln;
    ~mic[\close].value(0);
    [10, 11].do{|id, idx| 
        ~deltaTriggers[\chew][idx].play(
            out: ~bus[\master], 
            maxAmp: -6.dbamp,
            threshold: 0.1,
            target: ~group[\mix]
        )
    };
    [10, 11].do{|id, idx| 
        ~deltaTriggers[\bubbles][idx].play(
            out: ~bus[\master], 
            maxAmp: -3.dbamp,
            threshold: 0.2,
            target: ~group[\mix]
        )
    };
    [10, 11].do{|id, idx| 
        ~deltaTriggers[\chew][idx].play(
            out: ~bus[\master], 
            maxAmp: -3.dbamp,
            threshold: 0.1,
            target: ~group[\mix]
        )
    };
)
