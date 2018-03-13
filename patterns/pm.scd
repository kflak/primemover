(
    Pdef(\pmEnv,  
        Pbind(
            \instrument, \pmEnv, 
            \group, ~group[\instr],
            \degree, Pwhite(0, 12), 
            \octave, 5,
            \modfreq, Pkey(\degree),
            \pmindex, 0.1,
            \db, Pwhite(-70, -40),
            \dur, Pexprand(1.5, 15.0),
            \pan, Pwhite(-1.0, 1.0),
            \amfreq, Pexprand(0.1, 10),
            \fx1, ~bus[\jpverb],
            \fx1lvl, Pwhite(-6.dbamp, 0.dbamp),
            \out, ~bus[\master],
            \attack, Pwhite(5.0, 8.0),
            \rel, Pwhite(10.0, 20.0),
        )
    );
)

// Pdef(\pmEnv).play;
// Pdef(\pmEnv).stop;

