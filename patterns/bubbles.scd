(
    Pdef(\bubbles, 
        Pbind(
            \instrument, \clean,
            \group, ~group[\instr],
            \dur, Pexprand(2, 5),
            \rate, 0.20,
            \loop, 1,
            \buf, Prand(~buffers[\bubbles], inf),
            \rel, 16,
            \attack, 5.0,
            \hipassfreq, 120,
            \amp, -3.dbamp,
            \pan, Pwhite(-1.0, 1.0, inf),
            \out, ~bus[\master],
            \fx1, ~bus[\jpverb],
            \fx1lvl, -12.dbamp,
        );
    );		
)
