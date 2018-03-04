(
    Pdef(\wind, 
        Pbind(
            \instrument, \clean,
            \group, ~group[\instr],
            \dur, Pexprand(2, 10),
            \rate, 1,
            \loop, 0,
            \buf, Prand(~buffers[\nurme_wind], inf),
            \rel, 16,
            \attack, 3.0,
            \amp, -26.dbamp,
            \pan, Pwhite(-1.0, 1.0, inf),
            \width, ~numSpeakers,
            \out, ~bus[\master],
        );
    );		
)
