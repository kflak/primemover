(
    Pdef(\bell_low_chord, 
        Pbind(
            \instrument, \klang,
            \group, ~group[\instr],
            \midinote, [24, 27, 31, 59],
            \spread, Pwhite(2.0, 2.01),
            \dur, 8, 
            \attack, Pwhite(1.3, 2.9),
            \amp, 0.5 * [rrand(-18, -15), rrand(-21, -18), rrand(-30, -25), rrand(-40, -36)].dbamp,
            \pan, Pwhite(-1.0, 1.0, inf),
            \rel, Pkey(\dur) * 1.5,
            \out, ~bus[\master],
            \fx1, ~bus[\grdelay],
            \fx1lvl, Pwhite(-24.dbamp, -6.dbamp),
        );
    );

    /******************** bell ********************/
    Pdef(\bell_low, 
        Pbind(
            \instrument, \klang,
            \group, ~group[\instr],
            \freq, 80,
            \spread, Pwhite(1.95, 2.05),
            \dur, Pexprand(2, 8),
            \attack, Pwhite(2.3, 3.9),
            \amp, Pwhite(-50.dbamp, -40.dbamp, inf),
            \pan, Pwhite(-1.0, 1.0, inf),
            \rel, Pkey(\dur) * 2,
            \out, ~bus[\master],
            \fx1, ~bus[\grdelay],
            \fx1lvl, Pwhite(-24.dbamp, -6.dbamp),
            \fx2, ~bus[\jpverb],
            \fx2lvl, Pwhite(-24.dbamp, -6.dbamp),
        );
    );

    Pdef(\bell_hi, 
        Pbind(
            \instrument, \klang,
            \group, ~group[\instr],
            \midinote, [24, 27, 31, 59] + 36,
            \spread, Pwhite(1.8, 2.7),
            \dur, 8, 
            \attack, Pwhite(1.3, 2.9),
            \amp, 0.05 * [rrand(-18, -15), rrand(-21, -18), rrand(-30, -25), rrand(-40, -36)].dbamp,
            \pan, Pwhite(-1.0, 1.0, inf),
            \rel, Pkey(\dur) * 1.5,
            \out, ~bus[\master],
            \fx1, ~bus[\grdelay],
            \fx1lvl, Pwhite(-24.dbamp, -6.dbamp),
        );
    );

    Pdef(\bell,
        Psym(
            Pseq([[\bell_low_chord, \bell_hi]])
        )
    );

    /******************** wind ********************/
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
