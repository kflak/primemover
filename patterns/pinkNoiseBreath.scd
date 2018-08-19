(
    var pan = 0;
    var panspeed = 0.1;

    Pdef(\pinkNoiseBreath, 
        Pbind(
            \instrument, \bpnoise_gate,
            \freq, [55, 110],
            \rq, 0.3,
            \db, [0, -10],
            \dur, 5.5,
            \pan, Pfunc({pan = pan + panspeed % 1.0}),
            \out, ~bus[\breath],
            \group, ~group[\instr],
            \hipassfreq, 60,
            \attack, Pkey(\dur) * 0.3,
            \rel, Pkey(\dur) * 0.1,
            // \fx1, ~bus[\jpverb],
            // \fx1lvl, -15.dbamp,
        )
    );

)
