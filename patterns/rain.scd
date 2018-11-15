(
    Pdef(\rain, 
        Pbind(
            \instrument, \clean,
            \group, ~group[\instr],
            \dur, Pexprand(10, 20),
            \rate, Pexprand(0.9, 1.2),
            \loop, 1,
            \buf, Prand(~buffers[\rain], inf),
            \rel, 60,
            \attack, 120,
            \hipassfreq, 120,
            \db, -25,
            \pan, Pwhite(-1.0, 1.0, inf),
            \out, ~bus[\master],
        );
    );		

    Pdef(\rainLow, 
        Pbind(
            \instrument, \clean,
            \group, ~group[\instr],
            \dur, Pexprand(3, 10),
            \rate, Pexprand(0.9, 1.2),
            \loop, 1,
            \buf, Prand(~buffers[\rain], inf),
            \rel, 60,
            \attack, 20.0,
            \hipassfreq, 120,
            \db, -40,
            \pan, Pwhite(-1.0, 1.0, inf),
            \out, ~bus[\master],
        );
    );		

    Pdef(\rainFaraway, 
        Pbind(
            \instrument, \clean,
            \group, ~group[\instr],
            \dur, Pexprand(20, 30),
            \rate, Pexprand(0.9, 1.2),
            \loop, 1,
            \buf, Prand(~buffers[\rain], inf),
            \rel, 60,
            \attack, 240,
            \hipassfreq, 120,
            \db, -25,
            \pan, Pwhite(-1.0, 1.0, inf),
            \width, ~numSpeakers,
            \out, ~bus[\master],
        );
    );		
)
