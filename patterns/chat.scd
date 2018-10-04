(
    Pdef(\chat, 
        Pbind(
            \instrument, \clean,
            \buf, Pxrand(~buffers[\chat], inf),
            \group, ~group[\instr],
            // \db, Pwhite(-5, 0),
            \db, -10,
            \dur, Pwhite(2.0, 8.0),
            \bufdur, Pfunc({|ev| ev.buf.duration}),
            \attack, Pkey(\bufdur) * 0.2,
            \rel, Pkey(\bufdur) * 0.8,
            // \rel, Pkey(\dur) * 1.5,
            // \attack, Pkey(\dur) * 0.9,
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

    Pdef(\chat1, 
        Pbind(
            \instrument, \clean,
            \buf, Pxrand(~buffers[\chat] ++ ~buffers[\chat1], inf),
            \group, ~group[\instr],
            // \db, Pwhite(-5, 0),
            \db, -20,
            \dur, Pwhite(2.0, 8.0),
            // \rel, Pkey(\dur) * 1.5,
            \bufdur, Pfunc({|ev| ev.buf.duration}),
            \attack, Pkey(\bufdur) * 0.5,
            \rel, Pkey(\bufdur),
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

    Pdef(\chat2, 
        Pbind(
            \instrument, \cleangate,
            \buf, Pxrand(~buffers[\chat2], inf),
            \group, ~group[\instr],
            \type, Pwrand([\note, \rest], [0.5, 0.5], inf),
            \db, Pwhite(-30, -20),
            \bufdur, Pfunc({|ev| ev.buf.duration}),
            \rel, 0.8,
            \attack, 2.5,
            \dur, Pfunc({|ev| if(ev.type==\note)
                {ev.bufdur-ev.rel}
                {rrand(3.0, 4.0)}
            }),
            \ratio, 8,
            \loop, 0,
            \thresh, -20.dbamp,
            \rate, 1,
            \pan, Pwhite(-1.0, 1.0), 
            \hipassfreq, 500,
            \hishelfdb, -12,
            \out, ~bus[\master],
            \fx1, ~bus[\jpverb], 
            // \fx1lvl, Pwhite(-10.dbamp, -5.dbamp),
            \fx1lvl, -0.dbamp,
            \fx2, ~bus[\grdelayMedium], 
            \fx2lvl, Pwhite(-20.dbamp, -15.dbamp),
        )
    );

    Pdef(\chatLow, 
        Pbind(
            \instrument, \clean,
            \buf, Pxrand(~buffers[\chat], inf),
            \group, ~group[\instr],
            // \db, Pwhite(-5, 0) - 16,
            \db, -20,
            \dur, Pwhite(2.0, 8.0),
            \bufdur, Pfunc({|ev| ev.buf.duration}),
            \attack, Pkey(\bufdur) * 0.5,
            \rel, Pkey(\bufdur),
            // \rel, Pkey(\dur) * 1.5,
            // \attack, Pkey(\dur) * 0.5,
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

// Pdef(\chat2).play;
Pdef(\chat2).stop;
