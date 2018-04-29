(
    Pdef(\tibetBellRev, 
        Pbind(
            \instrument, \clean,
            \group, ~group[\instr],
            \dur, Pexprand(2, 10),
            \rate, Pwhite(-0.2, -0.01),
            \loop, 1,
            \buf, Prand(~buffers[\tibetan_bells], inf),
            \rel, Pwhite(16, 30),
            \attack, Pkey(\rel),
            \hishelfdb, -25,
            \hipassfreq, 440,
            \db, -17,
            \fx1, ~bus[\jpverb],
            \fx1lvl, -0.dbamp,
            \pan, Pwhite(-1.0, 1.0, inf),
            \width, ~numSpeakers,
            \out, ~bus[\master],
        );
    );        
)

// Pdef(\tibetBellRev).play;
// Pdef(\tibetBellRev).stop;
