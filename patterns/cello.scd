(
    Pdef(\cello, 
        Pbind(
            \instrument, \clean,
            \group, ~group[\instr],
            \dur, Pexprand(1, 10),
            // \rate, Prand([0.25, 0.5, 1], inf),
            \rate, 0.5,
            \loop, 1,
            \buf, Prand(~buffers[\cello_tiit], inf),
            \rel, Pexprand(4, 16),
            \attack, Pwhite(2, 5),
            \hipassfreq, 400,
            \db, Pseq([Pseries.fromEndpoints(-35, -20, 30), Pwhite(-25, -20, inf)]),
            \pan, Pwhite(-1.0, 1.0, inf),
            \out, ~bus[\cello],
            \fx1, ~bus[\jpverb],
            \fx1lvl, -12.dbamp,
        );
    );		

    Pdef(\celloBegin, 
        Pbind(
            \instrument, \clean,
            \group, ~group[\instr],
            \dur, 8,
            \rate, Prand([0.25, 0.5] * -1, inf),
            // \rate, -0.5,
            \loop, 1,
            \buf, Prand(~buffers[\cello_tiit], inf),
            \attack, Pkey(\dur) * 0.8,
            \rel, Pkey(\dur) * 1,
            \db, Pwhite(-31, -21),
            \hishelfdb, 0,
            \hipassfreq, 400,
            \pan, Pwhite(-1.0, 1.0, inf),
            \out, ~bus[\cello],
            \fx1, ~bus[\jpverb],
            \fx1lvl, -6.dbamp,
        );
    );		
)

// Pdef(\celloBegin).play;
// Pdef(\celloBegin).stop;
