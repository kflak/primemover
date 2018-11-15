(
    Pdef(\sine, 
        Pbind(
            \instrument, \sine,
            \group, ~group[\instr],
            \freq, Pexprand(660, 1200),
            \db, -68,
            \dur, Pwhite(4.0, 15.0),
            \pan, Pwhite(-1.0, 1.0),
            \amfreq, Pwhite(0.5, 2),
            \fx1, ~bus[\jpverb],
            \fx1lvl, Pwhite(-16.dbamp, -13.dbamp),
            \out, ~bus[\master],
            \attack, Pwhite(15.0, 18.0),
            \rel, Pwhite(10.0, 20.0),
        )
    );
)

// Pdef(\sine).play;
// Pdef(\sine).stop;
