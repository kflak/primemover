(
    Pdef(\aliinaCry, 
        Pbind(
            \instrument, \clean,
            \group, ~group[\instr],
            \dur, Pexprand(5, 20),
            \rate, 1,
            \loop, 0,
            \buf, Pxrand(~buffers[\aliina_unhappy], inf),
            \rel, Pexprand(4, 16),
            \attack, 0.5,
            // \amp, -30.dbamp,
            \db, -21,
            \pan, Pwhite(-1.0, 1.0, inf),
            \out, ~bus[\master],
            \fx1, ~bus[\jpverb],
            \fx1lvl, -3.dbamp,
        );
    );		
)

// Pdef(\aliinaCry).play;
// Pdef(\aliinaCry).stop;
