(
    Pdef(\sineGrainTrainEnv, 
        Pbind(
            \instrument, \sineGrainTrainEnv,
            \group, ~group[\instr],
            \freq0, Pexprand(110, 1100),
            \freq1, Pexprand(110, 1100),
            \db, Pwhite(-40, -20),
            \grainfreq0, Pwhite(1.0, 10.0),
            \grainfreq1, Pwhite(1.0, 15.0),
            \grainsize0, Pexprand(0.001, 0.01),
            \grainsize1, Pexprand(0.001, 0.01),
            \combdelay, Pwhite(0.0001, 0.001),
            \comblvl, 1,
            \hipassfreq, 100,
            \hishelffreq, 1000,
            \hishelfdb, -6,
            \dur, Pexprand(1.5, 15.0),
            \pan0, Pwhite(-1.0, 1.0),
            \pan1, Pwhite(-1.0, 1.0),
            \fx1, ~bus[\jpverb],
            \fx1lvl, Pwhite(-6.dbamp, -3.dbamp),
            \out, ~bus[\master],
            \attack, Pwhite(5.0, 8.0),
            \rel, Pwhite(10.0, 20.0),
        )
    );
)

// Pdef(\sineGrainTrainEnv).play;
// Pdef(\sineGrainTrainEnv).stop;
