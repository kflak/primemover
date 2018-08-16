(
    Pdef(\pinkNoiseBreath, 
        Pbind(
            \instrument, \bpnoise,
            \freq, [55, 110],
            \rq, [0.1, 0.2],
            \db, -42,
            \dur, 6,
            \pan, Pwhite(-1.0, 1.0),
            \out, ~bus[\master],
            \group, ~group[\instr],
            \hipassfreq, 40,
            \attack, Pkey(\dur) * 0.7,
            \rel, Pkey(\dur) * 0.8,
            \fx1, ~bus[\jpverb],
            \fx1lvl, -20.dbamp,
        )
    );
)

// Pdef(\breath).play;
// Pdef(\breath).stop;

