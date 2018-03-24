(
    Pdef(\aliinaCryBeginning, 
        Pbind(
            \instrument, \clean,
            \group, ~group[\instr],
            \dur, Pexprand(5, 20),
            \rate, Pwhite(0.25, 1.0),
            \loop, Prand([0, 1], inf),
            \buf, Pxrand(~buffers[\aliina_unhappy], inf),
            \rel, Pexprand(4, 16),
            \attack, 0.5,
            \db, Pwhite(-60, -40),
            \pan, Pwhite(-1.0, 1.0, inf),
            \out, ~bus[\master],
            \fx1, ~bus[\jpverb],
            \fx1lvl, -3.dbamp,
        );
    );		
)

// Pdef(\aliinaCry).play;
// Pdef(\aliinaCry).stop;
