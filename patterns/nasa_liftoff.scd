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
            \db, Pseq([-26, -12, -12, -12, -12, -18, -22]),
            \hipassfreq, Pseq([350, 120, 120, 200, 200, 200]),
            \hishelfdb, -9,
            \attack, Pseq([50, 10, 10, 10, 10, 10]),
            \gain, 5,
            \ratio, 2,    
            \thresh, -12.dbamp,
            \out, ~bus[\master],
        )
    );

    // Pdef(\nasa_liftoff).play;
    // Pdef(\nasa_liftoff).stop;
)
