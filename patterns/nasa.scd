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
            \pan, Pwhite(-1.0, 1.0, inf),
            \db, Pseq([Pseries.fromEndpoints(-60, -40, 15), Pwhite(-50, -30, inf)]),
            \ratio, 2,    
            \thresh, -12.dbamp,
            // \fx1, ~bus[\jpverb],
            // \fx1lvl, 1, 
            \out, ~bus[\master],
        )
    );

    Pdef(\nasaSaturn, 
        Pbind(
            \instrument, \clean,
            \group, ~group[\instr],
            \dur, Pwhite(4, 8),
            \rate, Pwhite(0.25, 0.5),
            \buf, ~buffers[\nasa][6],
            \attack, Pkey(\dur),
            \rel, Pkey(\dur),
            \loop, 1,
            \hishelfdb, -12,
            \hipassfreq, 400,
            \pan, Pwhite(-1.0, 1.0, inf),
            \db, Pseq([Pseries.fromEndpoints(-60, -28, 10), Pwhite(-35, -28, inf)]),
            \ratio, 2,    
            \thresh, -12.dbamp,
            \fx1, ~bus[\jpverb],
            \fx1lvl, -12.dbamp, 
            \out, ~bus[\master],
        )
    );

    Pdef(\nasaSaturnMicgrab, 
        Pbind(
            \instrument, \clean,
            \group, ~group[\instr],
            \dur, Pwhite(4, 8),
            // \rate, Prand([0.25, 0.5], inf),
            \rate, Pwhite(0.25, 0.5),
            \buf, ~buffers[\nasa][6],
            \attack, Pkey(\dur),
            \rel, Pkey(\dur),
            \loop, 1,
            \hishelfdb, -12,
            \pan, Pwhite(-1.0, 1.0, inf),
            \db, -40,
            \ratio, 2,    
            \thresh, -12.dbamp,
            \fx1, ~bus[\jpverb],
            \fx1lvl, -12.dbamp, 
            \out, ~bus[\master],
        )
    );
)
