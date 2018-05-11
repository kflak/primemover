(
    Pdef(\rain, 
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
            \amp, -9.dbamp,
            \pan, Pwhite(-1.0, 1.0, inf),
            \out, ~bus[\master],
            // \fx1, ~bus[\jpverb],
            // \fx1lvl, -12.dbamp,
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
            \amp, -18.dbamp,
            \pan, Pwhite(-1.0, 1.0, inf),
            \out, ~bus[\master],
            // \fx1, ~bus[\jpverb],
            // \fx1lvl, -12.dbamp,
        );
    );		
)

// Pdef(\rain).stop;
// Pdef(\rainLow).play;
