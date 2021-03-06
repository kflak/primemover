(
    Pdef(\sineGrainTrainEnv, 
        Pbind(
            \instrument, \sineGrainTrainEnv,
            \group, ~group[\instr],
            \freq0, Pxrand([0, 3, 7, 9, 12] + 84, inf).midicps,
            \freq1, Pkey(\freq0),
            // \db, Pwhite(-50, -36) - 10,
            \db, Pseq([Pseries.fromEndpoints(-80, -50, 10), Pwhite(-55, -45, inf)]),
            \grainfreq0, Pwhite(1.0, 10.0),
            \grainfreq1, Pwhite(1.0, 10.0),
            \grainsize0, Pexprand(0.0001, 0.001),
            \grainsize1, Pkey(\grainsize0),
            \combdelay0, Pkey(\freq0).reciprocal,
            \combdelay1, Pkey(\combdelay0),
            \combdecay0, Pwhite(0.5, 2.0),
            \combdecay1, Pkey(\combdecay0),
            \comblvl0, 1.0,
            \comblvl1, Pkey(\comblvl0),
            \hipassfreq, 150,
            \hishelffreq, 1000,
            \hishelfdb, -12,
            \ratio, 8,
            \thresh, -12.dbamp,
            // \dur, Pexprand(3.0, 12.0),
            \dur, Pwhite(20, 45),
            \pan0, Pwhite(-1.0, 1.0),
            \pan1, Pwhite(-1.0, 1.0),
            \fx1, ~bus[\jpverb],
            \fx1lvl, -6.dbamp,
            \fx2, ~bus[\grdelay],
            \fx2lvl, -12.dbamp,
            // \fx2lvl, Pwhite(-60, -10).dbamp,
            \out, ~bus[\sineGrain],
            \attack, Pwhite(5, 15),
            \rel, Pkey(\attack) * 0.7,
        )
    );
)

// Pdef(\sineGrainTrainEnv).play;
// Pdef(\sineGrainTrainEnv).stop;
