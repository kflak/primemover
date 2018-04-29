(
    Pdef(\sineGrainTrain, 
        Pbind(
            \instrument, \sineGrainTrain,
            \group, ~group[\instr],
            \degree, Pwhite(0, 24),
            \db, Pwhite(-60, -40),
            \grainfreq, Pwhite(1, 10),
            \grainsize, Pwhite(0.01, 0.1),
            \dur, Pexprand(1.5, 15.0),
            \pan, Pwhite(-1.0, 1.0),
            \fx1, ~bus[\jpverb],
            \fx1lvl, Pwhite(-6.dbamp, -3.dbamp),
            \out, ~bus[\master],
            \attack, Pwhite(5.0, 8.0),
            \rel, Pwhite(6.0, 15.0),
        )
    );
)

// Pdef(\sineGrainTrain).play;
// Pdef(\sineGrainTrain).stop;

