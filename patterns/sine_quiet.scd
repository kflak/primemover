(
    Pdef(\sine_quiet, 
        Pbind(
            \instrument, \sine,
            \group, ~group[\instr],
            \freq, Pexprand(660, 1200),
            \amp, Pwhite(-70.dbamp, -60.dbamp),
            \dur, Pexprand(1.5, 15.0),
            \pan, Pwhite(-1.0, 1.0),
            \amfreq, Pwhite(1, 5),
            \fx1lvl, Pwhite(-60.dbamp, -9.dbamp),
            \out, ~bus[\master],
            \rel, Pwhite(3.0, 10.0),
        )
    );
)
