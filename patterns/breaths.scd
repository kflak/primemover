(
    Pdef(\breaths, 
        Pbind(
            \instrument, \clean_circle_pan,
            \group, ~group[\instr],
            \dur, Pexprand(10, 30),
            \loop, 1,
            \buf, ~buffers[\breaths][0],
            \rel, 16,
            \attack, 5.0,
            \hipassfreq, 120,
            \db, Pwhite(-25, -20),
            \panspeed, 0.01,
            \out, ~bus[\master],
            \fx1, ~bus[\jpverb],
            \fx1lvl, -9.dbamp,
        );
    );		
)
