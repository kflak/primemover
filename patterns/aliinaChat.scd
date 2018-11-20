(
    Pdef(\aliinaChat, 
        Pbind(
            \instrument, \clean,
            \group, ~group[\instr],
            \dur, Pexprand(3, 10),
            \rate, 1,
            \loop, 0,
            \buf, Pxrand(~buffers[\aliinaChat], inf),
            \rel, Pexprand(4, 16),
            \attack, 0.05,
            \hipassfreq, 400,
            \db, -18,
            \pan, Pwhite(-1.0, 1.0, inf),
            \out, ~bus[\master],
            \fx1, ~bus[\jpverb],
            \fx1lvl, -20.dbamp,
            \fx2, ~bus[\grdelayMedium],
            \fx2lvl, -20.dbamp,
        );
    );		

    Pdef(\aliinaChatFaster, 
        Pbind(
            \instrument, \clean,
            \group, ~group[\instr],
            \dur, Pexprand(1, 5),
            \rate, 1,
            \loop, 0,
            \buf, Pxrand(~buffers[\aliinaChat], inf),
            \rel, Pexprand(4, 16),
            \attack, 0.05,
            \hipassfreq, 400,
            \db, -22,
            \pan, Pwhite(-1.0, 1.0, inf),
            \out, ~bus[\master],
            \fx1, ~bus[\jpverb],
            \fx1lvl, -20.dbamp,
            \fx2, ~bus[\grdelayMedium],
            \fx2lvl, -15.dbamp,
        );
    );		
)

// Pdef(\aliinaChat).play;
// Pdef(\aliinaChat).stop;
