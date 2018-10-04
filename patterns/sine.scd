(
    Pdef(\sine, 
        Pbind(
            \instrument, \sine,
            \group, ~group[\instr],
            \freq, Pexprand(660, 1200),
            \db, Pwhite(-80, -70),
            \dur, Pexprand(1.5, 15.0),
            \pan, Pwhite(-1.0, 1.0),
            \amfreq, Pwhite(0.5, 2),
            \fx1, ~bus[\jpverb],
            \fx1lvl, Pwhite(-6.dbamp, -3.dbamp),
            \out, ~bus[\master],
            \attack, Pwhite(5.0, 8.0),
            \rel, Pwhite(10.0, 20.0),
        )
    );
)

// Pdef(\sine).play;
