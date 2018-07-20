(
    Pdef(\em, 
        Pbind(
            \instrument, \clean,
            \buf, Prand(~buffers[\em], inf),
            \group, ~group[\instr],
            \db, Pwhite(-30, -10),
            \dur, Pexprand(1.0, 7.0),
            \rel, Pkey(\dur),
            \attack, Pkey(\dur) * 0.3,
            \rate, Pexprand(0.25, 0.75),
            \pan, Pwhite(-1.0, 1.0), 
            \out, ~bus[\master],
            \fx1, ~bus[\jpverb], 
            \fx1lvl, Pwhite(-10.dbamp, -5.dbamp),
            // \fx2, ~bus[\grdelay], 
            // \fx2lvl, Pwhite(-10.dbamp, -5.dbamp),
        )
    );

    Pdef(\emLow, 
        Pbind(
            \instrument, \clean,
            \buf, Prand(~buffers[\em], inf),
            \group, ~group[\instr],
            \db, Pwhite(-40, -20),
            \dur, Pexprand(1.0, 7.0),
            \rel, Pkey(\dur),
            \attack, Pkey(\dur) * 0.3,
            \rate, Pexprand(0.25, 0.75),
            \pan, Pwhite(-1.0, 1.0), 
            \out, ~bus[\master],
            \fx1, ~bus[\jpverb], 
            \fx1lvl, Pwhite(-10.dbamp, -5.dbamp),
            \fx2, ~bus[\grdelayMedium], 
            \fx2lvl, Pwhite(-10.dbamp, -5.dbamp),
        )
    );

)
