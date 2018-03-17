(
    Pdef(\sineGrainTrainEnv, 
        Pbind(
            \instrument, \sineGrainTrainEnv,
            \group, ~group[\instr],
            \freq0, Pexprand(110, 1100),
            \freq1, Pkey(\freq0),
            // \freq1, Pexprand(110, 1100),
            \db, Pwhite(-60, -50),
            \grainfreq0, Pwhite(1.0, 10.0),
            \grainfreq1, Pkey(\grainfreq0),
            // \grainfreq1, Pwhite(1.0, 15.0),
            \grainsize0, Pexprand(0.0001, 0.1),
            \grainsize1, Pkey(\grainsize0),
            // \grainsize1, Pexprand(0.0001, 0.1),
            \combdelay0, Pwhite(0.0001, 0.001),
            \combdelay1, Pkey(\combdelay0),
            // \combdelay1, Pwhite(0.0001, 0.001),
            \combdecay0, Pwhite(0.1, 2.0),
            \combdecay1, Pkey(\combdecay0),
            // \combdecay1, Pwhite(0.1, 2.0),
            \comblvl0, Pwhite(0.7, 1.0),
            \comblvl1, Pkey(\comblvl0),
            // \comblvl1, Pwhite(0.7, 1.0),
            \hipassfreq, 150,
            \hishelffreq, 1000,
            \hishelfdb, -12,
            \dur, Pexprand(1.5, 8.0),
            \pan0, Pwhite(-1.0, 1.0),
            \pan1, Pwhite(-1.0, 1.0),
            \fx1, ~bus[\jpverb],
            \fx1lvl, Pwhite(0, -12.dbamp),
            \out, ~bus[\master],
            \attack, Pwhite(5.0, 8.0),
            \rel, Pwhite(10.0, 20.0),
        )
    );
)

// Pdef(\sineGrainTrainEnv).play;
// Pdef(\sineGrainTrainEnv).stop;
