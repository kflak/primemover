(
    Pdef(\sineGrain, 
        Pbind(
            \instrument, \sineGrainDust,
            \group, ~group[\instr],
            \freq, Pexprand(660, 1200),
            \db, Pwhite(-50, -20),
            \density, Pwhite(5, 10),
            \grainsize, Pwhite(0.01, 0.1),
            \dur, Pexprand(1.5, 15.0),
            \pan, Pwhite(-1.0, 1.0),
            \fx1, ~bus[\jpverb],
            \fx1lvl, Pwhite(-6.dbamp, -3.dbamp),
            \out, ~bus[\master],
            \attack, Pwhite(5.0, 8.0),
            \rel, Pwhite(10.0, 20.0),
        )
    );
)

// Pdef(\sineGrain).play;
// Pdef(\sineGrain).stop;

