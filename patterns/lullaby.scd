(
    Pdef(\lullaby, 
        Pbind (
            \instrument, \clean_circle_pan, 
            \dur, 50,
            \group, ~group[\instr],
            \buf, ~buffers[\lullaby][0], 
            \attack, 80, 
            \rel, 120, 
            \loop, 1,
            \db, -30, 
            \hipassfreq, 500,
            \panspeed, 0.01, 
            \out, ~bus[\master],
            \fx1, ~bus[\jpverb], 
            \fx1lvl, -12.dbamp,
        );
    );
    
    Pdef(\lullabyLow, 
        Pbind (
            \instrument, \clean_circle_pan, 
            \dur, 50,
            \group, ~group[\instr],
            \buf, ~buffers[\lullaby][0], 
            \attack, 20, 
            \rel, 120, 
            \loop, 1,
            \db, -60, 
            \hipassfreq, 500,
            \panspeed, 0.01, 
            \out, ~bus[\master],
            \fx1, ~bus[\jpverb], 
            \fx1lvl, -12.dbamp,
        );
    );
)

// Pdef(\lullaby).play;
// Pdef(\lullaby).stop;
// Pdef(\lullabyLow).play;
// Pdef(\lullabyLow).stop;
