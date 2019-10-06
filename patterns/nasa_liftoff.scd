(
    Pdef(\nasa_liftoff, 
        Pbind(
            \instrument, Pseq([\clean, \clean_circle_pan, \clean_circle_pan, \clean, \clean, \clean]), 
            \group, ~group[\instr],
            \dur, Pseq([30, 10, 10, 20, 20, 20]),
            \buf, Pseq([
                ~buffers[\nasa][0], 
                ~buffers[\nasa][4], 
                ~buffers[\nasa][4], 
                ~buffers[\nasa][6], 
                ~buffers[\nasa][6], 
                ~buffers[\nasa][6]
            ]),
            \rel, Pseq([120, 80, 80, 90, 90, 90]),
            \loop, Pseq([0, 0, 0, 1, 1, 1]),
            \rate, Pseq([1, 1, 1, 0.5, 0.5, 0.5]),
            \pan, Pwhite(-1.0, 1.0, inf),
            \panspeed, 0.03,
            \width, ~numSpeakers,
            \db, Pseq([-26, -11, -11, -20, -22, -27] + 3),
            \hipassfreq, Pseq([450, 220, 220, 220, 220, 220]),
            \hishelfdb, -9,
            \attack, Pseq([50, 10, 10, 10, 10, 10]),
            \gain, 5,
            \ratio, 8,    
            \thresh, -8.dbamp,
            \out, ~bus[\master],
        )
    );

)
