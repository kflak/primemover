(
    Pdef(\nasa, 
        Pbind(
            \instrument, \clean,
            \group, ~group[\instr],
            \dur, Pwhite(2, 4, inf),
            \rate, Pexprand(0.9, 1.3, inf),
            \buf, Pseq([~buffers[\nasa][4], Prand(~buffers[\nasa], inf)], inf),
            \attack, Pkey(\dur) * rrand(1, 2),
            \rel, Pkey(\dur) * rrand(3, 4),
            \loop, 1,
            \hishelfdb, -12,
            // \startpos, Pwhite(0, Pkey(\buf).numFrames, inf),
            \pan, Pwhite(-1.0, 1.0, inf),
            // \amp, Pwhite(-50.dbamp, -20.dbamp, inf),
            \db, Pseq([Pseries.fromEndpoints(-60, -20, 15), Pwhite(-30, -15, inf)]),
            \ratio, 2,    
            \thresh, -12.dbamp,
            // \fx1, ~bus[\jpverb],
            // \fx1lvl, 1, 
            \out, ~bus[\master],
        )
    );
)
