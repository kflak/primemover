(
    Pdef(\crashes, 
        Pbind(
            \instrument, \clean,
            \group, ~group[\instr],
            \dur, 0.5, 
            \rate, 1,
            \buf, Prand(~buffers[\explosions], inf),
            \rel, 7,
            // \amp, Pseq(Array.geom(10, 0.01, 1.2), 1),
            \db, Pwhite(-40, -30),
            \hipassfreq, 200,
            \pan, Pwhite(-1.0, 1.0, inf),
            \out, ~bus[\master],
            // \fx1, ~bus[\jpverb],
            // \fx1lvl, 0.8,
        );
    );		
)
