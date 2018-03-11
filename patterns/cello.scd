(
    Pdef(\cello, 
        Pbind(
            \instrument, \clean,
            \group, ~group[\instr],
            \dur, Pexprand(1, 10),
            \rate, Prand([0.25, 0.5, 1], inf),
            \loop, 1,
            \buf, Prand(~buffers[\cello_tiit], inf),
            \rel, Pexprand(4, 16),
            \attack, Pwhite(2, 5),
            \db, Pseq([Pseries.fromEndpoints(-35, -20, 30), Pwhite(-25, -20, inf)]),
            \pan, Pwhite(-1.0, 1.0, inf),
            \out, ~bus[\master],
            \fx1, ~bus[\jpverb],
            \fx1lvl, -12.dbamp,
        );
    );		
)
