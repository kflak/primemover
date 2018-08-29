(
    Pdef(\darknessBreathFadeIn, 
        Pbind(
            \instrument, \bpnoise,
            \freq, [55, 110],
            \rq, [0.1, 0.2],
            \db, Pseq([Pseries.fromEndpoints(-60, 0, 4), Pwhite(-10, -5)]),
            \dur, 16,
            \pan, Pwhite(-1.0, 1.0),
            \out, ~bus[\master],
            \group, ~group[\instr],
            \hipassfreq, 40,
            \attack, Pkey(\dur) * 0.9,
            \rel, Pkey(\dur) * 0.01,
            \fx1, ~bus[\jpverb],
            \fx1lvl, -20.dbamp,
        )
    );

    Pdef(\darknessSub,
        Pbind(
            \instrument, \fm,
            \group, ~group[\instr],
            \db, -45,
            \carfreq, 50,
            \modfreq, Pwhite(48, 52),
            \moddepth, Pexprand(5, 50),
            \dur, Pexprand(10.0, 15.0),
            \rel, Pkey(\dur) * 3,
            \attack, Pkey(\dur),
            \modattack, Pkey(\attack),
            \modrel, Pkey(\rel),
            \pan, Pwhite(-1.0, 1.0), 
            \out, ~bus[\master],
            \fx1, ~bus[\jpverb], 
            \fx1lvl, Pwhite(-10.dbamp, -5.dbamp),
            \fx2, ~bus[\grdelayMedium],
            \fx2lvl, -5.dbamp,
        )
    );

    Pdef(\darknessVanaema, 
        Pbind(
            \instrument, \clean,
            \buf, Pxrand(~buffers[\vanaemaStory], inf),
            \group, ~group[\instr],
            \db, -15,
            \dur, Pfunc({|ev| ev.buf.duration}),
            \rel, Pkey(\dur) * 1.5,
            \attack, Pkey(\dur) * 0.5,
            \ratio, 8,
            \loop, 0,
            \gain, 9.dbamp,
            \thresh, -20.dbamp,
            \rate, 1,
            \pan, Pwhite(-1.0, 1.0), 
            \hipassfreq, 600,
            \lopassfreq, 600,
            \out, ~bus[\master],
            \fx1, ~bus[\jpverb], 
            \fx1lvl, Pwhite(-10.dbamp, -5.dbamp),
            \fx2, ~bus[\grdelayMedium], 
            \fx2lvl, Pwhite(-20.dbamp, -15.dbamp),
        )
    );

    Pdef(\darknessTibet,
        Pbind(
            \instrument, \klankTibet,
            \group, ~group[\instr],
            \dur, Pexprand(8.0, 12.0),
            \attack, Pkey(\dur) * 0.8,
            \rel, 0,
            \freq, 1200,
            \harms, Pfunc({[0.5, 1] ++ {exprand(0.2, 4)} ! 4}), 
            \db, -30,
            \fx1, ~bus[\jpverb],
            \fx1lvl, -20.dbamp,
            \pan, Pwhite(-1.0, 1.0, inf),
            \width, ~numSpeakers,
            \out, ~bus[\master],
        )
    );        

    Pdef(\darknessBlips,
        Pbind(
            \instrument, \sineGrainTrain,
            \group, ~group[\instr],
            \freq, Pexprand(260, 800),
            \db, Pseq([Pseries.fromEndpoints(-80, -50, 10), Pwhite(-50, -30)]),
            \comblvl, -10.dbamp,
            \combdelay, Pwhite(0.001, 0.1),
            \grainfreq, Pwhite(1, 10),
            \grainsize, Pwhite(0.001, 0.01),
            \dur, Pexprand(1.5, 15.0),
            \pan, Pwhite(-1.0, 1.0),
            \fx1, ~bus[\jpverb],
            \fx1lvl, Pwhite(-6.dbamp, -3.dbamp),
            \out, ~bus[\master],
            \attack, Pwhite(5.0, 8.0),
            \rel, Pwhite(6.0, 15.0),
        )
    );

    Pdef(\darknessBlipsFaster,
        Pbind(
            \instrument, \sineGrainTrain,
            \group, ~group[\instr],
            \freq, 880, 
            \db, -25,
            \comblvl, 0.3,
            \combdelay, 0.001, 
            \grainfreq, Prand([8, 12, 16], inf),
            \combdecay, Pkey(\grainfreq).reciprocal * 4, 
            \grainsize, Pkey(\combdelay) * 0.01, 
            \dur, 2,
            \pan, Pwhite(-1.0, 1.0),
            \fx1, ~bus[\jpverb],
            \fx1lvl, Pwhite(-6.dbamp, -3.dbamp),
            \fx2, ~bus[\grdelayMedium],
            \fx2lvl, -6.dbamp,
            \out, ~bus[\master],
            \attack, Pkey(\dur),
            \rel, 0, 
        )
    );

    Tdef(\darkness, {
        Pdef(\darknessBreathFadeIn).play;
        Pdef(\darknessBlips).play;
        40.wait;
        Pdef(\darknessSub).play;
        5.wait;
        Pdef(\darknessVanaema).play;
        60.wait;
        Pdef(\darknessBlipsFaster).play;
        Pdef(\darknessBlips).stop;
    });
)

// (
//     Tdef(\darkness).stop;
//     Tdef(\darkness).reset;
//     Pdef(\darknessBlips).stop;
//     Pdef(\darknessBlipsFaster).stop;
//     Pdef(\darknessBreathFadeIn).stop;
//     Pdef(\darknessSub).stop;
//     Pdef(\darknessVanaema).stop;
//     Pdef(\darknessTibet).stop;
// )

// Tdef(\darkness).play;
// // s.meter;

// Pdef(\darknessTibet).play;
// Pdef(\darknessTibet).stop;
// Pdef(\darknessBlipsFaster).play;
// Pdef(\darknessBlipsFaster).stop;
