(
    Pdef(\aliina_laugh, 
        Pbind(
            \instrument, \clean,
            \group, ~group[\instr],
            \dur, Pexprand(5, 20),
            \rate, 1,
            \loop, 0,
            \buf, Prand(~buffers[\aliina_laugh], inf),
            \rel, Pexprand(4, 16),
            \attack, 0.5,
            \amp, -40.dbamp,
            \pan, Pwhite(-1.0, 1.0, inf),
            \out, ~bus[\master],
            \fx1, ~bus[\jpverb],
            \fx1lvl, -3.dbamp,
        );
    );		
)
