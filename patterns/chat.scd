(
    Pdef(\chat, 
        Pbind(
            \instrument, \clean,
            \buf, Pxrand(~buffers[\chat], inf),
            \group, ~group[\instr],
            \db, Pwhite(-5, 0),
            \dur, Pwhite(2.0, 8.0),
            \rel, Pkey(\dur) * 1.5,
            \attack, Pkey(\dur) * 0.9,
            \ratio, 8,
            \loop, 0,
            \thresh, -20.dbamp,
            \rate, 1,
            \pan, Pwhite(-1.0, 1.0), 
            \hipassfreq, 500,
            \hishelfdb, -12,
            \out, ~bus[\master],
            \fx1, ~bus[\jpverb], 
            \fx1lvl, Pwhite(-10.dbamp, -5.dbamp),
            \fx2, ~bus[\grdelayMedium], 
            \fx2lvl, Pwhite(-20.dbamp, -15.dbamp),
        )
    );
    Pdef(\chatLow, 
        Pbind(
            \instrument, \clean,
            \buf, Pxrand(~buffers[\chat], inf),
            \group, ~group[\instr],
            \db, Pwhite(-5, 0) - 10,
            \dur, Pwhite(2.0, 8.0),
            \rel, Pkey(\dur) * 1.5,
            \attack, Pkey(\dur) * 0.9,
            \ratio, 8,
            \loop, 0,
            \thresh, -20.dbamp,
            \rate, 1,
            \pan, Pwhite(-1.0, 1.0), 
            \hipassfreq, 500,
            \hishelfdb, -12,
            \out, ~bus[\master],
            \fx1, ~bus[\jpverb], 
            \fx1lvl, Pwhite(-10.dbamp, -5.dbamp),
            \fx2, ~bus[\grdelayMedium], 
            \fx2lvl, Pwhite(-20.dbamp, -15.dbamp),
        )
    );
)

// Pdef(\chat).play;
// Pdef(\chat).stop;
