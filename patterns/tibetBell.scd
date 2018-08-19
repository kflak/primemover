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
            \hipassfreq, 660,
            \db, -17,
            \fx1, ~bus[\jpverb],
            \fx1lvl, -0.dbamp,
            \pan, Pwhite(-1.0, 1.0, inf),
            \width, ~numSpeakers,
            \out, ~bus[\master],
        );
    );        

    Pdef(\tibetBellKlank, 
        Pbind(
            \instrument, \klankTibet,
            \group, ~group[\instr],
            \dur, Pexprand(7, 20),
            \rel, Pkey(\dur),
            \attack, Pkey(\dur) * 0.5,
            \freq, Pexprand(400, 1200.0),
            \db, -30,
            \fx1, ~bus[\jpverb],
            \fx1lvl, -20.dbamp,
            \fx2, ~bus[\grdelayMedium],
            \fx2lvl, -10.dbamp,
            \pan, Pwhite(-1.0, 1.0, inf),
            \width, ~numSpeakers,
            \out, ~bus[\master],
        );
    );        
)

// Pdef(\tibetBellKlank).play;
// Pdef(\tibetBellKlank).stop;
