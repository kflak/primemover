(
    Pdef(\metro, 
        Pbind(
            \instrument, \clean,
            \buf, Prand(~buffers[\metro], inf),
            \group, ~group[\instr],
            // \amp, Pwhite(-40.dbamp, -30.dbamp),
            \db, Pwhite(-15, -9),
            \dur, Pexprand(5.0, 10.0),
            \rel, Pkey(\dur) * 1.5,
            \attack, Pkey(\dur) * 0.5,
            \ratio, 6,
            \gain, 3.dbamp,
            \thresh, -16.dbamp,
            \rate, Pexprand(0.75, 1.1),
            \pan, Pwhite(-1.0, 1.0), 
            \hipassfreq, 100,
            \out, ~bus[\master],
            // \fx1, ~bus[\jpverb], 
            // \fx1lvl, Pwhite(-10.dbamp, -5.dbamp),
        )
    );
)
