(
    {
        "Kenneth stops singing, Crunchy impro starts".postln;

        //mic off
        ~ch[\mic0].set(\gate, 0);

        //movement sensors on
        [10, 11].do{|id| 
            ~deltaTriggers[\chew][id].play( 
                out: ~bus[\master], 
                maxAmp: -6.dbamp, 
                threshold: 0.1, 
                target: ~group[\mix]
            ) 
        };
        [10, 11].do{|id| 
            ~deltaTriggers[\bubbles][id].play(
                out: ~bus[\master], 
                maxAmp: -3.dbamp,
                threshold: 0.2,
                target: ~group[\mix]
            )
        };
        [10, 11].do{|id| 
            ~deltaTriggers[\chips][id].play(
                out: ~bus[\master], 
                maxAmp: -3.dbamp,
                threshold: 0.1,
                target: ~group[\mix]
            )
        };
    }
)
