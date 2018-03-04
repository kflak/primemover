(
    Pdef(\school_yard, 
        Pbind(
            \instrument, \clean,
            \buf, Prand(~buffers[\school_yard], inf),
            ~group[\instr];
            \amp, Pexprand(-30.dbamp, -20.dbamp),
            \dur, Pexprand(2.0, 10.0),
            // \rel, Pkey(\dur) * 1.5,
            \rel, 16,
            // \attack, Pkey(\dur) * 0.5,
            \attack, 6,
            \pan, Pwhite(-1.0, 1.0), 
            \loop, 1,
            \hipassfreq, 100,
            \out, ~bus[\master],
            \fx1, ~bus[\jpverb], 
            \fx1lvl, Pwhite(-10.dbamp, -0.dbamp),
        )
    );
)