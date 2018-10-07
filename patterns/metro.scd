(
    Pdef(\metro, 
        Pbind(
            \instrument, \clean,
            \buf, Prand(~buffers[\metro], inf),
            \group, ~group[\instr],
            \db, -18,
            \dur, Pexprand(5.0, 10.0),
            \rel, Pkey(\dur) * 1.5,
            \attack, Pkey(\dur) * 0.5,
            \ratio, 6,
            \gain, 3.dbamp,
            \thresh, -16.dbamp,
            \hishelfdb, -9,
            \hipassfreq, 300,
            \rate, Pexprand(0.75, 1.1),
            \pan, Pwhite(-1.0, 1.0), 
            \hipassfreq, 100,
            \out, ~bus[\master],
        )
    );
)
