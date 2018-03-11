(
    var phrases = ();
    var dur = 4 ! 6 ++ 8;
    var melody = [
        3, 2, -1, 0, 3, 2, 4,
        3, 2, -1, 0, 3, 2, 6,
        3, 2, -1, -4, 3, 6, 4,
        3, 2, -1, 2, 3, 2, 8,
        3, 2, -1, 0 , 3, 2, 4,
        3, 2, -1, 0, 3, 2, 6,
        3, 2, -1, -4, 3, 6, 4,
        3, 2, -1, 2, 3, 2, 8,
    ];

    phrases.put(\klank,
        Pbind(
            \instrument, \klank,
            \group, ~group[\instr],
            \octave, 4,
            \scale, Scale.minor,
            \degree, Pseq(melody),
            \dur, Pseq(dur, inf),
            // \db, -15,
            \db, Pseries.fromEndpoints(-50, -15, 64),
            \attack, 2, 
            \rel, Pkey(\dur) * 4,
            \spread, Pwhite(1.995, 2.005, inf),
            \out, ~bus[\master],
            \fx1, ~bus[\jpverb],
            \fx1lvl, Pexprand(-24.dbamp, -3.dbamp, inf),
            \pan, Pwhite(-1.0, 1.0, inf),
        )
    );

    phrases.put(\klang,
        Pbind(
            \instrument, \klang,
            \group, ~group[\instr],
            \octave, 3,
            \scale, Scale.minor,
            \degree, Pseq(melody),
            \dur, Pseq(dur, inf),
            \db, Pseries.fromEndpoints(-50, -12, 64),
            \attack, 3,
            \rel, Pkey(\dur) * 4,
            \spread, Pwhite(1.995, 2.005, inf),
            \out, ~bus[\master],
            \fx1, ~bus[\jpverb],
            \fx1lvl, Pexprand(-24.dbamp, -3.dbamp, inf),
            \pan, Pwhite(-1.0, 1.0, inf),
        )
    );


    Pdef(\ryuish,
        Psym(
            Pseq([[\klank, \klang]]), phrases
        )
    );
)

// Pdef(\ryuish).play;
// Pdef(\ryuish).stop;
