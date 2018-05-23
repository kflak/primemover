(
    Pdef(\chat, 
        Pbind(
            \instrument, \clean,
            \buf, Prand(~buffers[\chat], inf),
            \group, ~group[\instr],
            \db, Pwhite(-5, 0),
            \dur, Pexprand(2.0, 5.0),
            \rel, Pkey(\dur) * 1.5,
            \attack, Pkey(\dur) * 0.5,
            \ratio, 8,
            \loop, 0,
            \gain, 3.dbamp,
            \thresh, -20.dbamp,
            \rate, 1,
            \pan, Pwhite(-1.0, 1.0), 
            \hipassfreq, 200,
            \out, ~bus[\master],
            \fx1, ~bus[\jpverb], 
            \fx1lvl, Pwhite(-10.dbamp, -5.dbamp),
            \fx2, ~bus[\grdelayMedium], 
            \fx2lvl, Pwhite(-10.dbamp, -5.dbamp),
        )
    );
)

// Pdef(\chat).play;
// Pdef(\chat).stop;
